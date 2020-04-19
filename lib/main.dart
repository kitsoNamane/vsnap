import 'package:flutter/material.dart';
import 'package:vsnap/utils/permissions_service.dart';
import 'package:vsnap/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Center(
            child: MaterialButton(
              color: Colors.yellow[300],
              child: Text('Request contacts permission'),
              onPressed: () {
                PermissionsService.getAppPermissions();
                Utils.myUtils();
              },
            ),
          ),
        ));
  }
}
