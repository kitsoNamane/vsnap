import 'dart:async';
import 'dart:isolate';
import 'dart:developer' as developer;

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isolate_handler/isolate_handler.dart';
import 'package:vsnap/bloc/visitor_bloc.dart';

import 'package:vsnap/models/detectors.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/repository/visitor_repository.dart';
import 'package:vsnap/services/mrtd.dart';
import 'package:vsnap/ui/material/navigation/navigation_args.dart';
import 'package:vsnap/ui/material/widgets/custom_painter.dart';
import 'package:vsnap/utils/dialog.dart';
import 'package:vsnap/utils/scan_utils.dart';

class CameraIsolateArgs {
  final Detector detector;
  final CameraDescription description;
  final TextRecognizer textRecognizer;
  bool isDetecting;
  final CameraController camera;

  CameraIsolateArgs(
      {this.camera,
      this.description,
      this.textRecognizer,
      this.detector,
      this.isDetecting});
}

class CameraPreviewTab extends StatefulWidget {
  @override
  _CameraPreviewTabState createState() => _CameraPreviewTabState();
}

class _CameraPreviewTabState extends State<CameraPreviewTab> {
  StreamSubscription visitorSubscription;
  dynamic _scanResults;
  CameraController _camera;

  Detector _detector = Detector.text;
  bool _isDetecting = false;
  CameraDescription description;
  final TextRecognizer _textRecognizer =
      FirebaseVision.instance.textRecognizer();
  CameraArguments _args;
  CameraIsolateArgs isolateArgs;
  int path = 1000;

  // isolate camera stream
  final isolates = IsolateHandler();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    //await _startCameraStream();
    isolateArgs = CameraIsolateArgs(
      description: description,
      textRecognizer: _textRecognizer,
      detector: _detector,
      isDetecting: _isDetecting,
      camera: _camera,
    );

    isolates.spawn<CameraIsolateArgs>(entryPoint,
        errorsAreFatal: true,
        // Here we give a name to the isolate, by which we can access is later,
        // for example when sending it data and when disposing of it.
        name: 'cameraStream',
        // onReceive is executed every time data is received from the spawned
        // isolate. We will let the setPath function deal with any incoming
        // data.
        onReceive: setScanResults,
        // Executed once when spawned isolate is ready for communication. We will
        // send the isolate a request to perform its task right away.
        onInitialized: () => isolates.send(isolateArgs, to: 'cameraStream'));
  }

  void _initializeCamera() async {
    description = RepositoryProvider.of<CameraDescription>(context);
    _camera = CameraController(
      description,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.medium
          : ResolutionPreset.high,
      enableAudio: false,
    );
    await _camera.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  void setScanResults(dynamic results) {
    setState(() {
      //_scanResults = results;
      path = results;
    });
    isolates.kill('cameraStream');
  }

  void _scanType(Document document) async {
    _args = ModalRoute.of(context).settings.arguments;
    if (_args.scanType == "Sign In") {
      Navigator.of(context).popAndPushNamed("/visitor", arguments: document);
    } else {
      //await updateVisitor(document, RepositoryProvider.of<VisitorDao>(context));
      final _visitorBloc =
          VisitorBloc(RepositoryProvider.of<VisitorRepository>(context));
      _visitorBloc.add(VisitorSignOut(document));
      visitorSubscription = _visitorBloc.asBroadcastStream().listen((state) {
        if (state is VisitorSignedOut) {
          final result = state.signOutFailureOrSuccessOption
              .fold(() => false, (r) => r.fold((l) => false, (r) => true));
          if (result) {
            //_showDialog(null);
            dialogue(
              message: "success",
              type: 0,
              successful: true,
              dismissable: false,
            );
          } else {
            // show appropriate error
            dialogue(
              message: "Sign Failed, try again later",
              type: 0,
              successful: false,
              dismissable: false,
            );
          }
        }
      });
    }
  }

  Future<void> _processResults(VisionText scanResults) async {
    if (scanResults == null) return;
    if (scanResults.blocks.isEmpty) return;
    for (TextBlock block in scanResults.blocks) {
      var mrtd = block.text.toUpperCase().replaceAll(" ", "").trim();
      if (isMRTD(mrtd)) {
        final document = decodeMRTD(mrtd);
        if (document == null) return;
        _scanType(document);
      }
    }
  }

  Widget _buildResults() {
    final noResults = Text("no results ${path.toString()}");

    if (_scanResults == null ||
        _camera == null ||
        !_camera.value.isInitialized) {
      //return Container(color: Colors.transparent);
      return noResults;
    }

    CustomPainter painter;
    final Size imageSize = Size(
      _camera.value.previewSize.height,
      _camera.value.previewSize.width,
    );

    assert(_detector == Detector.text || _detector == Detector.cloudText);
    if (_scanResults is! VisionText) return noResults;
    painter = TextDetectorPainter(imageSize, _scanResults);

    return CustomPaint(
      painter: painter,
    );
  }

  Widget _buildImage() {
    return Container(

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
      constraints: BoxConstraints.expand(),
      child: _camera == null
          ? Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(strokeWidth: 2.0),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text('Loading Camera...'),
                    )
                  ]),
            )
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CameraPreview(_camera),
                _buildResults(),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }

  @override
  void dispose() {
    if (_args.scanType == 'Sign Out') visitorSubscription.cancel();
    isolates.kill('cameraStream');
    _camera.dispose().then((_) {
      _textRecognizer.close();
    });
    _detector = null;
    super.dispose();
  }
}

void entryPoint(SendPort context) {
  final messenger = HandledIsolate.initialize(context);
  // Triggered every time data is received from the main isolate.
  messenger.listen((cameraArgs) async {
    // Use a plugin to get some new value to send back to the main isolate.
    //final dir = await getApplicationDocumentsDirectory();
    //messenger.send(camera + dir.path);
    //messenger.send(cameraArgs + 500);
    await cameraArgs.camera.startImageStream((CameraImage image) async {
      developer.log("CameraArguments Initialized, now processing Image",
          name: "AppMain");
      if (cameraArgs.isDetecting) return;
      cameraArgs.isDetecting = true;
      ScannerUtils.detect(
        image: image,
        detectInImage: cameraArgs.textRecognizer.processImage,
        imageRotation: cameraArgs.description.sensorOrientation,
      ).then((dynamic results) {
        if (cameraArgs.detector == null) return;
        messenger.send(results);
      }).whenComplete(() => cameraArgs.isDetecting = false);
    });
  });
}
