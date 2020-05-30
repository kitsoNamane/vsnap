import 'dart:async';
import 'dart:developer' as developer;

import 'package:camera/camera.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vsnap/ui/material/app.dart';
import 'package:vsnap/utils/scan_utils.dart';
import 'package:vsnap/data/local/database.dart';

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
  final firstCamera =
      await ScannerUtils.getCamera(dir: CameraLensDirection.back);
  final database = initDB();
  Crashlytics.instance.enableInDevMode = true;
  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runZoned(() async {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    runApp(AndroidApp(
      camera: firstCamera,
      database: await database,
    ));
  }, onError: Crashlytics.instance.recordError);
}
