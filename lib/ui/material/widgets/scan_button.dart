import 'package:flutter/material.dart';

class ScanBtn extends StatelessWidget {
  final String navRoute;
  final Color btnColor;

  const ScanBtn({Key key, this.navRoute, this.btnColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:16.0, right: 16.0),
      width: double.infinity,
      child: MaterialButton(
        color: btnColor,
        elevation: 0.0,
        onPressed: () {
          print("go to scan screen");
        },
        child: Text(navRoute),
      ),
    );
  }
}
