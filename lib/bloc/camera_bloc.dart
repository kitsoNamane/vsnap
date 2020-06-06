import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:vsnap/data/local/camera_data_source.dart';
import 'package:vsnap/failures/mrtd_failure.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/services/mrtd.dart';

part 'camera_bloc.freezed.dart';
part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraDataSource camera;

  CameraBloc(this.camera);
  @override
  CameraState get initialState => CameraInitial();

  @override
  Stream<CameraState> mapEventToState(
    CameraEvent event,
  ) async* {
    yield* event.map(takePictureButtonPressed: (e) async* {
      yield CameraLoading();
      final pictureTakenFailureOrSuccess = await camera.takePicture();
      if (pictureTakenFailureOrSuccess.isRight()) {
        final picture =
            pictureTakenFailureOrSuccess.fold((failure) => null, (pic) => pic);
        final scanResult = await camera.scanImage(picture);
        yield PictureTaken(pictureScanned: scanResult, pictureTaken: picture, pictureSize: await _getImageSize(picture),);
      } else {
        yield CameraError();
      }
    }, decodeMRZ: (e) async* {
      final documentOrFailure = processText(camera.getBlocks(e.imageFile));
      yield ImageDecoded(documentOrFailure);
    }, resetCamera: (e) async* {
      yield CameraInitial();
    });
  }

  Future<Size> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    final Image image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    return imageSize;
  }

  Either<MRTDFailure, Document> processText(List<TextBlock> blocks) {
    for (TextBlock block in blocks) {
      final text = block.text.replaceAll(" ", "").trim();
      if (MRTD.isMRTD(text)) {
        final documentOrFailure = MRTD.decodeMRTD(text);
        return documentOrFailure;
      }
    }
  }
}
