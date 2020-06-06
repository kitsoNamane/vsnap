import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/bloc/permission_bloc.dart';
import 'package:vsnap/ui/material/navigation/navigation_args.dart';
import 'package:vsnap/ui/material/tabs/permission_error_tab.dart';
import 'package:vsnap/ui/material/tabs/permissions_tab.dart';

class CameraPage extends StatelessWidget {
  CameraPage({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    List<Permission> _permissions = [Permission.camera];
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
                title: const Text('Camera Permissions'),
                elevation: 0.0,
              ),
              body: BlocConsumer<PermissionBloc, PermissionState>(
                  builder: (BuildContext context, state) {
                if (state is PermissionInitial || state is PermissionLoading || state is PermissionGranted) {
                  return Container();
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
              }, listener: (BuildContext context, PermissionState state) {
                if (state is PermissionGranted) {
                  Navigator.of(context).popAndPushNamed("/scan_picture", arguments: args.scanType);
                }
              }
            ),
          );
        }
      )
    );
  }
}
