import 'package:flutter/material.dart';

import 'scan_button.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ScanBtn(
            navRoute: "Sign In",
            btnColor: Colors.green[300],
          ),
          ScanBtn(
            navRoute: "Sign Out",
            btnColor: Colors.blue[500],
          )
        ],
      ),
      //bottomNavigationBar: BottomNavigationBar(items: null),
    );
  }
}
