part of 'permission_bloc.dart';

abstract class PermissionState extends Equatable {
  const PermissionState();
  @override
  List<Object> get props => [];
}

class PermissionInitial extends PermissionState {}

class PermissionLoading extends PermissionState {}

class PermissionGranted extends PermissionState {
  final bool _permissionResult;
  const PermissionGranted(this._permissionResult);

  @override
  List<Object> get props => [_permissionResult];

  @override
  String toString() =>
      'PermissionGranted(_permissionResult: $_permissionResult)';
}
