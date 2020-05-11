import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

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
