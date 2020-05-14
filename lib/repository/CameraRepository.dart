import 'package:camera/camera.dart';

class CameraRepository {
  final CameraController camera;

  CameraRepository({this.camera});

  Future<CameraController> getCamera() async {
    return camera;
  }
}
