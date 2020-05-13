import 'package:flutter/material.dart';

class PermissionErrorTab extends StatelessWidget {
  final message;
  const PermissionErrorTab({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              message,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.all(16),
            child: Text("home page"),
            onPressed: () => Navigator.of(context).popAndPushNamed(
              "/",
            ),
          ),
        ],
      ),
    );
  }
}
