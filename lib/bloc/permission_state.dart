part of 'permission_bloc.dart';

abstract class PermissionState extends Equatable {
  const PermissionState();
  @override
  List<Object> get props => [];
}

class PermissionInitial extends PermissionState {
}

class PermissionLoading extends PermissionState {
}

class PermissionGranted extends PermissionState {}

class PermissionRestricted extends PermissionState {}

class PermissionDenied extends PermissionState {}

class PermissionPermanentlyDenied extends PermissionState {}

class PermissionUndetermined extends PermissionState {}

class PermissionError extends PermissionState {}
