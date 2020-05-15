import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vsnap/data/local/moor_database.dart';

import 'package:vsnap/models/detectors.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/utils/mrz.dart';
import 'package:vsnap/utils/scan_utils.dart';
import 'package:vsnap/utils/visitor_log.dart';

import 'custom_painter.dart';
import 'navigation.dart';

class CameraPreviewScanner extends StatefulWidget {
  @override
  _CameraPreviewScannerState createState() => _CameraPreviewScannerState();
}

class _CameraPreviewScannerState extends State<CameraPreviewScanner> {
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
          ? ResolutionPreset.high
          : ResolutionPreset.high,
      enableAudio: false,
    );
    await _camera.initialize();
    if (mounted) {
      setState(() {});
    }
    _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;
      _isDetecting = true;
      ScannerUtils.detect(
        image: image,
        detectInImage: _textRecognizer.processImage,
        imageRotation: description.sensorOrientation,
      ).then((dynamic results) async {
        if (_detector == null) return;
        setState(() {
          _scanResults = results;
        });
        await _processResults(results);
      }).whenComplete(() => _isDetecting = false);
    });
    //await _startImageStream();
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
          //title: Text('AlertDialog Title'),
          content: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Icon(Icons.check, color: Colors.green, size: 56),
                Text("Success")
              ])),
          actions: <Widget>[
            document != null
                ? FlatButton(
                    color: Colors.red,
                    child: Text('cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : null,
            FlatButton(
              color: Colors.green,
              child: Text('continue'),
              onPressed: () {
                if (document == null) {
                  Navigator.of(context).popAndPushNamed("/");
                } else {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushNamed('/visitor', arguments: document);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _scanType(Document document) async {
    CameraArguments args = ModalRoute.of(context).settings.arguments;
    if (args.scanType == "Sign In") {
      _showDialog(document);
    } else {
      await updateVisitor(document, RepositoryProvider.of<VisitorDao>(context));
      _showDialog(null);
    }
  }

  Future<void> _processResults(VisionText scanResults) async {
    if (scanResults == null) return;
    if (scanResults.blocks.isEmpty) return;
    for (TextBlock block in scanResults.blocks) {
      var mrtd = block.text.toUpperCase().replaceAll(" ", "").trim();
      if (isMRTD(mrtd)) {
        _isDetecting = true;
        var document = decodeMRTD(mrtd);
        await _scanType(document);
      }
    }
  }

  Widget _buildResults() {
    const noResults = Text('No results!');

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
                      child: Text('Loading Camera...'),
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
    _camera.dispose().then((_) {
      _textRecognizer.close();
    });
    _detector = null;
    super.dispose();
  }
}
