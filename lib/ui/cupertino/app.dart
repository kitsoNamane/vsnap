import 'package:flutter/cupertino.dart';

class IOSApp extends StatelessWidget {
  const IOSApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("VSnap"),
        ),
        child: Container()),
    );
  }
}

