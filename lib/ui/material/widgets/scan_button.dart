import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'navigation.dart';

class ScanBtn extends StatelessWidget {
  final String navRoute;
  final Color btnColor;
  final EdgeInsets padding;

  const ScanBtn({Key key, this.navRoute, this.btnColor, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cameraArgs =
        CameraArguments(scanType: navRoute, permission: Permission.camera);
    return Expanded(
      child: Padding(
        padding: padding,
        child: Container(
          //padding: EdgeInsets.only(left: 16.0, right: 16.0),
          width: double.infinity,
          child: MaterialButton(
            color: btnColor,
            elevation: 0.0,
            onPressed: () {
              Navigator.of(context).pushNamed("/scan", arguments: cameraArgs);
            },
            child: Text(navRoute),
          ),
        ),
      ),
    );
  }
}
