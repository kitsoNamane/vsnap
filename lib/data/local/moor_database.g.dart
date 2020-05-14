// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Visitor extends DataClass implements Insertable<Visitor> {
  final int id;
  final String nationalId;
  final String passportNumber;
  final String documentType;
  final String documentNumber;
  final String nationalityCountryCode;
  final DateTime expiryDate;
  final String firstName;
  final String middleName;
  final String lastName;
  final String sex;
  final DateTime birthday;
  final double temperature;
  final DateTime timeIn;
  final DateTime timeOut;
  final String plateNumber;
  final int phoneNumber;
  Visitor(
      {@required this.id,
      this.nationalId,
      this.passportNumber,
      this.documentType,
      this.documentNumber,
      this.nationalityCountryCode,
      this.expiryDate,
      this.firstName,
      this.middleName,
      this.lastName,
      this.sex,
      this.birthday,
      this.temperature,
      this.timeIn,
      this.timeOut,
      this.plateNumber,
      this.phoneNumber});
  factory Visitor.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Visitor(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nationalId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}national_id']),
      passportNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}passport_number']),
      documentType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}document_type']),
      documentNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}document_number']),
      nationalityCountryCode: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}nationality_country_code']),
      expiryDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}expiry_date']),
      firstName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      middleName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}middle_name']),
      lastName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      sex: stringType.mapFromDatabaseResponse(data['${effectivePrefix}sex']),
      birthday: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}birthday']),
      temperature: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}temperature']),
      timeIn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_in']),
      timeOut: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_out']),
      plateNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}plate_number']),
      phoneNumber: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number']),
    );
  }
  factory Visitor.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Visitor(
      id: serializer.fromJson<int>(json['id']),
      nationalId: serializer.fromJson<String>(json['nationalId']),
      passportNumber: serializer.fromJson<String>(json['passportNumber']),
      documentType: serializer.fromJson<String>(json['documentType']),
      documentNumber: serializer.fromJson<String>(json['documentNumber']),
      nationalityCountryCode:
          serializer.fromJson<String>(json['nationalityCountryCode']),
      expiryDate: serializer.fromJson<DateTime>(json['expiryDate']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String>(json['middleName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      sex: serializer.fromJson<String>(json['sex']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
      temperature: serializer.fromJson<double>(json['temperature']),
      timeIn: serializer.fromJson<DateTime>(json['timeIn']),
      timeOut: serializer.fromJson<DateTime>(json['timeOut']),
      plateNumber: serializer.fromJson<String>(json['plateNumber']),
      phoneNumber: serializer.fromJson<int>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nationalId': serializer.toJson<String>(nationalId),
      'passportNumber': serializer.toJson<String>(passportNumber),
      'documentType': serializer.toJson<String>(documentType),
      'documentNumber': serializer.toJson<String>(documentNumber),
      'nationalityCountryCode':
          serializer.toJson<String>(nationalityCountryCode),
      'expiryDate': serializer.toJson<DateTime>(expiryDate),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String>(middleName),
      'lastName': serializer.toJson<String>(lastName),
      'sex': serializer.toJson<String>(sex),
      'birthday': serializer.toJson<DateTime>(birthday),
      'temperature': serializer.toJson<double>(temperature),
      'timeIn': serializer.toJson<DateTime>(timeIn),
      'timeOut': serializer.toJson<DateTime>(timeOut),
      'plateNumber': serializer.toJson<String>(plateNumber),
      'phoneNumber': serializer.toJson<int>(phoneNumber),
    };
  }

  @override
  VisitorsCompanion createCompanion(bool nullToAbsent) {
    return VisitorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nationalId: nationalId == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalId),
      passportNumber: passportNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(passportNumber),
      documentType: documentType == null && nullToAbsent
          ? const Value.absent()
          : Value(documentType),
      documentNumber: documentNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(documentNumber),
      nationalityCountryCode: nationalityCountryCode == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalityCountryCode),
      expiryDate: expiryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expiryDate),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      birthday: birthday == null && nullToAbsent
          ? const Value.absent()
          : Value(birthday),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      timeIn:
          timeIn == null && nullToAbsent ? const Value.absent() : Value(timeIn),
      timeOut: timeOut == null && nullToAbsent
          ? const Value.absent()
          : Value(timeOut),
      plateNumber: plateNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(plateNumber),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
    );
  }

  Visitor copyWith(
          {int id,
          String nationalId,
          String passportNumber,
          String documentType,
          String documentNumber,
          String nationalityCountryCode,
          DateTime expiryDate,
          String firstName,
          String middleName,
          String lastName,
          String sex,
          DateTime birthday,
          double temperature,
          DateTime timeIn,
          DateTime timeOut,
          String plateNumber,
          int phoneNumber}) =>
      Visitor(
        id: id ?? this.id,
        nationalId: nationalId ?? this.nationalId,
        passportNumber: passportNumber ?? this.passportNumber,
        documentType: documentType ?? this.documentType,
        documentNumber: documentNumber ?? this.documentNumber,
        nationalityCountryCode:
            nationalityCountryCode ?? this.nationalityCountryCode,
        expiryDate: expiryDate ?? this.expiryDate,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        birthday: birthday ?? this.birthday,
        temperature: temperature ?? this.temperature,
        timeIn: timeIn ?? this.timeIn,
        timeOut: timeOut ?? this.timeOut,
        plateNumber: plateNumber ?? this.plateNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
  @override
  String toString() {
    return (StringBuffer('Visitor(')
          ..write('id: $id, ')
          ..write('nationalId: $nationalId, ')
          ..write('passportNumber: $passportNumber, ')
          ..write('documentType: $documentType, ')
          ..write('documentNumber: $documentNumber, ')
          ..write('nationalityCountryCode: $nationalityCountryCode, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('sex: $sex, ')
          ..write('birthday: $birthday, ')
          ..write('temperature: $temperature, ')
          ..write('timeIn: $timeIn, ')
          ..write('timeOut: $timeOut, ')
          ..write('plateNumber: $plateNumber, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          nationalId.hashCode,
          $mrjc(
              passportNumber.hashCode,
              $mrjc(
                  documentType.hashCode,
                  $mrjc(
                      documentNumber.hashCode,
                      $mrjc(
                          nationalityCountryCode.hashCode,
                          $mrjc(
                              expiryDate.hashCode,
                              $mrjc(
                                  firstName.hashCode,
                                  $mrjc(
                                      middleName.hashCode,
                                      $mrjc(
                                          lastName.hashCode,
                                          $mrjc(
                                              sex.hashCode,
                                              $mrjc(
                                                  birthday.hashCode,
                                                  $mrjc(
                                                      temperature.hashCode,
                                                      $mrjc(
                                                          timeIn.hashCode,
                                                          $mrjc(
                                                              timeOut.hashCode,
                                                              $mrjc(
                                                                  plateNumber
                                                                      .hashCode,
                                                                  phoneNumber
                                                                      .hashCode)))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Visitor &&
          other.id == this.id &&
          other.nationalId == this.nationalId &&
          other.passportNumber == this.passportNumber &&
          other.documentType == this.documentType &&
          other.documentNumber == this.documentNumber &&
          other.nationalityCountryCode == this.nationalityCountryCode &&
          other.expiryDate == this.expiryDate &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.sex == this.sex &&
          other.birthday == this.birthday &&
          other.temperature == this.temperature &&
          other.timeIn == this.timeIn &&
          other.timeOut == this.timeOut &&
          other.plateNumber == this.plateNumber &&
          other.phoneNumber == this.phoneNumber);
}

class VisitorsCompanion extends UpdateCompanion<Visitor> {
  final Value<int> id;
  final Value<String> nationalId;
  final Value<String> passportNumber;
  final Value<String> documentType;
  final Value<String> documentNumber;
  final Value<String> nationalityCountryCode;
  final Value<DateTime> expiryDate;
  final Value<String> firstName;
  final Value<String> middleName;
  final Value<String> lastName;
  final Value<String> sex;
  final Value<DateTime> birthday;
  final Value<double> temperature;
  final Value<DateTime> timeIn;
  final Value<DateTime> timeOut;
  final Value<String> plateNumber;
  final Value<int> phoneNumber;
  const VisitorsCompanion({
    this.id = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.passportNumber = const Value.absent(),
    this.documentType = const Value.absent(),
    this.documentNumber = const Value.absent(),
    this.nationalityCountryCode = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthday = const Value.absent(),
    this.temperature = const Value.absent(),
    this.timeIn = const Value.absent(),
    this.timeOut = const Value.absent(),
    this.plateNumber = const Value.absent(),
    this.phoneNumber = const Value.absent(),
  });
  VisitorsCompanion.insert({
    this.id = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.passportNumber = const Value.absent(),
    this.documentType = const Value.absent(),
    this.documentNumber = const Value.absent(),
    this.nationalityCountryCode = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthday = const Value.absent(),
    this.temperature = const Value.absent(),
    this.timeIn = const Value.absent(),
    this.timeOut = const Value.absent(),
    this.plateNumber = const Value.absent(),
    this.phoneNumber = const Value.absent(),
  });
  VisitorsCompanion copyWith(
      {Value<int> id,
      Value<String> nationalId,
      Value<String> passportNumber,
      Value<String> documentType,
      Value<String> documentNumber,
      Value<String> nationalityCountryCode,
      Value<DateTime> expiryDate,
      Value<String> firstName,
      Value<String> middleName,
      Value<String> lastName,
      Value<String> sex,
      Value<DateTime> birthday,
      Value<double> temperature,
      Value<DateTime> timeIn,
      Value<DateTime> timeOut,
      Value<String> plateNumber,
      Value<int> phoneNumber}) {
    return VisitorsCompanion(
      id: id ?? this.id,
      nationalId: nationalId ?? this.nationalId,
      passportNumber: passportNumber ?? this.passportNumber,
      documentType: documentType ?? this.documentType,
      documentNumber: documentNumber ?? this.documentNumber,
      nationalityCountryCode:
          nationalityCountryCode ?? this.nationalityCountryCode,
      expiryDate: expiryDate ?? this.expiryDate,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      sex: sex ?? this.sex,
      birthday: birthday ?? this.birthday,
      temperature: temperature ?? this.temperature,
      timeIn: timeIn ?? this.timeIn,
      timeOut: timeOut ?? this.timeOut,
      plateNumber: plateNumber ?? this.plateNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}

class $VisitorsTable extends Visitors with TableInfo<$VisitorsTable, Visitor> {
  final GeneratedDatabase _db;
  final String _alias;
  $VisitorsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nationalIdMeta = const VerificationMeta('nationalId');
  GeneratedTextColumn _nationalId;
  @override
  GeneratedTextColumn get nationalId => _nationalId ??= _constructNationalId();
  GeneratedTextColumn _constructNationalId() {
    return GeneratedTextColumn(
      'national_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _passportNumberMeta =
      const VerificationMeta('passportNumber');
  GeneratedTextColumn _passportNumber;
  @override
  GeneratedTextColumn get passportNumber =>
      _passportNumber ??= _constructPassportNumber();
  GeneratedTextColumn _constructPassportNumber() {
    return GeneratedTextColumn(
      'passport_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _documentTypeMeta =
      const VerificationMeta('documentType');
  GeneratedTextColumn _documentType;
  @override
  GeneratedTextColumn get documentType =>
      _documentType ??= _constructDocumentType();
  GeneratedTextColumn _constructDocumentType() {
    return GeneratedTextColumn(
      'document_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _documentNumberMeta =
      const VerificationMeta('documentNumber');
  GeneratedTextColumn _documentNumber;
  @override
  GeneratedTextColumn get documentNumber =>
      _documentNumber ??= _constructDocumentNumber();
  GeneratedTextColumn _constructDocumentNumber() {
    return GeneratedTextColumn(
      'document_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nationalityCountryCodeMeta =
      const VerificationMeta('nationalityCountryCode');
  GeneratedTextColumn _nationalityCountryCode;
  @override
  GeneratedTextColumn get nationalityCountryCode =>
      _nationalityCountryCode ??= _constructNationalityCountryCode();
  GeneratedTextColumn _constructNationalityCountryCode() {
    return GeneratedTextColumn(
      'nationality_country_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expiryDateMeta = const VerificationMeta('expiryDate');
  GeneratedDateTimeColumn _expiryDate;
  @override
  GeneratedDateTimeColumn get expiryDate =>
      _expiryDate ??= _constructExpiryDate();
  GeneratedDateTimeColumn _constructExpiryDate() {
    return GeneratedDateTimeColumn(
      'expiry_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  GeneratedTextColumn _firstName;
  @override
  GeneratedTextColumn get firstName => _firstName ??= _constructFirstName();
  GeneratedTextColumn _constructFirstName() {
    return GeneratedTextColumn(
      'first_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _middleNameMeta = const VerificationMeta('middleName');
  GeneratedTextColumn _middleName;
  @override
  GeneratedTextColumn get middleName => _middleName ??= _constructMiddleName();
  GeneratedTextColumn _constructMiddleName() {
    return GeneratedTextColumn(
      'middle_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  GeneratedTextColumn _lastName;
  @override
  GeneratedTextColumn get lastName => _lastName ??= _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn(
      'last_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _sexMeta = const VerificationMeta('sex');
  GeneratedTextColumn _sex;
  @override
  GeneratedTextColumn get sex => _sex ??= _constructSex();
  GeneratedTextColumn _constructSex() {
    return GeneratedTextColumn(
      'sex',
      $tableName,
      true,
    );
  }

  final VerificationMeta _birthdayMeta = const VerificationMeta('birthday');
  GeneratedDateTimeColumn _birthday;
  @override
  GeneratedDateTimeColumn get birthday => _birthday ??= _constructBirthday();
  GeneratedDateTimeColumn _constructBirthday() {
    return GeneratedDateTimeColumn(
      'birthday',
      $tableName,
      true,
    );
  }

  final VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  GeneratedRealColumn _temperature;
  @override
  GeneratedRealColumn get temperature =>
      _temperature ??= _constructTemperature();
  GeneratedRealColumn _constructTemperature() {
    return GeneratedRealColumn(
      'temperature',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeInMeta = const VerificationMeta('timeIn');
  GeneratedDateTimeColumn _timeIn;
  @override
  GeneratedDateTimeColumn get timeIn => _timeIn ??= _constructTimeIn();
  GeneratedDateTimeColumn _constructTimeIn() {
    return GeneratedDateTimeColumn(
      'time_in',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeOutMeta = const VerificationMeta('timeOut');
  GeneratedDateTimeColumn _timeOut;
  @override
  GeneratedDateTimeColumn get timeOut => _timeOut ??= _constructTimeOut();
  GeneratedDateTimeColumn _constructTimeOut() {
    return GeneratedDateTimeColumn(
      'time_out',
      $tableName,
      true,
    );
  }

  final VerificationMeta _plateNumberMeta =
      const VerificationMeta('plateNumber');
  GeneratedTextColumn _plateNumber;
  @override
  GeneratedTextColumn get plateNumber =>
      _plateNumber ??= _constructPlateNumber();
  GeneratedTextColumn _constructPlateNumber() {
    return GeneratedTextColumn(
      'plate_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  GeneratedIntColumn _phoneNumber;
  @override
  GeneratedIntColumn get phoneNumber =>
      _phoneNumber ??= _constructPhoneNumber();
  GeneratedIntColumn _constructPhoneNumber() {
    return GeneratedIntColumn(
      'phone_number',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        nationalId,
        passportNumber,
        documentType,
        documentNumber,
        nationalityCountryCode,
        expiryDate,
        firstName,
        middleName,
        lastName,
        sex,
        birthday,
        temperature,
        timeIn,
        timeOut,
        plateNumber,
        phoneNumber
      ];
  @override
  $VisitorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'visitors';
  @override
  final String actualTableName = 'visitors';
  @override
  VerificationContext validateIntegrity(VisitorsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.nationalId.present) {
      context.handle(_nationalIdMeta,
          nationalId.isAcceptableValue(d.nationalId.value, _nationalIdMeta));
    }
    if (d.passportNumber.present) {
      context.handle(
          _passportNumberMeta,
          passportNumber.isAcceptableValue(
              d.passportNumber.value, _passportNumberMeta));
    }
    if (d.documentType.present) {
      context.handle(
          _documentTypeMeta,
          documentType.isAcceptableValue(
              d.documentType.value, _documentTypeMeta));
    }
    if (d.documentNumber.present) {
      context.handle(
          _documentNumberMeta,
          documentNumber.isAcceptableValue(
              d.documentNumber.value, _documentNumberMeta));
    }
    if (d.nationalityCountryCode.present) {
      context.handle(
          _nationalityCountryCodeMeta,
          nationalityCountryCode.isAcceptableValue(
              d.nationalityCountryCode.value, _nationalityCountryCodeMeta));
    }
    if (d.expiryDate.present) {
      context.handle(_expiryDateMeta,
          expiryDate.isAcceptableValue(d.expiryDate.value, _expiryDateMeta));
    }
    if (d.firstName.present) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableValue(d.firstName.value, _firstNameMeta));
    }
    if (d.middleName.present) {
      context.handle(_middleNameMeta,
          middleName.isAcceptableValue(d.middleName.value, _middleNameMeta));
    }
    if (d.lastName.present) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableValue(d.lastName.value, _lastNameMeta));
    }
    if (d.sex.present) {
      context.handle(_sexMeta, sex.isAcceptableValue(d.sex.value, _sexMeta));
    }
    if (d.birthday.present) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableValue(d.birthday.value, _birthdayMeta));
    }
    if (d.temperature.present) {
      context.handle(_temperatureMeta,
          temperature.isAcceptableValue(d.temperature.value, _temperatureMeta));
    }
    if (d.timeIn.present) {
      context.handle(
          _timeInMeta, timeIn.isAcceptableValue(d.timeIn.value, _timeInMeta));
    }
    if (d.timeOut.present) {
      context.handle(_timeOutMeta,
          timeOut.isAcceptableValue(d.timeOut.value, _timeOutMeta));
    }
    if (d.plateNumber.present) {
      context.handle(_plateNumberMeta,
          plateNumber.isAcceptableValue(d.plateNumber.value, _plateNumberMeta));
    }
    if (d.phoneNumber.present) {
      context.handle(_phoneNumberMeta,
          phoneNumber.isAcceptableValue(d.phoneNumber.value, _phoneNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Visitor map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Visitor.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(VisitorsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.nationalId.present) {
      map['national_id'] = Variable<String, StringType>(d.nationalId.value);
    }
    if (d.passportNumber.present) {
      map['passport_number'] =
          Variable<String, StringType>(d.passportNumber.value);
    }
    if (d.documentType.present) {
      map['document_type'] = Variable<String, StringType>(d.documentType.value);
    }
    if (d.documentNumber.present) {
      map['document_number'] =
          Variable<String, StringType>(d.documentNumber.value);
    }
    if (d.nationalityCountryCode.present) {
      map['nationality_country_code'] =
          Variable<String, StringType>(d.nationalityCountryCode.value);
    }
    if (d.expiryDate.present) {
      map['expiry_date'] = Variable<DateTime, DateTimeType>(d.expiryDate.value);
    }
    if (d.firstName.present) {
      map['first_name'] = Variable<String, StringType>(d.firstName.value);
    }
    if (d.middleName.present) {
      map['middle_name'] = Variable<String, StringType>(d.middleName.value);
    }
    if (d.lastName.present) {
      map['last_name'] = Variable<String, StringType>(d.lastName.value);
    }
    if (d.sex.present) {
      map['sex'] = Variable<String, StringType>(d.sex.value);
    }
    if (d.birthday.present) {
      map['birthday'] = Variable<DateTime, DateTimeType>(d.birthday.value);
    }
    if (d.temperature.present) {
      map['temperature'] = Variable<double, RealType>(d.temperature.value);
    }
    if (d.timeIn.present) {
      map['time_in'] = Variable<DateTime, DateTimeType>(d.timeIn.value);
    }
    if (d.timeOut.present) {
      map['time_out'] = Variable<DateTime, DateTimeType>(d.timeOut.value);
    }
    if (d.plateNumber.present) {
      map['plate_number'] = Variable<String, StringType>(d.plateNumber.value);
    }
    if (d.phoneNumber.present) {
      map['phone_number'] = Variable<int, IntType>(d.phoneNumber.value);
    }
    return map;
  }

  @override
  $VisitorsTable createAlias(String alias) {
    return $VisitorsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $VisitorsTable _visitors;
  $VisitorsTable get visitors => _visitors ??= $VisitorsTable(this);
  VisitorDao _visitorDao;
  VisitorDao get visitorDao => _visitorDao ??= VisitorDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [visitors];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$VisitorDaoMixin on DatabaseAccessor<AppDatabase> {
  $VisitorsTable get visitors => db.visitors;
}
