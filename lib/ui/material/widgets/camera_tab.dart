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
          ? ResolutionPreset.medium
          : ResolutionPreset.high,
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
        setState(() {
          _scanResults = results;
        });
        _processResults(results);
      }).whenComplete(() => _isDetecting = false);
    });
    //await _startImageStream();
  }

  void _showDialog({
    int type,
    dynamic action,
  }) {
    showDialog(
      context: context,
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
            type != null
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
                action;
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
      _showDialog(
        type: 1,
        action: Navigator.of(context)
            .popAndPushNamed('/visitor', arguments: document),
      );
      //Navigator.of(context).popAndPushNamed('/visitor', arguments: document);
    } else {
      await updateVisitor(document, RepositoryProvider.of<VisitorDao>(context));
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text('Visitor Signed Out'),
      );
      // Find the Scaffold in the widget tree and use it to show a SnackBar.
      //Scaffold.of(context).showSnackBar(snackBar);
      _showDialog(
        action:
            Navigator.of(context).popAndPushNamed("/"),
      );
      Future.delayed(Duration(seconds: 2), () => Navigator.of(context).pop());
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
      child: _camera == null
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
