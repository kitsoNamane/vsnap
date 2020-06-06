part of 'camera_bloc.dart';

@freezed
abstract class CameraState with _$CameraState {
  const factory CameraState.cameraInitial() = CameraInitial;
  factory CameraState.pictureTaken(
      {
        @required dynamic pictureScanned,
      @required File pictureTaken,
      @required Size pictureSize}) = PictureTaken;
  factory CameraState.imageDecoded(
          Either<MRTDFailure, Document> imageDecodedFailureOrSuccess) =
      ImageDecoded;

  const factory CameraState.cameraLoading() = CameraLoading;
  const factory CameraState.cameraError() = CameraError;
}
