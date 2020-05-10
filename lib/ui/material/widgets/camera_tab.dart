import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

enum Detector { barcode, face, label, cloudLabel, text, cloudText }

class ScannerUtils {
  ScannerUtils._();

  static Future<CameraDescription> getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  static Future<dynamic> detect({
    @required CameraImage image,
    @required Future<dynamic> Function(FirebaseVisionImage image) detectInImage,
    @required int imageRotation,
  }) async {
    return detectInImage(FirebaseVisionImage.fromBytes(
      _concatenatePlanes(image.planes),
      _buildMetaData(image, _rotationIntToImageRotation(imageRotation)),
    ));
  }

  static Uint8List _concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }

  static FirebaseVisionImageMetadata _buildMetaData(
    CameraImage image,
    ImageRotation rotation,
  ) {
    return FirebaseVisionImageMetadata(
      rawFormat: image.format.raw,
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: rotation,
      planeData: image.planes.map(
        (Plane plane) {
          return FirebaseVisionImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList(),
    );
  }

  static ImageRotation _rotationIntToImageRotation(int rotation) {
    switch (rotation) {
      case 0:
        return ImageRotation.rotation0;
      case 90:
        return ImageRotation.rotation90;
      case 180:
        return ImageRotation.rotation180;
      default:
        assert(rotation == 270);
        return ImageRotation.rotation270;
    }
  }
}
class TextDetectorPainter extends CustomPainter {
  final Size absoluteImageSize;
  final VisionText visionText;
  TextDetectorPainter(this.absoluteImageSize, this.visionText);

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / absoluteImageSize.width;
    final double scaleY = size.height / absoluteImageSize.height;

    Rect scaleRect(TextContainer container) {
      return Rect.fromLTRB(
        container.boundingBox.left * scaleX,
        container.boundingBox.top * scaleY,
        container.boundingBox.right * scaleY,
        container.boundingBox.bottom * scaleY,
      );
    }

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          paint.color = Colors.greenAccent;
          canvas.drawRect(scaleRect(element), paint);
        }
        paint.color = Colors.blueAccent;
        canvas.drawRect(scaleRect(line), paint);
      }
      paint.color = Colors.deepPurpleAccent;
      canvas.drawRect(scaleRect(block), paint);
    }
  }

  @override
  bool shouldRepaint(TextDetectorPainter oldDeletgate) {
    return oldDeletgate.absoluteImageSize != absoluteImageSize ||
        oldDeletgate.visionText != visionText;
  }
}

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
          ? ResolutionPreset.low
          : ResolutionPreset.medium,
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
          // process text here
          _scanResults = results;
        });
      }).whenComplete(() => _isDetecting = false);
    });
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