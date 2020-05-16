// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'visitor_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$VisitorFailureTearOff {
  const _$VisitorFailureTearOff();

  InvalidVisitorData invalidVisitorData() {
    return const InvalidVisitorData();
  }

  DatabaseError databaseError() {
    return const DatabaseError();
  }
}

// ignore: unused_element
const $VisitorFailure = _$VisitorFailureTearOff();

mixin _$VisitorFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidVisitorData(),
    @required Result databaseError(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidVisitorData(),
    Result databaseError(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidVisitorData(InvalidVisitorData value),
    @required Result databaseError(DatabaseError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidVisitorData(InvalidVisitorData value),
    Result databaseError(DatabaseError value),
    @required Result orElse(),
  });
}

abstract class $VisitorFailureCopyWith<$Res> {
  factory $VisitorFailureCopyWith(
          VisitorFailure value, $Res Function(VisitorFailure) then) =
      _$VisitorFailureCopyWithImpl<$Res>;
}

class _$VisitorFailureCopyWithImpl<$Res>
    implements $VisitorFailureCopyWith<$Res> {
  _$VisitorFailureCopyWithImpl(this._value, this._then);

  final VisitorFailure _value;
  // ignore: unused_field
  final $Res Function(VisitorFailure) _then;
}

abstract class $InvalidVisitorDataCopyWith<$Res> {
  factory $InvalidVisitorDataCopyWith(
          InvalidVisitorData value, $Res Function(InvalidVisitorData) then) =
      _$InvalidVisitorDataCopyWithImpl<$Res>;
}

class _$InvalidVisitorDataCopyWithImpl<$Res>
    extends _$VisitorFailureCopyWithImpl<$Res>
    implements $InvalidVisitorDataCopyWith<$Res> {
  _$InvalidVisitorDataCopyWithImpl(
      InvalidVisitorData _value, $Res Function(InvalidVisitorData) _then)
      : super(_value, (v) => _then(v as InvalidVisitorData));

  @override
  InvalidVisitorData get _value => super._value as InvalidVisitorData;
}

class _$InvalidVisitorData implements InvalidVisitorData {
  const _$InvalidVisitorData();

  @override
  String toString() {
    return 'VisitorFailure.invalidVisitorData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidVisitorData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidVisitorData(),
    @required Result databaseError(),
  }) {
    assert(invalidVisitorData != null);
    assert(databaseError != null);
    return invalidVisitorData();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidVisitorData(),
    Result databaseError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidVisitorData != null) {
      return invalidVisitorData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidVisitorData(InvalidVisitorData value),
    @required Result databaseError(DatabaseError value),
  }) {
    assert(invalidVisitorData != null);
    assert(databaseError != null);
    return invalidVisitorData(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidVisitorData(InvalidVisitorData value),
    Result databaseError(DatabaseError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidVisitorData != null) {
      return invalidVisitorData(this);
    }
    return orElse();
  }
}

abstract class InvalidVisitorData implements VisitorFailure {
  const factory InvalidVisitorData() = _$InvalidVisitorData;
}

abstract class $DatabaseErrorCopyWith<$Res> {
  factory $DatabaseErrorCopyWith(
          DatabaseError value, $Res Function(DatabaseError) then) =
      _$DatabaseErrorCopyWithImpl<$Res>;
}

class _$DatabaseErrorCopyWithImpl<$Res>
    extends _$VisitorFailureCopyWithImpl<$Res>
    implements $DatabaseErrorCopyWith<$Res> {
  _$DatabaseErrorCopyWithImpl(
      DatabaseError _value, $Res Function(DatabaseError) _then)
      : super(_value, (v) => _then(v as DatabaseError));

  @override
  DatabaseError get _value => super._value as DatabaseError;
}

class _$DatabaseError implements DatabaseError {
  const _$DatabaseError();

  @override
  String toString() {
    return 'VisitorFailure.databaseError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DatabaseError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidVisitorData(),
    @required Result databaseError(),
  }) {
    assert(invalidVisitorData != null);
    assert(databaseError != null);
    return databaseError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidVisitorData(),
    Result databaseError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (databaseError != null) {
      return databaseError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidVisitorData(InvalidVisitorData value),
    @required Result databaseError(DatabaseError value),
  }) {
    assert(invalidVisitorData != null);
    assert(databaseError != null);
    return databaseError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidVisitorData(InvalidVisitorData value),
    Result databaseError(DatabaseError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (databaseError != null) {
      return databaseError(this);
    }
    return orElse();
  }
}

abstract class DatabaseError implements VisitorFailure {
  const factory DatabaseError() = _$DatabaseError;
}
