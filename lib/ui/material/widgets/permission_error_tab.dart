import 'package:flutter/material.dart';

class PermissionErrorTab extends StatelessWidget {
  final message;
  const PermissionErrorTab({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          message,
          softWrap: true,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
