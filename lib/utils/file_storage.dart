import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<Directory> get _localPath async {
  if (Platform.isAndroid) {
    final directory = await getExternalStorageDirectory();
    return directory;
  }
  final directory = await getApplicationSupportDirectory();
  return directory;
}

// get application directory
String getAppDir() {
  String _appDir;
  _localPath.then((dir) {
    _appDir = dir.path;
  });
  return _appDir;
}

// will create a new file if doesn't exist
Future<File> getFile(String filename) async {
  final path = await _localPath.then((dir) {
    return dir.path;
  });
  return File("$path/$filename").create();
}

Future<void> removeAllFiles() {
  final _directory = _localPath;
  _directory.then((dir) {
    dir.list(recursive: false).forEach((dirItem) {
      dirItem.delete(recursive: false);
    });
  });
}