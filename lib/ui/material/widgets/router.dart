import 'package:flutter/material.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/ui/material/widgets/manual_visitor.dart';

import 'camera_page.dart';
import 'home_page.dart';
import 'navigation.dart';
import 'visitor_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/scan':
        // Validation of correct data type
        if (args is CameraArguments) {
          return MaterialPageRoute(
            builder: (context) => CameraPage(),
            settings: RouteSettings(
              arguments: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/visitor':
        if (args is Document) {
          return MaterialPageRoute(
            builder: (context) => VisitorPage(),
            settings: RouteSettings(
              arguments: args,
            ),
          );
        }
        return _errorRoute();
      case '/manual':
        return MaterialPageRoute(
          builder: (context) => ManualVisitor(),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
