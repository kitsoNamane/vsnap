// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'camera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CameraEventTearOff {
  const _$CameraEventTearOff();

  TakePictureButtonPressed takePictureButtonPressed() {
    return const TakePictureButtonPressed();
  }

  DecodeMRZ decodeMRZ(dynamic imageFile) {
    return DecodeMRZ(
      imageFile,
    );
  }

  ResetCamera resetCamera() {
    return const ResetCamera();
  }
}

// ignore: unused_element
const $CameraEvent = _$CameraEventTearOff();

mixin _$CameraEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result takePictureButtonPressed(),
    @required Result decodeMRZ(dynamic imageFile),
    @required Result resetCamera(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result takePictureButtonPressed(),
    Result decodeMRZ(dynamic imageFile),
    Result resetCamera(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result takePictureButtonPressed(TakePictureButtonPressed value),
    @required Result decodeMRZ(DecodeMRZ value),
    @required Result resetCamera(ResetCamera value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result takePictureButtonPressed(TakePictureButtonPressed value),
    Result decodeMRZ(DecodeMRZ value),
    Result resetCamera(ResetCamera value),
    @required Result orElse(),
  });
}

abstract class $CameraEventCopyWith<$Res> {
  factory $CameraEventCopyWith(
          CameraEvent value, $Res Function(CameraEvent) then) =
      _$CameraEventCopyWithImpl<$Res>;
}

class _$CameraEventCopyWithImpl<$Res> implements $CameraEventCopyWith<$Res> {
  _$CameraEventCopyWithImpl(this._value, this._then);

  final CameraEvent _value;
  // ignore: unused_field
  final $Res Function(CameraEvent) _then;
}

abstract class $TakePictureButtonPressedCopyWith<$Res> {
  factory $TakePictureButtonPressedCopyWith(TakePictureButtonPressed value,
          $Res Function(TakePictureButtonPressed) then) =
      _$TakePictureButtonPressedCopyWithImpl<$Res>;
}

class _$TakePictureButtonPressedCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res>
    implements $TakePictureButtonPressedCopyWith<$Res> {
  _$TakePictureButtonPressedCopyWithImpl(TakePictureButtonPressed _value,
      $Res Function(TakePictureButtonPressed) _then)
      : super(_value, (v) => _then(v as TakePictureButtonPressed));

  @override
  TakePictureButtonPressed get _value =>
      super._value as TakePictureButtonPressed;
}

class _$TakePictureButtonPressed
    with DiagnosticableTreeMixin
    implements TakePictureButtonPressed {
  const _$TakePictureButtonPressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CameraEvent.takePictureButtonPressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'CameraEvent.takePictureButtonPressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TakePictureButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result takePictureButtonPressed(),
    @required Result decodeMRZ(dynamic imageFile),
    @required Result resetCamera(),
  }) {
    assert(takePictureButtonPressed != null);
    assert(decodeMRZ != null);
    assert(resetCamera != null);
    return takePictureButtonPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result takePictureButtonPressed(),
    Result decodeMRZ(dynamic imageFile),
    Result resetCamera(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (takePictureButtonPressed != null) {
      return takePictureButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result takePictureButtonPressed(TakePictureButtonPressed value),
    @required Result decodeMRZ(DecodeMRZ value),
    @required Result resetCamera(ResetCamera value),
  }) {
    assert(takePictureButtonPressed != null);
    assert(decodeMRZ != null);
    assert(resetCamera != null);
    return takePictureButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result takePictureButtonPressed(TakePictureButtonPressed value),
    Result decodeMRZ(DecodeMRZ value),
    Result resetCamera(ResetCamera value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (takePictureButtonPressed != null) {
      return takePictureButtonPressed(this);
    }
    return orElse();
  }
}

abstract class TakePictureButtonPressed implements CameraEvent {
  const factory TakePictureButtonPressed() = _$TakePictureButtonPressed;
}

abstract class $DecodeMRZCopyWith<$Res> {
  factory $DecodeMRZCopyWith(DecodeMRZ value, $Res Function(DecodeMRZ) then) =
      _$DecodeMRZCopyWithImpl<$Res>;
  $Res call({dynamic imageFile});
}

class _$DecodeMRZCopyWithImpl<$Res> extends _$CameraEventCopyWithImpl<$Res>
    implements $DecodeMRZCopyWith<$Res> {
  _$DecodeMRZCopyWithImpl(DecodeMRZ _value, $Res Function(DecodeMRZ) _then)
      : super(_value, (v) => _then(v as DecodeMRZ));

  @override
  DecodeMRZ get _value => super._value as DecodeMRZ;

  @override
  $Res call({
    Object imageFile = freezed,
  }) {
    return _then(DecodeMRZ(
      imageFile == freezed ? _value.imageFile : imageFile as dynamic,
    ));
  }
}

class _$DecodeMRZ with DiagnosticableTreeMixin implements DecodeMRZ {
  const _$DecodeMRZ(this.imageFile) : assert(imageFile != null);

  @override
  final dynamic imageFile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CameraEvent.decodeMRZ(imageFile: $imageFile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CameraEvent.decodeMRZ'))
      ..add(DiagnosticsProperty('imageFile', imageFile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DecodeMRZ &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imageFile);

  @override
  $DecodeMRZCopyWith<DecodeMRZ> get copyWith =>
      _$DecodeMRZCopyWithImpl<DecodeMRZ>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result takePictureButtonPressed(),
    @required Result decodeMRZ(dynamic imageFile),
    @required Result resetCamera(),
  }) {
    assert(takePictureButtonPressed != null);
    assert(decodeMRZ != null);
    assert(resetCamera != null);
    return decodeMRZ(imageFile);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result takePictureButtonPressed(),
    Result decodeMRZ(dynamic imageFile),
    Result resetCamera(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (decodeMRZ != null) {
      return decodeMRZ(imageFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result takePictureButtonPressed(TakePictureButtonPressed value),
    @required Result decodeMRZ(DecodeMRZ value),
    @required Result resetCamera(ResetCamera value),
  }) {
    assert(takePictureButtonPressed != null);
    assert(decodeMRZ != null);
    assert(resetCamera != null);
    return decodeMRZ(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result takePictureButtonPressed(TakePictureButtonPressed value),
    Result decodeMRZ(DecodeMRZ value),
    Result resetCamera(ResetCamera value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (decodeMRZ != null) {
      return decodeMRZ(this);
    }
    return orElse();
  }
}

abstract class DecodeMRZ implements CameraEvent {
  const factory DecodeMRZ(dynamic imageFile) = _$DecodeMRZ;

  dynamic get imageFile;
  $DecodeMRZCopyWith<DecodeMRZ> get copyWith;
}

abstract class $ResetCameraCopyWith<$Res> {
  factory $ResetCameraCopyWith(
          ResetCamera value, $Res Function(ResetCamera) then) =
      _$ResetCameraCopyWithImpl<$Res>;
}

class _$ResetCameraCopyWithImpl<$Res> extends _$CameraEventCopyWithImpl<$Res>
    implements $ResetCameraCopyWith<$Res> {
  _$ResetCameraCopyWithImpl(
      ResetCamera _value, $Res Function(ResetCamera) _then)
      : super(_value, (v) => _then(v as ResetCamera));

  @override
  ResetCamera get _value => super._value as ResetCamera;
}

class _$ResetCamera with DiagnosticableTreeMixin implements ResetCamera {
  const _$ResetCamera();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CameraEvent.resetCamera()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CameraEvent.resetCamera'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResetCamera);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result takePictureButtonPressed(),
    @required Result decodeMRZ(dynamic imageFile),
    @required Result resetCamera(),
  }) {
    assert(takePictureButtonPressed != null);
    assert(decodeMRZ != null);
    assert(resetCamera != null);
    return resetCamera();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result takePictureButtonPressed(),
    Result decodeMRZ(dynamic imageFile),
    Result resetCamera(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetCamera != null) {
      return resetCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result takePictureButtonPressed(TakePictureButtonPressed value),
    @required Result decodeMRZ(DecodeMRZ value),
    @required Result resetCamera(ResetCamera value),
  }) {
    assert(takePictureButtonPressed != null);
    assert(decodeMRZ != null);
    assert(resetCamera != null);
    return resetCamera(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result takePictureButtonPressed(TakePictureButtonPressed value),
    Result decodeMRZ(DecodeMRZ value),
    Result resetCamera(ResetCamera value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetCamera != null) {
      return resetCamera(this);
    }
    return orElse();
  }
}

abstract class ResetCamera implements CameraEvent {
  const factory ResetCamera() = _$ResetCamera;
}

class _$CameraStateTearOff {
  const _$CameraStateTearOff();

  CameraInitial cameraInitial() {
    return const CameraInitial();
  }

  PictureTaken pictureTaken(
      {@required dynamic pictureScanned,
      @required File pictureTaken,
      @required Size pictureSize}) {
    return PictureTaken(
      pictureScanned: pictureScanned,
      pictureTaken: pictureTaken,
      pictureSize: pictureSize,
    );
  }

  ImageDecoded imageDecoded(
      Either<MRTDFailure, Document> imageDecodedFailureOrSuccess) {
    return ImageDecoded(
      imageDecodedFailureOrSuccess,
    );
  }

  CameraLoading cameraLoading() {
    return const CameraLoading();
  }

  CameraError cameraError() {
    return const CameraError();
  }
}

// ignore: unused_element
const $CameraState = _$CameraStateTearOff();

mixin _$CameraState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cameraInitial(),
    @required
        Result pictureTaken(
            dynamic pictureScanned, File pictureTaken, Size pictureSize),
    @required
        Result imageDecoded(
            Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    @required Result cameraLoading(),
    @required Result cameraError(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cameraInitial(),
    Result pictureTaken(
        dynamic pictureScanned, File pictureTaken, Size pictureSize),
    Result imageDecoded(
        Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    Result cameraLoading(),
    Result cameraError(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cameraInitial(CameraInitial value),
    @required Result pictureTaken(PictureTaken value),
    @required Result imageDecoded(ImageDecoded value),
    @required Result cameraLoading(CameraLoading value),
    @required Result cameraError(CameraError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cameraInitial(CameraInitial value),
    Result pictureTaken(PictureTaken value),
    Result imageDecoded(ImageDecoded value),
    Result cameraLoading(CameraLoading value),
    Result cameraError(CameraError value),
    @required Result orElse(),
  });
}

abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res>;
}

class _$CameraStateCopyWithImpl<$Res> implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  final CameraState _value;
  // ignore: unused_field
  final $Res Function(CameraState) _then;
}

abstract class $CameraInitialCopyWith<$Res> {
  factory $CameraInitialCopyWith(
          CameraInitial value, $Res Function(CameraInitial) then) =
      _$CameraInitialCopyWithImpl<$Res>;
}

class _$CameraInitialCopyWithImpl<$Res> extends _$CameraStateCopyWithImpl<$Res>
    implements $CameraInitialCopyWith<$Res> {
  _$CameraInitialCopyWithImpl(
      CameraInitial _value, $Res Function(CameraInitial) _then)
      : super(_value, (v) => _then(v as CameraInitial));

  @override
  CameraInitial get _value => super._value as CameraInitial;
}

class _$CameraInitial with DiagnosticableTreeMixin implements CameraInitial {
  const _$CameraInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CameraState.cameraInitial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CameraState.cameraInitial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CameraInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cameraInitial(),
    @required
        Result pictureTaken(
            dynamic pictureScanned, File pictureTaken, Size pictureSize),
    @required
        Result imageDecoded(
            Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    @required Result cameraLoading(),
    @required Result cameraError(),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return cameraInitial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cameraInitial(),
    Result pictureTaken(
        dynamic pictureScanned, File pictureTaken, Size pictureSize),
    Result imageDecoded(
        Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    Result cameraLoading(),
    Result cameraError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cameraInitial != null) {
      return cameraInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cameraInitial(CameraInitial value),
    @required Result pictureTaken(PictureTaken value),
    @required Result imageDecoded(ImageDecoded value),
    @required Result cameraLoading(CameraLoading value),
    @required Result cameraError(CameraError value),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return cameraInitial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cameraInitial(CameraInitial value),
    Result pictureTaken(PictureTaken value),
    Result imageDecoded(ImageDecoded value),
    Result cameraLoading(CameraLoading value),
    Result cameraError(CameraError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cameraInitial != null) {
      return cameraInitial(this);
    }
    return orElse();
  }
}

abstract class CameraInitial implements CameraState {
  const factory CameraInitial() = _$CameraInitial;
}

abstract class $PictureTakenCopyWith<$Res> {
  factory $PictureTakenCopyWith(
          PictureTaken value, $Res Function(PictureTaken) then) =
      _$PictureTakenCopyWithImpl<$Res>;
  $Res call({dynamic pictureScanned, File pictureTaken, Size pictureSize});
}

class _$PictureTakenCopyWithImpl<$Res> extends _$CameraStateCopyWithImpl<$Res>
    implements $PictureTakenCopyWith<$Res> {
  _$PictureTakenCopyWithImpl(
      PictureTaken _value, $Res Function(PictureTaken) _then)
      : super(_value, (v) => _then(v as PictureTaken));

  @override
  PictureTaken get _value => super._value as PictureTaken;

  @override
  $Res call({
    Object pictureScanned = freezed,
    Object pictureTaken = freezed,
    Object pictureSize = freezed,
  }) {
    return _then(PictureTaken(
      pictureScanned: pictureScanned == freezed
          ? _value.pictureScanned
          : pictureScanned as dynamic,
      pictureTaken:
          pictureTaken == freezed ? _value.pictureTaken : pictureTaken as File,
      pictureSize:
          pictureSize == freezed ? _value.pictureSize : pictureSize as Size,
    ));
  }
}

class _$PictureTaken with DiagnosticableTreeMixin implements PictureTaken {
  _$PictureTaken(
      {@required this.pictureScanned,
      @required this.pictureTaken,
      @required this.pictureSize})
      : assert(pictureScanned != null),
        assert(pictureTaken != null),
        assert(pictureSize != null);

  @override
  final dynamic pictureScanned;
  @override
  final File pictureTaken;
  @override
  final Size pictureSize;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CameraState.pictureTaken(pictureScanned: $pictureScanned, pictureTaken: $pictureTaken, pictureSize: $pictureSize)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CameraState.pictureTaken'))
      ..add(DiagnosticsProperty('pictureScanned', pictureScanned))
      ..add(DiagnosticsProperty('pictureTaken', pictureTaken))
      ..add(DiagnosticsProperty('pictureSize', pictureSize));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PictureTaken &&
            (identical(other.pictureScanned, pictureScanned) ||
                const DeepCollectionEquality()
                    .equals(other.pictureScanned, pictureScanned)) &&
            (identical(other.pictureTaken, pictureTaken) ||
                const DeepCollectionEquality()
                    .equals(other.pictureTaken, pictureTaken)) &&
            (identical(other.pictureSize, pictureSize) ||
                const DeepCollectionEquality()
                    .equals(other.pictureSize, pictureSize)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pictureScanned) ^
      const DeepCollectionEquality().hash(pictureTaken) ^
      const DeepCollectionEquality().hash(pictureSize);

  @override
  $PictureTakenCopyWith<PictureTaken> get copyWith =>
      _$PictureTakenCopyWithImpl<PictureTaken>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cameraInitial(),
    @required
        Result pictureTaken(
            dynamic pictureScanned, File pictureTaken, Size pictureSize),
    @required
        Result imageDecoded(
            Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    @required Result cameraLoading(),
    @required Result cameraError(),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return pictureTaken(pictureScanned, this.pictureTaken, pictureSize);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cameraInitial(),
    Result pictureTaken(
        dynamic pictureScanned, File pictureTaken, Size pictureSize),
    Result imageDecoded(
        Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    Result cameraLoading(),
    Result cameraError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pictureTaken != null) {
      return pictureTaken(pictureScanned, this.pictureTaken, pictureSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cameraInitial(CameraInitial value),
    @required Result pictureTaken(PictureTaken value),
    @required Result imageDecoded(ImageDecoded value),
    @required Result cameraLoading(CameraLoading value),
    @required Result cameraError(CameraError value),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return pictureTaken(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cameraInitial(CameraInitial value),
    Result pictureTaken(PictureTaken value),
    Result imageDecoded(ImageDecoded value),
    Result cameraLoading(CameraLoading value),
    Result cameraError(CameraError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pictureTaken != null) {
      return pictureTaken(this);
    }
    return orElse();
  }
}

abstract class PictureTaken implements CameraState {
  factory PictureTaken(
      {@required dynamic pictureScanned,
      @required File pictureTaken,
      @required Size pictureSize}) = _$PictureTaken;

  dynamic get pictureScanned;
  File get pictureTaken;
  Size get pictureSize;
  $PictureTakenCopyWith<PictureTaken> get copyWith;
}

abstract class $ImageDecodedCopyWith<$Res> {
  factory $ImageDecodedCopyWith(
          ImageDecoded value, $Res Function(ImageDecoded) then) =
      _$ImageDecodedCopyWithImpl<$Res>;
  $Res call({Either<MRTDFailure, Document> imageDecodedFailureOrSuccess});
}

class _$ImageDecodedCopyWithImpl<$Res> extends _$CameraStateCopyWithImpl<$Res>
    implements $ImageDecodedCopyWith<$Res> {
  _$ImageDecodedCopyWithImpl(
      ImageDecoded _value, $Res Function(ImageDecoded) _then)
      : super(_value, (v) => _then(v as ImageDecoded));

  @override
  ImageDecoded get _value => super._value as ImageDecoded;

  @override
  $Res call({
    Object imageDecodedFailureOrSuccess = freezed,
  }) {
    return _then(ImageDecoded(
      imageDecodedFailureOrSuccess == freezed
          ? _value.imageDecodedFailureOrSuccess
          : imageDecodedFailureOrSuccess as Either<MRTDFailure, Document>,
    ));
  }
}

class _$ImageDecoded with DiagnosticableTreeMixin implements ImageDecoded {
  _$ImageDecoded(this.imageDecodedFailureOrSuccess)
      : assert(imageDecodedFailureOrSuccess != null);

  @override
  final Either<MRTDFailure, Document> imageDecodedFailureOrSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CameraState.imageDecoded(imageDecodedFailureOrSuccess: $imageDecodedFailureOrSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CameraState.imageDecoded'))
      ..add(DiagnosticsProperty(
          'imageDecodedFailureOrSuccess', imageDecodedFailureOrSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImageDecoded &&
            (identical(other.imageDecodedFailureOrSuccess,
                    imageDecodedFailureOrSuccess) ||
                const DeepCollectionEquality().equals(
                    other.imageDecodedFailureOrSuccess,
                    imageDecodedFailureOrSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageDecodedFailureOrSuccess);

  @override
  $ImageDecodedCopyWith<ImageDecoded> get copyWith =>
      _$ImageDecodedCopyWithImpl<ImageDecoded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cameraInitial(),
    @required
        Result pictureTaken(
            dynamic pictureScanned, File pictureTaken, Size pictureSize),
    @required
        Result imageDecoded(
            Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    @required Result cameraLoading(),
    @required Result cameraError(),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return imageDecoded(imageDecodedFailureOrSuccess);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cameraInitial(),
    Result pictureTaken(
        dynamic pictureScanned, File pictureTaken, Size pictureSize),
    Result imageDecoded(
        Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    Result cameraLoading(),
    Result cameraError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (imageDecoded != null) {
      return imageDecoded(imageDecodedFailureOrSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cameraInitial(CameraInitial value),
    @required Result pictureTaken(PictureTaken value),
    @required Result imageDecoded(ImageDecoded value),
    @required Result cameraLoading(CameraLoading value),
    @required Result cameraError(CameraError value),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return imageDecoded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cameraInitial(CameraInitial value),
    Result pictureTaken(PictureTaken value),
    Result imageDecoded(ImageDecoded value),
    Result cameraLoading(CameraLoading value),
    Result cameraError(CameraError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (imageDecoded != null) {
      return imageDecoded(this);
    }
    return orElse();
  }
}

abstract class ImageDecoded implements CameraState {
  factory ImageDecoded(
          Either<MRTDFailure, Document> imageDecodedFailureOrSuccess) =
      _$ImageDecoded;

  Either<MRTDFailure, Document> get imageDecodedFailureOrSuccess;
  $ImageDecodedCopyWith<ImageDecoded> get copyWith;
}

abstract class $CameraLoadingCopyWith<$Res> {
  factory $CameraLoadingCopyWith(
          CameraLoading value, $Res Function(CameraLoading) then) =
      _$CameraLoadingCopyWithImpl<$Res>;
}

class _$CameraLoadingCopyWithImpl<$Res> extends _$CameraStateCopyWithImpl<$Res>
    implements $CameraLoadingCopyWith<$Res> {
  _$CameraLoadingCopyWithImpl(
      CameraLoading _value, $Res Function(CameraLoading) _then)
      : super(_value, (v) => _then(v as CameraLoading));

  @override
  CameraLoading get _value => super._value as CameraLoading;
}

class _$CameraLoading with DiagnosticableTreeMixin implements CameraLoading {
  const _$CameraLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CameraState.cameraLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CameraState.cameraLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CameraLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cameraInitial(),
    @required
        Result pictureTaken(
            dynamic pictureScanned, File pictureTaken, Size pictureSize),
    @required
        Result imageDecoded(
            Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    @required Result cameraLoading(),
    @required Result cameraError(),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return cameraLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cameraInitial(),
    Result pictureTaken(
        dynamic pictureScanned, File pictureTaken, Size pictureSize),
    Result imageDecoded(
        Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    Result cameraLoading(),
    Result cameraError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cameraLoading != null) {
      return cameraLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cameraInitial(CameraInitial value),
    @required Result pictureTaken(PictureTaken value),
    @required Result imageDecoded(ImageDecoded value),
    @required Result cameraLoading(CameraLoading value),
    @required Result cameraError(CameraError value),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return cameraLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cameraInitial(CameraInitial value),
    Result pictureTaken(PictureTaken value),
    Result imageDecoded(ImageDecoded value),
    Result cameraLoading(CameraLoading value),
    Result cameraError(CameraError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cameraLoading != null) {
      return cameraLoading(this);
    }
    return orElse();
  }
}

abstract class CameraLoading implements CameraState {
  const factory CameraLoading() = _$CameraLoading;
}

abstract class $CameraErrorCopyWith<$Res> {
  factory $CameraErrorCopyWith(
          CameraError value, $Res Function(CameraError) then) =
      _$CameraErrorCopyWithImpl<$Res>;
}

class _$CameraErrorCopyWithImpl<$Res> extends _$CameraStateCopyWithImpl<$Res>
    implements $CameraErrorCopyWith<$Res> {
  _$CameraErrorCopyWithImpl(
      CameraError _value, $Res Function(CameraError) _then)
      : super(_value, (v) => _then(v as CameraError));

  @override
  CameraError get _value => super._value as CameraError;
}

class _$CameraError with DiagnosticableTreeMixin implements CameraError {
  const _$CameraError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CameraState.cameraError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CameraState.cameraError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CameraError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cameraInitial(),
    @required
        Result pictureTaken(
            dynamic pictureScanned, File pictureTaken, Size pictureSize),
    @required
        Result imageDecoded(
            Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    @required Result cameraLoading(),
    @required Result cameraError(),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return cameraError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cameraInitial(),
    Result pictureTaken(
        dynamic pictureScanned, File pictureTaken, Size pictureSize),
    Result imageDecoded(
        Either<MRTDFailure, Document> imageDecodedFailureOrSuccess),
    Result cameraLoading(),
    Result cameraError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cameraError != null) {
      return cameraError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cameraInitial(CameraInitial value),
    @required Result pictureTaken(PictureTaken value),
    @required Result imageDecoded(ImageDecoded value),
    @required Result cameraLoading(CameraLoading value),
    @required Result cameraError(CameraError value),
  }) {
    assert(cameraInitial != null);
    assert(pictureTaken != null);
    assert(imageDecoded != null);
    assert(cameraLoading != null);
    assert(cameraError != null);
    return cameraError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cameraInitial(CameraInitial value),
    Result pictureTaken(PictureTaken value),
    Result imageDecoded(ImageDecoded value),
    Result cameraLoading(CameraLoading value),
    Result cameraError(CameraError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cameraError != null) {
      return cameraError(this);
    }
    return orElse();
  }
}

abstract class CameraError implements CameraState {
  const factory CameraError() = _$CameraError;
}
