import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vsnap/failures/camera_failure.dart';

import 'package:vsnap/models/detectors.dart';

class CameraDataSource {
  final CameraDescription description;
  final CameraController camera;
  final Detector detector = Detector.text;
  final CameraLensDirection direction = CameraLensDirection.back;
  final bool enableAudio = false;
  final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();

  CameraDataSource({
    this.description,
    this.camera,
  });

  Future<Either<CameraFailure, File>> takePicture() async {
    try {
      final filePath = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      await camera.takePicture(filePath);
      return right(File(filePath));
    } catch (e) {
      return left(FailedToTakePicture());
    }
  }

  Future<dynamic> scanImage(File picture) async {
    final visionImage = FirebaseVisionImage.fromFile(picture);
    final results = await recognizer.processImage(visionImage);
    return results;
  }

  List<TextBlock> getBlocks(VisionText text) {
    return text.blocks;
  }
}
