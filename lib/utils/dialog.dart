import 'package:flutter/material.dart';

Future<void> dialogue(
    {BuildContext context,
    String message,
    int type,
    String route,
    bool dismissable,
    bool successful,
    Object routeArgs}) {
  final _icon = successful == true
      ? Icon(Icons.check, color: Colors.green, size: 56)
      : Icon(
          Icons.alarm,
          color: Colors.orange,
          size: 56,
        );
  return showDialog(
    context: context,
    useRootNavigator: false,
    // should default to false
    barrierDismissible: dismissable, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
            height: 100,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    type == 1
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 56,
                          )
                        : _icon,
                    Text(
                      message,
                      style: TextStyle(fontSize: 24),
                    )
                  ]),
            )),
        actions: <Widget>[
          type == 1
              ? FlatButton(
                  color: Colors.red,
                  child: const Text('cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : null,
          FlatButton(
            color: Colors.green,
            child: const Text('continue'),
            onPressed: () {
              if (type == 0) {
                Navigator.of(context).popAndPushNamed("/");
              } else {
                //Navigator.of(context).pop();
                Navigator.of(context)
                    .popAndPushNamed(route, arguments: routeArgs);
              }
            },
          ),
        ],
      );
    },
  );
}
