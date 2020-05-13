import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/bloc/permission_bloc.dart';
import 'package:vsnap/ui/material/widgets/navigation.dart';
import 'package:vsnap/ui/material/widgets/permissions_tab.dart';

import 'camera_tab.dart';
import 'permission_error_tab.dart';

class CameraPage extends StatelessWidget {
  List<Permission> _permissions = [Permission.camera];
  CameraPage({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    CameraArguments args = ModalRoute.of(context).settings.arguments;
    return BlocProvider(
        create: (context) => PermissionBloc()
          ..add(RequestPermissions(
            permissions: _permissions,
          )),
        child: BlocBuilder<PermissionBloc, PermissionState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Camera'),
                elevation: 0.0,
              ),
              floatingActionButton: state == PermissionGranted() && args.scanType == "Sign In"
                  ? FloatingActionButton(
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed("/manual");
                      },
                    )
                  : null,
              body: BlocBuilder<PermissionBloc, PermissionState>(
                  builder: (BuildContext context, state) {
                if (state is PermissionInitial || state is PermissionLoading) {
                  return Container();
                } else if (state is PermissionGranted) {
                  return CameraPreviewScanner();
                } else if (state is PermissionDenied) {
                  return PermissionsTab(
                    permissions: _permissions,
                    message:
                        "Enable access so you can create, save and send report files",
                    action: "Enable Storage Access",
                  );
                } else if (state is PermissionPermanentlyDenied) {
                  return PermissionErrorTab(
                    message:
                        "You permenetly denied permissions for camera, to continue using our service go to your device setting and give us camera permissions",
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
            );
          },
        ));
  }
}
