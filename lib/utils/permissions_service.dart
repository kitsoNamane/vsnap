import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static var _permissions = [
    Permission.camera,
    Permission.locationWhenInUse,
    Permission.storage
  ];

  static Future<bool> requestPermission(Permission permission) async {
    // check if we have already granted permission
    var checkStatus = await hasPermission(permission);
    if (checkStatus) return true;

    // get permissions if not already granted
    var status = await permission.request();
    if (status == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  static Future<bool> hasPermission(Permission permission) async {
    var status = await permission.status;
    if (status == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  static Future<bool> getAppPermissions() async {
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    statuses.forEach((key, value) {
      if (value != PermissionStatus.granted) {
        return false;
      }
    });
    return true;
  }
}
