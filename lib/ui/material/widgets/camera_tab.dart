import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vsnap/data/local/moor_database.dart';

import 'package:vsnap/models/detectors.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/utils/mrz.dart';
import 'package:vsnap/utils/visitor_log.dart';

import 'custom_painter.dart';
import 'navigation.dart';
import 'scan_utils.dart';

class CameraPreviewScanner extends StatefulWidget {
  @override
  _CameraPreviewScannerState createState() => _CameraPreviewScannerState();
}

class _CameraPreviewScannerState extends State<CameraPreviewScanner> {
  dynamic _scanResults;
  CameraController _camera;
  Detector _detector = Detector.text;
  bool _isDetecting = false;
  CameraLensDirection _direction = CameraLensDirection.back;

  final TextRecognizer _textRecognizer =
      FirebaseVision.instance.textRecognizer();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final CameraDescription description =
        await ScannerUtils.getCamera(_direction);
    _camera = CameraController(
      description,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.veryHigh
          : ResolutionPreset.ultraHigh,
      enableAudio: false,
    );
    await _camera.initialize();

    _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;

      _isDetecting = true;

      ScannerUtils.detect(
        image: image,
        detectInImage: _textRecognizer.processImage,
        imageRotation: description.sensorOrientation,
      ).then((dynamic results) {
        if (_detector == null) return;
        _processResults(results);
        setState(() {
          _scanResults = results;
        });
      }).whenComplete(() => _isDetecting = false);
    });
  }

  void _scanType(Document document) {
    CameraArguments args = ModalRoute.of(context).settings.arguments;
    if (args.scanType == "Sign In") {
      Navigator.of(context).pushNamed('/visitor', arguments: document);
    } else {
      var updated = updateVisitor(document, RepositoryProvider.of<VisitorDao>(context));
      Navigator.of(context).pop();
    }
  }

  void _processResults(VisionText scanResults) {
    if (scanResults == null) return;
    if (scanResults.blocks.isEmpty) return;
    for (TextBlock block in scanResults.blocks) {
      var mrtd = block.text.toUpperCase().replaceAll(" ", "").trim();
      if (isMRTD(mrtd)) {
        var document = decodeMRTD(mrtd);
        if (document == null) return;
        _scanType(document);
      }
    }
  }

  Widget _buildResults() {
    const noResults = Text('No results!');

    if (_scanResults == null ||
        _camera == null ||
        !_camera.value.isInitialized) {
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
      constraints: BoxConstraints.expand(),
      child: _camera == null
          ? Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(strokeWidth: 2.0),
                    Text('Loading Camera...')
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
