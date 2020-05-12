import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/bloc/permission_bloc.dart';
import 'package:vsnap/ui/material/widgets/permissions_tab.dart';

import 'camera_tab.dart';
import 'navigation.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key key}) : super(key: key);
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    CameraArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Camera'),
          elevation: 0.0,
        ),
        body: BlocProvider(
          create: (context) => PermissionBloc()
            ..add(RequestPermissions(
              permissions: [Permission.camera,],
            )),
          child: BlocBuilder<PermissionBloc, PermissionState>(
              builder: (BuildContext context, state) {
            if (state is PermissionInitial) {
              return Container();
            } else if (state is PermissionGranted) {
              if (state.props.first == false) {
                return PermissionsTab(
                  permissions: [Permission.camera],
                  message: "Enable access so you can start scanning ID's",
                  action: "Enable Camera Access",
                );
              } else {
                return CameraPreviewScanner();
              }
            } else {
              return Container();
            }
          }),
        ));
  }
}
