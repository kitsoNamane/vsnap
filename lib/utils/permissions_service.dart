import 'package:permission_handler/permission_handler.dart';

Future<PermissionStatus> requestPermissions(
    List<Permission> permissions) async {
  // check if we have already granted permission
  Future<PermissionStatus> state = Future.value(PermissionStatus.granted);
  Map<Permission, PermissionStatus> statuses = await permissions.request();
  statuses.forEach((key, value) {
    if (value != PermissionStatus.granted) {
      state = Future.value(value);
      return;
    }
  });
  return state;
}

Future<bool> hasPermission(Permission permission) async {
  var status = await permission.status;
  if (status == PermissionStatus.granted) {
    return true;
  }
  return false;
}