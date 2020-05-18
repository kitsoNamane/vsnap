import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:vsnap/bloc/permission_bloc.dart';

class PermissionsTab extends StatelessWidget {
  final List<Permission> permissions;
  final String message;
  final String action;

  PermissionsTab({
    Key key,
    this.permissions,
    this.message,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Scan With VSnap"),
            //Text("Enable access so you can start scanning ID's"),
            Text(message),
            MaterialButton(
              //child: Text("Enable Camera Access"),
              child: Text(action),
              onPressed: () {
                //requestPermission(Permission.camera);
                BlocProvider.of<PermissionBloc>(context)
                    .add(RequestPermissions(permissions: permissions));
              },
            )
          ],
        ),
      ),
    );
  }
}
