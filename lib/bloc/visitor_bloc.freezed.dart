// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'visitor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$VisitorEventTearOff {
  const _$VisitorEventTearOff();

  AddVisitorButtonPressed addVisitorButtonPressed(
      {String phone, String temperature, Document document}) {
    return AddVisitorButtonPressed(
      phone: phone,
      temperature: temperature,
      document: document,
    );
  }

  VisitorSignIn visitorSignIn(VisitorModel visitor) {
    return VisitorSignIn(
      visitor,
    );
  }

  VisitorSignOut visitorSignOut(Document document) {
    return VisitorSignOut(
      document,
    );
  }

  GetVisitors getVisitors({DateTime from, DateTime to}) {
    return GetVisitors(
      from: from,
      to: to,
    );
  }
}

// ignore: unused_element
const $VisitorEvent = _$VisitorEventTearOff();

mixin _$VisitorEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result addVisitorButtonPressed(
            String phone, String temperature, Document document),
    @required Result visitorSignIn(VisitorModel visitor),
    @required Result visitorSignOut(Document document),
    @required Result getVisitors(DateTime from, DateTime to),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addVisitorButtonPressed(
        String phone, String temperature, Document document),
    Result visitorSignIn(VisitorModel visitor),
    Result visitorSignOut(Document document),
    Result getVisitors(DateTime from, DateTime to),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    @required Result visitorSignIn(VisitorSignIn value),
    @required Result visitorSignOut(VisitorSignOut value),
    @required Result getVisitors(GetVisitors value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    Result visitorSignIn(VisitorSignIn value),
    Result visitorSignOut(VisitorSignOut value),
    Result getVisitors(GetVisitors value),
    @required Result orElse(),
  });
}

abstract class $VisitorEventCopyWith<$Res> {
  factory $VisitorEventCopyWith(
          VisitorEvent value, $Res Function(VisitorEvent) then) =
      _$VisitorEventCopyWithImpl<$Res>;
}

class _$VisitorEventCopyWithImpl<$Res> implements $VisitorEventCopyWith<$Res> {
  _$VisitorEventCopyWithImpl(this._value, this._then);

  final VisitorEvent _value;
  // ignore: unused_field
  final $Res Function(VisitorEvent) _then;
}

abstract class $AddVisitorButtonPressedCopyWith<$Res> {
  factory $AddVisitorButtonPressedCopyWith(AddVisitorButtonPressed value,
          $Res Function(AddVisitorButtonPressed) then) =
      _$AddVisitorButtonPressedCopyWithImpl<$Res>;
  $Res call({String phone, String temperature, Document document});
}

class _$AddVisitorButtonPressedCopyWithImpl<$Res>
    extends _$VisitorEventCopyWithImpl<$Res>
    implements $AddVisitorButtonPressedCopyWith<$Res> {
  _$AddVisitorButtonPressedCopyWithImpl(AddVisitorButtonPressed _value,
      $Res Function(AddVisitorButtonPressed) _then)
      : super(_value, (v) => _then(v as AddVisitorButtonPressed));

  @override
  AddVisitorButtonPressed get _value => super._value as AddVisitorButtonPressed;

  @override
  $Res call({
    Object phone = freezed,
    Object temperature = freezed,
    Object document = freezed,
  }) {
    return _then(AddVisitorButtonPressed(
      phone: phone == freezed ? _value.phone : phone as String,
      temperature:
          temperature == freezed ? _value.temperature : temperature as String,
      document: document == freezed ? _value.document : document as Document,
    ));
  }
}

class _$AddVisitorButtonPressed implements AddVisitorButtonPressed {
  const _$AddVisitorButtonPressed(
      {this.phone, this.temperature, this.document});

  @override
  final String phone;
  @override
  final String temperature;
  @override
  final Document document;

  @override
  String toString() {
    return 'VisitorEvent.addVisitorButtonPressed(phone: $phone, temperature: $temperature, document: $document)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddVisitorButtonPressed &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.temperature, temperature) ||
                const DeepCollectionEquality()
                    .equals(other.temperature, temperature)) &&
            (identical(other.document, document) ||
                const DeepCollectionEquality()
                    .equals(other.document, document)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(temperature) ^
      const DeepCollectionEquality().hash(document);

  @override
  $AddVisitorButtonPressedCopyWith<AddVisitorButtonPressed> get copyWith =>
      _$AddVisitorButtonPressedCopyWithImpl<AddVisitorButtonPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result addVisitorButtonPressed(
            String phone, String temperature, Document document),
    @required Result visitorSignIn(VisitorModel visitor),
    @required Result visitorSignOut(Document document),
    @required Result getVisitors(DateTime from, DateTime to),
  }) {
    assert(addVisitorButtonPressed != null);
    assert(visitorSignIn != null);
    assert(visitorSignOut != null);
    assert(getVisitors != null);
    return addVisitorButtonPressed(phone, temperature, document);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addVisitorButtonPressed(
        String phone, String temperature, Document document),
    Result visitorSignIn(VisitorModel visitor),
    Result visitorSignOut(Document document),
    Result getVisitors(DateTime from, DateTime to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addVisitorButtonPressed != null) {
      return addVisitorButtonPressed(phone, temperature, document);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    @required Result visitorSignIn(VisitorSignIn value),
    @required Result visitorSignOut(VisitorSignOut value),
    @required Result getVisitors(GetVisitors value),
  }) {
    assert(addVisitorButtonPressed != null);
    assert(visitorSignIn != null);
    assert(visitorSignOut != null);
    assert(getVisitors != null);
    return addVisitorButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    Result visitorSignIn(VisitorSignIn value),
    Result visitorSignOut(VisitorSignOut value),
    Result getVisitors(GetVisitors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (addVisitorButtonPressed != null) {
      return addVisitorButtonPressed(this);
    }
    return orElse();
  }
}

abstract class AddVisitorButtonPressed implements VisitorEvent {
  const factory AddVisitorButtonPressed(
      {String phone,
      String temperature,
      Document document}) = _$AddVisitorButtonPressed;

  String get phone;
  String get temperature;
  Document get document;
  $AddVisitorButtonPressedCopyWith<AddVisitorButtonPressed> get copyWith;
}

abstract class $VisitorSignInCopyWith<$Res> {
  factory $VisitorSignInCopyWith(
          VisitorSignIn value, $Res Function(VisitorSignIn) then) =
      _$VisitorSignInCopyWithImpl<$Res>;
  $Res call({VisitorModel visitor});
}

class _$VisitorSignInCopyWithImpl<$Res> extends _$VisitorEventCopyWithImpl<$Res>
    implements $VisitorSignInCopyWith<$Res> {
  _$VisitorSignInCopyWithImpl(
      VisitorSignIn _value, $Res Function(VisitorSignIn) _then)
      : super(_value, (v) => _then(v as VisitorSignIn));

  @override
  VisitorSignIn get _value => super._value as VisitorSignIn;

  @override
  $Res call({
    Object visitor = freezed,
  }) {
    return _then(VisitorSignIn(
      visitor == freezed ? _value.visitor : visitor as VisitorModel,
    ));
  }
}

class _$VisitorSignIn implements VisitorSignIn {
  const _$VisitorSignIn(this.visitor) : assert(visitor != null);

  @override
  final VisitorModel visitor;

  @override
  String toString() {
    return 'VisitorEvent.visitorSignIn(visitor: $visitor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisitorSignIn &&
            (identical(other.visitor, visitor) ||
                const DeepCollectionEquality().equals(other.visitor, visitor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(visitor);

  @override
  $VisitorSignInCopyWith<VisitorSignIn> get copyWith =>
      _$VisitorSignInCopyWithImpl<VisitorSignIn>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result addVisitorButtonPressed(
            String phone, String temperature, Document document),
    @required Result visitorSignIn(VisitorModel visitor),
    @required Result visitorSignOut(Document document),
    @required Result getVisitors(DateTime from, DateTime to),
  }) {
    assert(addVisitorButtonPressed != null);
    assert(visitorSignIn != null);
    assert(visitorSignOut != null);
    assert(getVisitors != null);
    return visitorSignIn(visitor);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addVisitorButtonPressed(
        String phone, String temperature, Document document),
    Result visitorSignIn(VisitorModel visitor),
    Result visitorSignOut(Document document),
    Result getVisitors(DateTime from, DateTime to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (visitorSignIn != null) {
      return visitorSignIn(visitor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    @required Result visitorSignIn(VisitorSignIn value),
    @required Result visitorSignOut(VisitorSignOut value),
    @required Result getVisitors(GetVisitors value),
  }) {
    assert(addVisitorButtonPressed != null);
    assert(visitorSignIn != null);
    assert(visitorSignOut != null);
    assert(getVisitors != null);
    return visitorSignIn(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    Result visitorSignIn(VisitorSignIn value),
    Result visitorSignOut(VisitorSignOut value),
    Result getVisitors(GetVisitors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (visitorSignIn != null) {
      return visitorSignIn(this);
    }
    return orElse();
  }
}

abstract class VisitorSignIn implements VisitorEvent {
  const factory VisitorSignIn(VisitorModel visitor) = _$VisitorSignIn;

  VisitorModel get visitor;
  $VisitorSignInCopyWith<VisitorSignIn> get copyWith;
}

abstract class $VisitorSignOutCopyWith<$Res> {
  factory $VisitorSignOutCopyWith(
          VisitorSignOut value, $Res Function(VisitorSignOut) then) =
      _$VisitorSignOutCopyWithImpl<$Res>;
  $Res call({Document document});
}

class _$VisitorSignOutCopyWithImpl<$Res>
    extends _$VisitorEventCopyWithImpl<$Res>
    implements $VisitorSignOutCopyWith<$Res> {
  _$VisitorSignOutCopyWithImpl(
      VisitorSignOut _value, $Res Function(VisitorSignOut) _then)
      : super(_value, (v) => _then(v as VisitorSignOut));

  @override
  VisitorSignOut get _value => super._value as VisitorSignOut;

  @override
  $Res call({
    Object document = freezed,
  }) {
    return _then(VisitorSignOut(
      document == freezed ? _value.document : document as Document,
    ));
  }
}

class _$VisitorSignOut implements VisitorSignOut {
  const _$VisitorSignOut(this.document) : assert(document != null);

  @override
  final Document document;

  @override
  String toString() {
    return 'VisitorEvent.visitorSignOut(document: $document)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisitorSignOut &&
            (identical(other.document, document) ||
                const DeepCollectionEquality()
                    .equals(other.document, document)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(document);

  @override
  $VisitorSignOutCopyWith<VisitorSignOut> get copyWith =>
      _$VisitorSignOutCopyWithImpl<VisitorSignOut>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result addVisitorButtonPressed(
            String phone, String temperature, Document document),
    @required Result visitorSignIn(VisitorModel visitor),
    @required Result visitorSignOut(Document document),
    @required Result getVisitors(DateTime from, DateTime to),
  }) {
    assert(addVisitorButtonPressed != null);
    assert(visitorSignIn != null);
    assert(visitorSignOut != null);
    assert(getVisitors != null);
    return visitorSignOut(document);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addVisitorButtonPressed(
        String phone, String temperature, Document document),
    Result visitorSignIn(VisitorModel visitor),
    Result visitorSignOut(Document document),
    Result getVisitors(DateTime from, DateTime to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (visitorSignOut != null) {
      return visitorSignOut(document);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    @required Result visitorSignIn(VisitorSignIn value),
    @required Result visitorSignOut(VisitorSignOut value),
    @required Result getVisitors(GetVisitors value),
  }) {
    assert(addVisitorButtonPressed != null);
    assert(visitorSignIn != null);
    assert(visitorSignOut != null);
    assert(getVisitors != null);
    return visitorSignOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    Result visitorSignIn(VisitorSignIn value),
    Result visitorSignOut(VisitorSignOut value),
    Result getVisitors(GetVisitors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (visitorSignOut != null) {
      return visitorSignOut(this);
    }
    return orElse();
  }
}

abstract class VisitorSignOut implements VisitorEvent {
  const factory VisitorSignOut(Document document) = _$VisitorSignOut;

  Document get document;
  $VisitorSignOutCopyWith<VisitorSignOut> get copyWith;
}

abstract class $GetVisitorsCopyWith<$Res> {
  factory $GetVisitorsCopyWith(
          GetVisitors value, $Res Function(GetVisitors) then) =
      _$GetVisitorsCopyWithImpl<$Res>;
  $Res call({DateTime from, DateTime to});
}

class _$GetVisitorsCopyWithImpl<$Res> extends _$VisitorEventCopyWithImpl<$Res>
    implements $GetVisitorsCopyWith<$Res> {
  _$GetVisitorsCopyWithImpl(
      GetVisitors _value, $Res Function(GetVisitors) _then)
      : super(_value, (v) => _then(v as GetVisitors));

  @override
  GetVisitors get _value => super._value as GetVisitors;

  @override
  $Res call({
    Object from = freezed,
    Object to = freezed,
  }) {
    return _then(GetVisitors(
      from: from == freezed ? _value.from : from as DateTime,
      to: to == freezed ? _value.to : to as DateTime,
    ));
  }
}

class _$GetVisitors implements GetVisitors {
  const _$GetVisitors({this.from, this.to});

  @override
  final DateTime from;
  @override
  final DateTime to;

  @override
  String toString() {
    return 'VisitorEvent.getVisitors(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetVisitors &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to);

  @override
  $GetVisitorsCopyWith<GetVisitors> get copyWith =>
      _$GetVisitorsCopyWithImpl<GetVisitors>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result addVisitorButtonPressed(
            String phone, String temperature, Document document),
    @required Result visitorSignIn(VisitorModel visitor),
    @required Result visitorSignOut(Document document),
    @required Result getVisitors(DateTime from, DateTime to),
  }) {
    assert(addVisitorButtonPressed != null);
    assert(visitorSignIn != null);
    assert(visitorSignOut != null);
    assert(getVisitors != null);
    return getVisitors(from, to);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result addVisitorButtonPressed(
        String phone, String temperature, Document document),
    Result visitorSignIn(VisitorModel visitor),
    Result visitorSignOut(Document document),
    Result getVisitors(DateTime from, DateTime to),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getVisitors != null) {
      return getVisitors(from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    @required Result visitorSignIn(VisitorSignIn value),
    @required Result visitorSignOut(VisitorSignOut value),
    @required Result getVisitors(GetVisitors value),
  }) {
    assert(addVisitorButtonPressed != null);
    assert(visitorSignIn != null);
    assert(visitorSignOut != null);
    assert(getVisitors != null);
    return getVisitors(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result addVisitorButtonPressed(AddVisitorButtonPressed value),
    Result visitorSignIn(VisitorSignIn value),
    Result visitorSignOut(VisitorSignOut value),
    Result getVisitors(GetVisitors value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getVisitors != null) {
      return getVisitors(this);
    }
    return orElse();
  }
}

abstract class GetVisitors implements VisitorEvent {
  const factory GetVisitors({DateTime from, DateTime to}) = _$GetVisitors;

  DateTime get from;
  DateTime get to;
  $GetVisitorsCopyWith<GetVisitors> get copyWith;
}

class _$VisitorStateTearOff {
  const _$VisitorStateTearOff();

  _VisitorState call(
      {@required bool showErrorMessages, @required bool isSubmitting}) {
    return _VisitorState(
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
    );
  }

  VisitorSignedIn visitorSignedIn(
      {@required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption}) {
    return VisitorSignedIn(
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      signInFailureOrSuccessOption: signInFailureOrSuccessOption,
    );
  }

  VisitorSignedOut visitorSignedOut(
      {@required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption}) {
    return VisitorSignedOut(
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      signOutFailureOrSuccessOption: signOutFailureOrSuccessOption,
    );
  }

  GetVisitorDone getVisitorsDone(
      {@required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<VisitorFailure, List<dynamic>>>
              getVisitorsFailureOrSuccessOption}) {
    return GetVisitorDone(
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      getVisitorsFailureOrSuccessOption: getVisitorsFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $VisitorState = _$VisitorStateTearOff();

mixin _$VisitorState {
  bool get showErrorMessages;
  bool get isSubmitting;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    @required
        Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    @required
        Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    @required
        Result getVisitorsDone(
            bool showErrorMessages,
            bool isSubmitting,
            Option<Either<VisitorFailure, List<dynamic>>>
                getVisitorsFailureOrSuccessOption),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    Result getVisitorsDone(
        bool showErrorMessages,
        bool isSubmitting,
        Option<Either<VisitorFailure, List<dynamic>>>
            getVisitorsFailureOrSuccessOption),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_VisitorState value), {
    @required Result visitorSignedIn(VisitorSignedIn value),
    @required Result visitorSignedOut(VisitorSignedOut value),
    @required Result getVisitorsDone(GetVisitorDone value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_VisitorState value), {
    Result visitorSignedIn(VisitorSignedIn value),
    Result visitorSignedOut(VisitorSignedOut value),
    Result getVisitorsDone(GetVisitorDone value),
    @required Result orElse(),
  });

  $VisitorStateCopyWith<VisitorState> get copyWith;
}

abstract class $VisitorStateCopyWith<$Res> {
  factory $VisitorStateCopyWith(
          VisitorState value, $Res Function(VisitorState) then) =
      _$VisitorStateCopyWithImpl<$Res>;
  $Res call({bool showErrorMessages, bool isSubmitting});
}

class _$VisitorStateCopyWithImpl<$Res> implements $VisitorStateCopyWith<$Res> {
  _$VisitorStateCopyWithImpl(this._value, this._then);

  final VisitorState _value;
  // ignore: unused_field
  final $Res Function(VisitorState) _then;

  @override
  $Res call({
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
    ));
  }
}

abstract class _$VisitorStateCopyWith<$Res>
    implements $VisitorStateCopyWith<$Res> {
  factory _$VisitorStateCopyWith(
          _VisitorState value, $Res Function(_VisitorState) then) =
      __$VisitorStateCopyWithImpl<$Res>;
  @override
  $Res call({bool showErrorMessages, bool isSubmitting});
}

class __$VisitorStateCopyWithImpl<$Res> extends _$VisitorStateCopyWithImpl<$Res>
    implements _$VisitorStateCopyWith<$Res> {
  __$VisitorStateCopyWithImpl(
      _VisitorState _value, $Res Function(_VisitorState) _then)
      : super(_value, (v) => _then(v as _VisitorState));

  @override
  _VisitorState get _value => super._value as _VisitorState;

  @override
  $Res call({
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
  }) {
    return _then(_VisitorState(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
    ));
  }
}

class _$_VisitorState implements _VisitorState {
  const _$_VisitorState(
      {@required this.showErrorMessages, @required this.isSubmitting})
      : assert(showErrorMessages != null),
        assert(isSubmitting != null);

  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'VisitorState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VisitorState &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting);

  @override
  _$VisitorStateCopyWith<_VisitorState> get copyWith =>
      __$VisitorStateCopyWithImpl<_VisitorState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    @required
        Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    @required
        Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    @required
        Result getVisitorsDone(
            bool showErrorMessages,
            bool isSubmitting,
            Option<Either<VisitorFailure, List<dynamic>>>
                getVisitorsFailureOrSuccessOption),
  }) {
    assert($default != null);
    assert(visitorSignedIn != null);
    assert(visitorSignedOut != null);
    assert(getVisitorsDone != null);
    return $default(showErrorMessages, isSubmitting);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    Result getVisitorsDone(
        bool showErrorMessages,
        bool isSubmitting,
        Option<Either<VisitorFailure, List<dynamic>>>
            getVisitorsFailureOrSuccessOption),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(showErrorMessages, isSubmitting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_VisitorState value), {
    @required Result visitorSignedIn(VisitorSignedIn value),
    @required Result visitorSignedOut(VisitorSignedOut value),
    @required Result getVisitorsDone(GetVisitorDone value),
  }) {
    assert($default != null);
    assert(visitorSignedIn != null);
    assert(visitorSignedOut != null);
    assert(getVisitorsDone != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_VisitorState value), {
    Result visitorSignedIn(VisitorSignedIn value),
    Result visitorSignedOut(VisitorSignedOut value),
    Result getVisitorsDone(GetVisitorDone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _VisitorState implements VisitorState {
  const factory _VisitorState(
      {@required bool showErrorMessages,
      @required bool isSubmitting}) = _$_VisitorState;

  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  _$VisitorStateCopyWith<_VisitorState> get copyWith;
}

abstract class $VisitorSignedInCopyWith<$Res>
    implements $VisitorStateCopyWith<$Res> {
  factory $VisitorSignedInCopyWith(
          VisitorSignedIn value, $Res Function(VisitorSignedIn) then) =
      _$VisitorSignedInCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showErrorMessages,
      bool isSubmitting,
      Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption});
}

class _$VisitorSignedInCopyWithImpl<$Res>
    extends _$VisitorStateCopyWithImpl<$Res>
    implements $VisitorSignedInCopyWith<$Res> {
  _$VisitorSignedInCopyWithImpl(
      VisitorSignedIn _value, $Res Function(VisitorSignedIn) _then)
      : super(_value, (v) => _then(v as VisitorSignedIn));

  @override
  VisitorSignedIn get _value => super._value as VisitorSignedIn;

  @override
  $Res call({
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object signInFailureOrSuccessOption = freezed,
  }) {
    return _then(VisitorSignedIn(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      signInFailureOrSuccessOption: signInFailureOrSuccessOption == freezed
          ? _value.signInFailureOrSuccessOption
          : signInFailureOrSuccessOption
              as Option<Either<VisitorFailure, Unit>>,
    ));
  }
}

class _$VisitorSignedIn implements VisitorSignedIn {
  _$VisitorSignedIn(
      {@required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.signInFailureOrSuccessOption})
      : assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(signInFailureOrSuccessOption != null);

  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption;

  @override
  String toString() {
    return 'VisitorState.visitorSignedIn(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, signInFailureOrSuccessOption: $signInFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisitorSignedIn &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.signInFailureOrSuccessOption,
                    signInFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.signInFailureOrSuccessOption,
                    signInFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(signInFailureOrSuccessOption);

  @override
  $VisitorSignedInCopyWith<VisitorSignedIn> get copyWith =>
      _$VisitorSignedInCopyWithImpl<VisitorSignedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    @required
        Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    @required
        Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    @required
        Result getVisitorsDone(
            bool showErrorMessages,
            bool isSubmitting,
            Option<Either<VisitorFailure, List<dynamic>>>
                getVisitorsFailureOrSuccessOption),
  }) {
    assert($default != null);
    assert(visitorSignedIn != null);
    assert(visitorSignedOut != null);
    assert(getVisitorsDone != null);
    return visitorSignedIn(
        showErrorMessages, isSubmitting, signInFailureOrSuccessOption);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    Result getVisitorsDone(
        bool showErrorMessages,
        bool isSubmitting,
        Option<Either<VisitorFailure, List<dynamic>>>
            getVisitorsFailureOrSuccessOption),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (visitorSignedIn != null) {
      return visitorSignedIn(
          showErrorMessages, isSubmitting, signInFailureOrSuccessOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_VisitorState value), {
    @required Result visitorSignedIn(VisitorSignedIn value),
    @required Result visitorSignedOut(VisitorSignedOut value),
    @required Result getVisitorsDone(GetVisitorDone value),
  }) {
    assert($default != null);
    assert(visitorSignedIn != null);
    assert(visitorSignedOut != null);
    assert(getVisitorsDone != null);
    return visitorSignedIn(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_VisitorState value), {
    Result visitorSignedIn(VisitorSignedIn value),
    Result visitorSignedOut(VisitorSignedOut value),
    Result getVisitorsDone(GetVisitorDone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (visitorSignedIn != null) {
      return visitorSignedIn(this);
    }
    return orElse();
  }
}

abstract class VisitorSignedIn implements VisitorState {
  factory VisitorSignedIn(
      {@required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<VisitorFailure, Unit>>
              signInFailureOrSuccessOption}) = _$VisitorSignedIn;

  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  Option<Either<VisitorFailure, Unit>> get signInFailureOrSuccessOption;
  @override
  $VisitorSignedInCopyWith<VisitorSignedIn> get copyWith;
}

abstract class $VisitorSignedOutCopyWith<$Res>
    implements $VisitorStateCopyWith<$Res> {
  factory $VisitorSignedOutCopyWith(
          VisitorSignedOut value, $Res Function(VisitorSignedOut) then) =
      _$VisitorSignedOutCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showErrorMessages,
      bool isSubmitting,
      Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption});
}

class _$VisitorSignedOutCopyWithImpl<$Res>
    extends _$VisitorStateCopyWithImpl<$Res>
    implements $VisitorSignedOutCopyWith<$Res> {
  _$VisitorSignedOutCopyWithImpl(
      VisitorSignedOut _value, $Res Function(VisitorSignedOut) _then)
      : super(_value, (v) => _then(v as VisitorSignedOut));

  @override
  VisitorSignedOut get _value => super._value as VisitorSignedOut;

  @override
  $Res call({
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object signOutFailureOrSuccessOption = freezed,
  }) {
    return _then(VisitorSignedOut(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      signOutFailureOrSuccessOption: signOutFailureOrSuccessOption == freezed
          ? _value.signOutFailureOrSuccessOption
          : signOutFailureOrSuccessOption
              as Option<Either<VisitorFailure, Unit>>,
    ));
  }
}

class _$VisitorSignedOut implements VisitorSignedOut {
  _$VisitorSignedOut(
      {@required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.signOutFailureOrSuccessOption})
      : assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(signOutFailureOrSuccessOption != null);

  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption;

  @override
  String toString() {
    return 'VisitorState.visitorSignedOut(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, signOutFailureOrSuccessOption: $signOutFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisitorSignedOut &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.signOutFailureOrSuccessOption,
                    signOutFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.signOutFailureOrSuccessOption,
                    signOutFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(signOutFailureOrSuccessOption);

  @override
  $VisitorSignedOutCopyWith<VisitorSignedOut> get copyWith =>
      _$VisitorSignedOutCopyWithImpl<VisitorSignedOut>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    @required
        Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    @required
        Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    @required
        Result getVisitorsDone(
            bool showErrorMessages,
            bool isSubmitting,
            Option<Either<VisitorFailure, List<dynamic>>>
                getVisitorsFailureOrSuccessOption),
  }) {
    assert($default != null);
    assert(visitorSignedIn != null);
    assert(visitorSignedOut != null);
    assert(getVisitorsDone != null);
    return visitorSignedOut(
        showErrorMessages, isSubmitting, signOutFailureOrSuccessOption);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    Result getVisitorsDone(
        bool showErrorMessages,
        bool isSubmitting,
        Option<Either<VisitorFailure, List<dynamic>>>
            getVisitorsFailureOrSuccessOption),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (visitorSignedOut != null) {
      return visitorSignedOut(
          showErrorMessages, isSubmitting, signOutFailureOrSuccessOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_VisitorState value), {
    @required Result visitorSignedIn(VisitorSignedIn value),
    @required Result visitorSignedOut(VisitorSignedOut value),
    @required Result getVisitorsDone(GetVisitorDone value),
  }) {
    assert($default != null);
    assert(visitorSignedIn != null);
    assert(visitorSignedOut != null);
    assert(getVisitorsDone != null);
    return visitorSignedOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_VisitorState value), {
    Result visitorSignedIn(VisitorSignedIn value),
    Result visitorSignedOut(VisitorSignedOut value),
    Result getVisitorsDone(GetVisitorDone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (visitorSignedOut != null) {
      return visitorSignedOut(this);
    }
    return orElse();
  }
}

abstract class VisitorSignedOut implements VisitorState {
  factory VisitorSignedOut(
      {@required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<VisitorFailure, Unit>>
              signOutFailureOrSuccessOption}) = _$VisitorSignedOut;

  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  Option<Either<VisitorFailure, Unit>> get signOutFailureOrSuccessOption;
  @override
  $VisitorSignedOutCopyWith<VisitorSignedOut> get copyWith;
}

abstract class $GetVisitorDoneCopyWith<$Res>
    implements $VisitorStateCopyWith<$Res> {
  factory $GetVisitorDoneCopyWith(
          GetVisitorDone value, $Res Function(GetVisitorDone) then) =
      _$GetVisitorDoneCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showErrorMessages,
      bool isSubmitting,
      Option<Either<VisitorFailure, List<dynamic>>>
          getVisitorsFailureOrSuccessOption});
}

class _$GetVisitorDoneCopyWithImpl<$Res>
    extends _$VisitorStateCopyWithImpl<$Res>
    implements $GetVisitorDoneCopyWith<$Res> {
  _$GetVisitorDoneCopyWithImpl(
      GetVisitorDone _value, $Res Function(GetVisitorDone) _then)
      : super(_value, (v) => _then(v as GetVisitorDone));

  @override
  GetVisitorDone get _value => super._value as GetVisitorDone;

  @override
  $Res call({
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object getVisitorsFailureOrSuccessOption = freezed,
  }) {
    return _then(GetVisitorDone(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      getVisitorsFailureOrSuccessOption:
          getVisitorsFailureOrSuccessOption == freezed
              ? _value.getVisitorsFailureOrSuccessOption
              : getVisitorsFailureOrSuccessOption
                  as Option<Either<VisitorFailure, List<dynamic>>>,
    ));
  }
}

class _$GetVisitorDone implements GetVisitorDone {
  _$GetVisitorDone(
      {@required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.getVisitorsFailureOrSuccessOption})
      : assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(getVisitorsFailureOrSuccessOption != null);

  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<VisitorFailure, List<dynamic>>>
      getVisitorsFailureOrSuccessOption;

  @override
  String toString() {
    return 'VisitorState.getVisitorsDone(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, getVisitorsFailureOrSuccessOption: $getVisitorsFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetVisitorDone &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.getVisitorsFailureOrSuccessOption,
                    getVisitorsFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.getVisitorsFailureOrSuccessOption,
                    getVisitorsFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(getVisitorsFailureOrSuccessOption);

  @override
  $GetVisitorDoneCopyWith<GetVisitorDone> get copyWith =>
      _$GetVisitorDoneCopyWithImpl<GetVisitorDone>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    @required
        Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    @required
        Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
            Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    @required
        Result getVisitorsDone(
            bool showErrorMessages,
            bool isSubmitting,
            Option<Either<VisitorFailure, List<dynamic>>>
                getVisitorsFailureOrSuccessOption),
  }) {
    assert($default != null);
    assert(visitorSignedIn != null);
    assert(visitorSignedOut != null);
    assert(getVisitorsDone != null);
    return getVisitorsDone(
        showErrorMessages, isSubmitting, getVisitorsFailureOrSuccessOption);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool showErrorMessages, bool isSubmitting), {
    Result visitorSignedIn(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption),
    Result visitorSignedOut(bool showErrorMessages, bool isSubmitting,
        Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption),
    Result getVisitorsDone(
        bool showErrorMessages,
        bool isSubmitting,
        Option<Either<VisitorFailure, List<dynamic>>>
            getVisitorsFailureOrSuccessOption),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getVisitorsDone != null) {
      return getVisitorsDone(
          showErrorMessages, isSubmitting, getVisitorsFailureOrSuccessOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_VisitorState value), {
    @required Result visitorSignedIn(VisitorSignedIn value),
    @required Result visitorSignedOut(VisitorSignedOut value),
    @required Result getVisitorsDone(GetVisitorDone value),
  }) {
    assert($default != null);
    assert(visitorSignedIn != null);
    assert(visitorSignedOut != null);
    assert(getVisitorsDone != null);
    return getVisitorsDone(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_VisitorState value), {
    Result visitorSignedIn(VisitorSignedIn value),
    Result visitorSignedOut(VisitorSignedOut value),
    Result getVisitorsDone(GetVisitorDone value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getVisitorsDone != null) {
      return getVisitorsDone(this);
    }
    return orElse();
  }
}

abstract class GetVisitorDone implements VisitorState {
  factory GetVisitorDone(
      {@required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<VisitorFailure, List<dynamic>>>
              getVisitorsFailureOrSuccessOption}) = _$GetVisitorDone;

  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  Option<Either<VisitorFailure, List<dynamic>>>
      get getVisitorsFailureOrSuccessOption;
  @override
  $GetVisitorDoneCopyWith<GetVisitorDone> get copyWith;
}
