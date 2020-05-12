import 'package:flutter/material.dart';
import 'package:vsnap/ui/material/widgets/widgets.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "VSnap",
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: HomePage(),
    );
  }
}
