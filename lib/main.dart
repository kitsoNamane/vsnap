import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vsnap/data/local/camera_data_source.dart';
import 'package:vsnap/repository/CameraRepository.dart';
import 'package:vsnap/ui/ui.dart';
import 'dart:developer' as developer;

import 'package:vsnap/utils/scan_utils.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    developer.log("$event", name: "AppMain");
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    developer.log("$transition", name: "AppMain");
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    developer.log("$error", name: "AppMain");
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firstCamera = await ScannerUtils.getCamera();
  final _camera = await CameraDataSource(
    description: firstCamera,
  ).getCamera();
  final camera = CameraRepository(camera: _camera);
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(AndroidApp(camera: camera));
}
