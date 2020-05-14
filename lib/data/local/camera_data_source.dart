import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

import 'package:vsnap/models/detectors.dart';

class CameraDataSource {
  final CameraDescription description;
  CameraController camera;
  Detector detector = Detector.text;
  CameraLensDirection direction = CameraLensDirection.back;
  bool enableAudio = false;

  CameraDataSource({
    this.description,
    this.camera,
    this.detector,
    this.direction,
    this.enableAudio,
  });

  Future<CameraController> getCamera() async {
    camera = CameraController(
      description,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.medium
          : ResolutionPreset.medium,
      enableAudio: false,
    );
    return await camera.initialize().then((value) => camera);
  }
}
