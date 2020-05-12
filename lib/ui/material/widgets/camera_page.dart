import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/bloc/permission_bloc.dart';
import 'package:vsnap/ui/material/widgets/permissions_tab.dart';

import 'camera_tab.dart';
import 'navigation.dart';
import 'permission_error_tab.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key key}) : super(key: key);
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  List<Permission> _permissions = [Permission.camera];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Camera'),
          elevation: 0.0,
        ),
        body: BlocProvider(
          create: (context) => PermissionBloc()
            ..add(RequestPermissions(
              permissions: _permissions,
            )),
          child: BlocBuilder<PermissionBloc, PermissionState>(
              builder: (BuildContext context, state) {
            if (state is PermissionInitial || state is PermissionLoading) {
              return Container();
            } else if (state is PermissionGranted) {
              return CameraPreviewScanner();
            } else if (state is PermissionDenied) {
              return PermissionsTab(
                permissions:_permissions,
                message:
                    "Enable access so you can create, save and send report files",
                action: "Enable Storage Access",
              );
            } else if (state is PermissionPermanentlyDenied) {
              return PermissionErrorTab(
                message:
                    "You permenetly denied permissions for camera, to continue using our service go to your device setting and give us storage permissions",
              );
            } else if (state is PermissionRestricted) {
              return PermissionErrorTab(
                message:
                    "Your Admin/Guardian has restricted camera permissions, contact them to give you access",
              );
            } else {
              return PermissionErrorTab(
                message:
                    "Something went wrong, contact our admin at kitso@abstractclass.co",
              );
            }
          }),
        ));
  }
}
