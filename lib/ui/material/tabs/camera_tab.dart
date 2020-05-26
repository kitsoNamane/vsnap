import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vsnap/models/detectors.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/repository/visitor_repository.dart';
import 'package:vsnap/ui/material/navigation/navigation_args.dart';
import 'package:vsnap/ui/material/widgets/custom_painter.dart';
import 'package:vsnap/utils/mrz.dart';
import 'package:vsnap/utils/scan_utils.dart';

class CameraPreviewTab extends StatefulWidget {
  @override
  _CameraPreviewTabState createState() => _CameraPreviewTabState();
}

class _CameraPreviewTabState extends State<CameraPreviewTab> {
  dynamic _scanResults;
  CameraController _camera;
  Detector _detector = Detector.text;
  bool _isDetecting = false;
  CameraDescription description;

  final TextRecognizer _textRecognizer =
      FirebaseVision.instance.textRecognizer();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
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
    await _startCameraStream();
  }

  Future<void> _startCameraStream() async {
    _camera.startImageStream((CameraImage image) async {
      if (_isDetecting) return;
      _isDetecting = true;
      ScannerUtils.detect(
        image: image,
        detectInImage: _textRecognizer.processImage,
        imageRotation: description.sensorOrientation,
      ).then((dynamic results) {
        if (_detector == null) return;
        setState(() {
          _scanResults = results;
        });
        _processResults(results);
      }).whenComplete(() => _isDetecting = false);
    });
  }

  void _showDialog(
    Document document,
  ) {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
              height: 100,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.check, color: Colors.green, size: 56),
                      const Text(
                        "Success",
                        style: TextStyle(fontSize: 24),
                      )
                    ]),
              )),
          actions: <Widget>[
            document != null
                ? FlatButton(
                    color: Colors.red,
                    child: const Text('cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : null,
            FlatButton(
              color: Colors.green,
              child: const Text('continue'),
              onPressed: () {
                if (document == null) {
                  Navigator.of(context).popAndPushNamed("/");
                } else {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .popAndPushNamed('/visitor', arguments: document);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _scanType(Document document) async {
    CameraArguments args = ModalRoute.of(context).settings.arguments;
    if (args.scanType == "Sign In") {
      Navigator.of(context).popAndPushNamed("/visitor", arguments: document);
    } else {
      //await updateVisitor(document, RepositoryProvider.of<VisitorDao>(context));
      await RepositoryProvider.of<VisitorRepository>(context)
          .visitorSignOut(document.primaryId);
      _showDialog(null);
    }
  }

  void _processResults(VisionText scanResults) async {
    if (scanResults == null) return;
    if (scanResults.blocks.isEmpty) return;
    for (TextBlock block in scanResults.blocks) {
      var mrtd = block.text.toUpperCase().replaceAll(" ", "").trim();
      if (isMRTD(mrtd)) {
        _camera.stopImageStream();
        setState(() {
          _isDetecting = true;
        });
        var document = decodeMRTD(mrtd);
        if (document == null) return;
        _scanType(document);
      }
    }
  }

  Widget _buildResults() {
    const noResults = const Text('No results!');

    if (_scanResults == null ||
        _camera == null ||
        !_camera.value.isInitialized) {
      return Container(color: Colors.transparent);
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
      constraints: BoxConstraints.expand(),
      child: !_camera.value.isInitialized
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
    _camera.stopImageStream();
    _camera.dispose().then((_) {
      _textRecognizer.close();
    });
    _detector = null;
    super.dispose();
  }
}
