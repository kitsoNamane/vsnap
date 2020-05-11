part of 'camerapreview_bloc.dart';

abstract class CameraPreviewEvent extends Equatable {
  const CameraPreviewEvent();
  @override
  List<Object> get props => [];
}

class CameraPreviewInit extends CameraPreviewEvent {}

class CameraPreviewStream extends CameraPreviewEvent {}

class CameraPreviewPause extends CameraPreviewEvent {}

class CameraPreviewStop extends CameraPreviewEvent {}
