import 'package:permission_handler/permission_handler.dart';

var _permissions = [
  Permission.camera,
  Permission.locationWhenInUse,
  Permission.storage
];

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

Future<bool> getAppPermissions() async {
  Map<Permission, PermissionStatus> statuses = await _permissions.request();
  statuses.forEach((key, value) {
    if (value != PermissionStatus.granted) {
      return Future.value(false);
    }
  });
  return Future.value(true);
}
