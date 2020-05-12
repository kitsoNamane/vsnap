
part of 'permission_bloc.dart';

abstract class PermissionEvent extends Equatable {
  const PermissionEvent();
  @override
  List<Object> get props => [];
}

class RequestPermissions extends PermissionEvent {
  final List<Permission> permissions;
  RequestPermissions({
    @required this.permissions,
  });
  @override
  List<Object> get props => [permissions];
}
