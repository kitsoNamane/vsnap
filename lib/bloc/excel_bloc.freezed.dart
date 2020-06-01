// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'excel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ExcelEventTearOff {
  const _$ExcelEventTearOff();

  BuildExcel buildExcel(Either<VisitorFailure, List<Visitor>> visitors) {
    return BuildExcel(
      visitors,
    );
  }
}

// ignore: unused_element
const $ExcelEvent = _$ExcelEventTearOff();

mixin _$ExcelEvent {
  Either<VisitorFailure, List<Visitor>> get visitors;

  $ExcelEventCopyWith<ExcelEvent> get copyWith;
}

abstract class $ExcelEventCopyWith<$Res> {
  factory $ExcelEventCopyWith(
          ExcelEvent value, $Res Function(ExcelEvent) then) =
      _$ExcelEventCopyWithImpl<$Res>;
  $Res call({Either<VisitorFailure, List<Visitor>> visitors});
}

class _$ExcelEventCopyWithImpl<$Res> implements $ExcelEventCopyWith<$Res> {
  _$ExcelEventCopyWithImpl(this._value, this._then);

  final ExcelEvent _value;
  // ignore: unused_field
  final $Res Function(ExcelEvent) _then;

  @override
  $Res call({
    Object visitors = freezed,
  }) {
    return _then(_value.copyWith(
      visitors: visitors == freezed
          ? _value.visitors
          : visitors as Either<VisitorFailure, List<Visitor>>,
    ));
  }
}

abstract class $BuildExcelCopyWith<$Res> implements $ExcelEventCopyWith<$Res> {
  factory $BuildExcelCopyWith(
          BuildExcel value, $Res Function(BuildExcel) then) =
      _$BuildExcelCopyWithImpl<$Res>;
  @override
  $Res call({Either<VisitorFailure, List<Visitor>> visitors});
}

class _$BuildExcelCopyWithImpl<$Res> extends _$ExcelEventCopyWithImpl<$Res>
    implements $BuildExcelCopyWith<$Res> {
  _$BuildExcelCopyWithImpl(BuildExcel _value, $Res Function(BuildExcel) _then)
      : super(_value, (v) => _then(v as BuildExcel));

  @override
  BuildExcel get _value => super._value as BuildExcel;

  @override
  $Res call({
    Object visitors = freezed,
  }) {
    return _then(BuildExcel(
      visitors == freezed
          ? _value.visitors
          : visitors as Either<VisitorFailure, List<Visitor>>,
    ));
  }
}

class _$BuildExcel implements BuildExcel {
  const _$BuildExcel(this.visitors) : assert(visitors != null);

  @override
  final Either<VisitorFailure, List<Visitor>> visitors;

  @override
  String toString() {
    return 'ExcelEvent.buildExcel(visitors: $visitors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BuildExcel &&
            (identical(other.visitors, visitors) ||
                const DeepCollectionEquality()
                    .equals(other.visitors, visitors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(visitors);

  @override
  $BuildExcelCopyWith<BuildExcel> get copyWith =>
      _$BuildExcelCopyWithImpl<BuildExcel>(this, _$identity);
}

abstract class BuildExcel implements ExcelEvent {
  const factory BuildExcel(Either<VisitorFailure, List<Visitor>> visitors) =
      _$BuildExcel;

  @override
  Either<VisitorFailure, List<Visitor>> get visitors;
  @override
  $BuildExcelCopyWith<BuildExcel> get copyWith;
}

class _$ExcelStateTearOff {
  const _$ExcelStateTearOff();

  _ExcelState call(
      {@required bool showErrorMessages,
      @required bool isSubmitting,
      @required Option<Either<ExcelFailure, File>> excelFailureOrSuccess}) {
    return _ExcelState(
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      excelFailureOrSuccess: excelFailureOrSuccess,
    );
  }
}

// ignore: unused_element
const $ExcelState = _$ExcelStateTearOff();

mixin _$ExcelState {
  bool get showErrorMessages;
  bool get isSubmitting;
  Option<Either<ExcelFailure, File>> get excelFailureOrSuccess;

  $ExcelStateCopyWith<ExcelState> get copyWith;
}

abstract class $ExcelStateCopyWith<$Res> {
  factory $ExcelStateCopyWith(
          ExcelState value, $Res Function(ExcelState) then) =
      _$ExcelStateCopyWithImpl<$Res>;
  $Res call(
      {bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ExcelFailure, File>> excelFailureOrSuccess});
}

class _$ExcelStateCopyWithImpl<$Res> implements $ExcelStateCopyWith<$Res> {
  _$ExcelStateCopyWithImpl(this._value, this._then);

  final ExcelState _value;
  // ignore: unused_field
  final $Res Function(ExcelState) _then;

  @override
  $Res call({
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object excelFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      excelFailureOrSuccess: excelFailureOrSuccess == freezed
          ? _value.excelFailureOrSuccess
          : excelFailureOrSuccess as Option<Either<ExcelFailure, File>>,
    ));
  }
}

abstract class _$ExcelStateCopyWith<$Res> implements $ExcelStateCopyWith<$Res> {
  factory _$ExcelStateCopyWith(
          _ExcelState value, $Res Function(_ExcelState) then) =
      __$ExcelStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ExcelFailure, File>> excelFailureOrSuccess});
}

class __$ExcelStateCopyWithImpl<$Res> extends _$ExcelStateCopyWithImpl<$Res>
    implements _$ExcelStateCopyWith<$Res> {
  __$ExcelStateCopyWithImpl(
      _ExcelState _value, $Res Function(_ExcelState) _then)
      : super(_value, (v) => _then(v as _ExcelState));

  @override
  _ExcelState get _value => super._value as _ExcelState;

  @override
  $Res call({
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object excelFailureOrSuccess = freezed,
  }) {
    return _then(_ExcelState(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      excelFailureOrSuccess: excelFailureOrSuccess == freezed
          ? _value.excelFailureOrSuccess
          : excelFailureOrSuccess as Option<Either<ExcelFailure, File>>,
    ));
  }
}

class _$_ExcelState implements _ExcelState {
  const _$_ExcelState(
      {@required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.excelFailureOrSuccess})
      : assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(excelFailureOrSuccess != null);

  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ExcelFailure, File>> excelFailureOrSuccess;

  @override
  String toString() {
    return 'ExcelState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, excelFailureOrSuccess: $excelFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ExcelState &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.excelFailureOrSuccess, excelFailureOrSuccess) ||
                const DeepCollectionEquality().equals(
                    other.excelFailureOrSuccess, excelFailureOrSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(excelFailureOrSuccess);

  @override
  _$ExcelStateCopyWith<_ExcelState> get copyWith =>
      __$ExcelStateCopyWithImpl<_ExcelState>(this, _$identity);
}

abstract class _ExcelState implements ExcelState {
  const factory _ExcelState(
          {@required bool showErrorMessages,
          @required bool isSubmitting,
          @required Option<Either<ExcelFailure, File>> excelFailureOrSuccess}) =
      _$_ExcelState;

  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ExcelFailure, File>> get excelFailureOrSuccess;
  @override
  _$ExcelStateCopyWith<_ExcelState> get copyWith;
}
