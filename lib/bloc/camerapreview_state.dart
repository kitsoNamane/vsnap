part of 'camerapreview_bloc.dart';

abstract class CameraPreviewState extends Equatable {
  const CameraPreviewState();
  @override
  List<Object> get props => [];
}

class CameraPreviewInitial extends CameraPreviewState {}

class CameraPreviewLoading extends CameraPreviewState {}
class CameraPreviewLoaded extends CameraPreviewState {}

class CameraPreviewStreaming extends CameraPreviewState {}

class CameraPreviewPaused extends CameraPreviewState {}

class CameraPreviewStoped extends CameraPreviewState {}

class CameraPreviewError extends CameraPreviewState {}