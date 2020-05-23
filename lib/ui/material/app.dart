import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/repository/visitor_repository.dart';

import 'navigation/router.dart';
import 'pages/home_page.dart';

class AndroidApp extends StatelessWidget {
  final CameraDescription camera;
  const AndroidApp({
    Key key,
    this.camera,
  }) : assert(camera != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => VisitorRepository(AppDatabase().visitorDao)),
        RepositoryProvider(create: (context) => camera),
      ],
      child: MaterialApp(
        title: "VSnap",
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: HomePage(),
        //theme: abstractClassThemeData,
      ),
    );
    /*
    return RepositoryProvider(
      create: (context) => AppDatabase().visitorDao,
      child: MaterialApp(
        title: "VSnap",
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: HomePage(),
      ),
    );
    */
  }
}
