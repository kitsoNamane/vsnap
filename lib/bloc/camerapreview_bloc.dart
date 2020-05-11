import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:vsnap/bloc/processresults_bloc.dart';
import 'package:vsnap/models/detectors.dart';
import 'package:vsnap/ui/material/widgets/scan_utils.dart';

import 'package:flutter/material.dart';
part 'camerapreview_event.dart';
part 'camerapreview_state.dart';

class CamerapreviewBloc extends Bloc<CameraPreviewEvent, CameraPreviewState> {
  dynamic _scanResults;
  CameraController _camera;
  Detector _detector = Detector.text;
  bool _isDetecting = false;
  CameraLensDirection _direction = CameraLensDirection.back;
  CameraDescription description;
  final ProcessResultsBloc processResultsBloc;

  final CameraLensDirection direction;
  TextRecognizer _textRecognizer = FirebaseVision.instance.textRecognizer();

  CamerapreviewBloc({this.direction, this.processResultsBloc});

  @override
  CameraPreviewState get initialState => CameraPreviewInitial();

  @override
  Stream<CameraPreviewState> mapEventToState(
    CameraPreviewEvent event,
  ) async* {
    if (event is CameraPreviewInit) {
      yield* _initializeCamera();
    } else if (event is CameraPreviewStream) {
      yield* _startImageStream();
    } else {
      yield CameraPreviewError();
    }
  }

  Stream<CameraPreviewState> _initializeCamera() async* {
    yield CameraPreviewLoading();
    description = await ScannerUtils.getCamera(direction);
    _camera = CameraController(
      description,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.low
          : ResolutionPreset.medium,
      enableAudio: false,
    );
    var result = await _camera.initialize().then((_) {
      return CameraPreviewLoaded();
    }).catchError((_) {
      return CameraPreviewError();
    });
    yield result;
  }

  Stream<CameraPreviewState> _startImageStream() async* {
    yield CameraPreviewStreaming();
    _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;

      _isDetecting = true;

      ScannerUtils.detect(
        image: image,
        detectInImage: _textRecognizer.processImage,
        imageRotation: description.sensorOrientation,
      )
          .then((dynamic results) {
            if (_detector == null) return CameraPreviewError();
            _scanResults = results;
            processResultsBloc.add(ProcessResultsEvent(results: _scanResults));
          })
          .catchError((_) => CameraPreviewError())
          .whenComplete(() => _isDetecting = false);
    });
  }

  @override
  Future<void> close() {
    _camera.dispose().then((_) {
      _textRecognizer.close();
    });
    _detector = null;
    super.close();
  }
}
