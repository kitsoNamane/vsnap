part of 'camera_bloc.dart';

@freezed
abstract class CameraEvent with _$CameraEvent {
  const factory CameraEvent.takePictureButtonPressed() =
      TakePictureButtonPressed;
  const factory CameraEvent.decodeMRZ(dynamic imageFile) = DecodeMRZ;
  const factory CameraEvent.resetCamera() = ResetCamera;
}
