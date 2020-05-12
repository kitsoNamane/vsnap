import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vsnap/bloc/permission_bloc.dart';

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
          create: (context) => PermissionBloc(permission: args.permission)
            ..add(RequestPermission()),
          child: BlocBuilder<PermissionBloc, PermissionState>(
              builder: (BuildContext context, state) {
            if (state is PermissionInitial) {
              return Container();
            } else if (state is PermissionGranted) {
              if (state.props.first == false) {
                return CameraPermissionTab();
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

class CameraPermissionTab extends StatelessWidget {
  const CameraPermissionTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Scan With VSnap"),
            Text("Enable access so you can start scanning ID's"),
            MaterialButton(
              child: Text("Enable Camera Access"),
              onPressed: () {
                //requestPermission(Permission.camera);
                BlocProvider.of<PermissionBloc>(context).add(RequestPermission());
              },
            )
          ],
        ),
      ),
    );
  }
}
