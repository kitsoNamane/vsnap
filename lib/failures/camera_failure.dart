import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_failure.freezed.dart';

@freezed
abstract class CameraFailure with _$CameraFailure {
  const factory CameraFailure.failedToTakePicture() = FailedToTakePicture;
  const factory CameraFailure.failedToWritePicture() = FailedToWritePicture;
}
