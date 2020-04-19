import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static var _permissions = [
    Permission.camera,
    Permission.locationWhenInUse,
    Permission.storage
  ];

  static Future<bool> _requestPermission(Permission permission) async {
    // check if we have already granted permission
    var checkStatus = await _hasPermission(permission);
    if (checkStatus) return true;

    // get permissions if not already granted
    var status = await permission.request();
    if (status == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  static Future<bool> _hasPermission(Permission permission) async {
    var status = await permission.status;
    if (status == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  static Future<bool> _requestCameraPermission() async {
    return _requestPermission(Permission.camera);
  }

  static Future<bool> _requestLocationPermission() async {
    return _requestPermission(Permission.locationWhenInUse);
  }

  static Future<bool> _requestFileReadWritePermission() async {
    return _requestPermission(Permission.storage);
  }

  static Future<bool> getAppPermissions() async {
    _permissions.forEach((permission) {
      _requestPermission(permission).then((onValue) {
        if (onValue == false) {
          return false;
        }
      }).catchError((onError) {
        print(onError.toString());
      });
    });
    return true;
  }
}
