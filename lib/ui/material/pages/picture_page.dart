import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vsnap/bloc/camera_bloc.dart';
import 'package:vsnap/bloc/visitor_bloc.dart';
import 'package:vsnap/data/local/camera_data_source.dart';
import 'package:vsnap/repository/visitor_repository.dart';
import 'package:vsnap/ui/material/widgets/custom_painter.dart';

class PicturePage extends StatefulWidget {
  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  CameraController _camera;
  CameraDescription _description;
  Future<void> initializeCameraFuture;
  StreamSubscription visitorSubscription;
  CustomPaint customPainter;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    _description = RepositoryProvider.of<CameraDescription>(context);
    _camera = CameraController(
      _description,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.medium
          : ResolutionPreset.high,
      enableAudio: false,
    );
    initializeCameraFuture = _camera.initialize();
  }

  Widget _buildImage(PictureTaken picture) {
    final image = Image.file(picture.pictureTaken).image;
    final painter =
        TextDetectorPainter(picture.pictureSize, picture.pictureScanned);
    return Container(
      child: CustomPaint(painter: painter),
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return BlocProvider(
        create: (context) => CameraBloc(
              CameraDataSource(
                description: _description,
                camera: _camera,
              ),
            ),
        child: BlocBuilder<CameraBloc, CameraState>(builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Camera"),
                elevation: 0,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: args == 'Sign In'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: FloatingActionButton(
                                  child: Icon(Icons.edit, color: Colors.white),
                                  heroTag: null,
                                  onPressed: () async {
                                    Navigator.of(context)
                                        .popAndPushNamed("/manual");
                                  })),
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: FloatingActionButton(
                                heroTag: null,
                                child: Icon(Icons.photo_camera,
                                    color: Colors.white),
                                onPressed: () async {
                                  BlocProvider.of<CameraBloc>(context)
                                      .add(TakePictureButtonPressed());
                                },
                              ))
                        ])
                  : FloatingActionButton(
                      heroTag: null,
                      child: Icon(Icons.photo_camera, color: Colors.white),
                      onPressed: () async {
                        BlocProvider.of<CameraBloc>(context)
                            .add(TakePictureButtonPressed());
                      },
                    ),
              body: BlocConsumer<CameraBloc, CameraState>(
                builder: (context, state) {
                  if (state is CameraInitial) {
                    return FutureBuilder<void>(
                      future: initializeCameraFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CameraPreview(_camera);
                        } else {
                          return Center(
                              child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ));
                        }
                      },
                    );
                  } else if (state is PictureTaken) {
                    BlocProvider.of<CameraBloc>(context)
                        .add(DecodeMRZ(state.pictureScanned));
                    return _buildImage(state);
                  } else if (state is CameraError) {
                    return CameraPreview(_camera);
                  } else if (state is CameraLoading) {
                    return Stack(
                      children: <Widget>[
                        CameraPreview(_camera),
                        Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ))
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
                listener: (context, state) {
                  if (state is ImageDecoded) {
                    final doc = state.imageDecodedFailureOrSuccess
                        .fold((failure) => null, (document) => document);
                    if (doc == null) {
                      //TODO: error popup
                      AwesomeDialog(
                            context: context,
                            title: "INFO",
                            dialogType: DialogType.WARNING,
                            animType: AnimType.BOTTOMSLIDE,
                            desc: "Failed to scan ID",
                            btnOkText: "try again",
                            padding: const EdgeInsets.all(16.0),
                            btnOkOnPress: () {
                              BlocProvider.of<CameraBloc>(context).add(ResetCamera());
                              Navigator.of(context).pop();
                            }).show();

                    } else if (args == 'Sign In') {
                      Navigator.of(context)
                          .popAndPushNamed("/visitor", arguments: doc);
                    } else {
                      final _visitorBloc = VisitorBloc(
                          RepositoryProvider.of<VisitorRepository>(context));
                      _visitorBloc.add(VisitorSignOut(doc));
                      visitorSubscription = _visitorBloc.listen((state) {
                        if (state is VisitorSignedOut) {
                          final results = state.signOutFailureOrSuccessOption
                              .fold(() => false, (result) => result.isRight());
                          if (results) {
                            AwesomeDialog(
                                context: context,
                                title: "INFO",
                                dialogType: DialogType.SUCCES,
                                animType: AnimType.BOTTOMSLIDE,
                                desc: "sign out successful",
                                btnOkText: "continue",
                                padding: const EdgeInsets.all(16.0),
                                btnOkOnPress: () {
                                  _visitorBloc.close();
                                  Navigator.of(context).popAndPushNamed('/');
                                }).show();
                          } else {
                            AwesomeDialog(
                                context: context,
                                title: "INFO",
                                dialogType: DialogType.WARNING,
                                animType: AnimType.BOTTOMSLIDE,
                                desc: "sign out failed",
                                btnCancelText: "cancel",
                                btnOkText: "try again",
                                padding: const EdgeInsets.all(16.0),
                                btnOkOnPress: () {
                                  BlocProvider.of<VisitorBloc>(context)
                                      .add(VisitorSignOut(doc));
                                },
                                btnCancelOnPress: () {
                                  _visitorBloc.close();
                                  Navigator.of(context).popAndPushNamed('/');
                                }).show();
                          }
                        }
                      });
                    }
                  }
                },
              ));
        }));
  }

  @override
  void dispose() {
    if (visitorSubscription != null) visitorSubscription.cancel();
    _camera.dispose();
    super.dispose();
  }
}
