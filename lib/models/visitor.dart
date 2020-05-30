import 'dart:convert';

import 'mrz_document.dart';

class Visitor {
  final int id;
  final String firstname;
  final String middlename;
  final String surname;
  final String sex;
  final DateTime birthday;
  final int phone;
  final DateTime timeIn;
  final DateTime timeOut;
  final double temperature;
  final String nationalId;
  final String passportNumber;
  final String documentType;
  final DateTime expiryDate;
  final String documentNumber;

  const Visitor({
    this.id,
    this.firstname,
    this.middlename,
    this.surname,
    this.sex,
    this.birthday,
    this.phone,
    this.timeIn,
    this.timeOut,
    this.temperature,
    this.nationalId,
    this.passportNumber,
    this.documentType,
    this.expiryDate,
    this.documentNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'middlename': middlename,
      'surname': surname,
      'document_number': documentNumber,
      'sex': sex,
      'birthday': birthday?.millisecondsSinceEpoch,
      'phone_number': phone,
      'time_in': timeIn?.millisecondsSinceEpoch,
      'time_out': timeOut?.millisecondsSinceEpoch,
      'temperature': temperature,
      'national_id': nationalId,
      'passport_number': passportNumber,
      'document_type': documentType,
      'expiry_date': expiryDate?.millisecondsSinceEpoch,
    };
  }

  static Visitor create(Document doc, Map<String, String> map) {
    if (doc == null) return null;
    final _splitNames = doc.names.trim().split('\n');
    final _names =
        _splitNames.length > 1 ? _splitNames : [_splitNames[0], null];

    return Visitor(
      firstname: _names[0],
      middlename: _names[1],
      surname: doc.surname,
      sex: doc.sex,
      birthday: doc.birthDate,
      nationalId: doc.primaryId,
      passportNumber: doc.secondaryId,
      documentType: doc.documentType,
      phone: int.tryParse(map['phone']),
      timeIn: DateTime.now(),
      timeOut: null,
      temperature: double.tryParse(map['temperature']),
      expiryDate: doc.expiryDate,
      documentNumber: doc.documentNumber,
    );
  }

  Visitor signOut() {
    return copyWith(timeOut: DateTime.now());
  }

  Visitor copyWith({
    int id,
    String firstname,
    String middlename,
    String surname,
    String sex,
    DateTime birthday,
    int phone,
    DateTime timeIn,
    DateTime timeOut,
    double temperature,
    String nationalId,
    String passportNumber,
    String documentType,
    DateTime expiryDate,
  }) {
    return Visitor(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      middlename: middlename ?? this.middlename,
      surname: surname ?? this.surname,
      sex: sex ?? this.sex,
      birthday: birthday ?? this.birthday,
      phone: phone ?? this.phone,
      timeIn: timeIn ?? this.timeIn,
      timeOut: timeOut ?? this.timeOut,
      temperature: temperature ?? this.temperature,
      nationalId: nationalId ?? this.nationalId,
      passportNumber: passportNumber ?? this.passportNumber,
      documentType: documentType ?? this.documentType,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  static Visitor fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Visitor(
      id: map['id'],
      firstname: map['firstname'],
      middlename: map['middlename'],
      surname: map['surname'],
      sex: map['sex'],
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday']),
      phone: map['phone_number'],
      timeIn: DateTime.fromMillisecondsSinceEpoch(map['time_in']),
      timeOut: map['time_out'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['time_out'])
          : null,
      temperature: map['temperature'],
      nationalId: map['national_id'],
      passportNumber: map['passport_number'],
      documentType: map['document_type'],
      expiryDate: map['expiry_date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['expiry_date'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  static Visitor fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Visitor(id: $id, firstname: $firstname, middlename: $middlename, surname: $surname, sex: $sex, birthday: $birthday, phone: $phone, timeIn: $timeIn, timeOut: $timeOut, temperature: $temperature, nationalId: $nationalId, passportNumber: $passportNumber, documentType: $documentType, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Visitor &&
        o.id == id &&
        o.firstname == firstname &&
        o.middlename == middlename &&
        o.surname == surname &&
        o.sex == sex &&
        o.birthday == birthday &&
        o.phone == phone &&
        o.timeIn == timeIn &&
        o.timeOut == timeOut &&
        o.temperature == temperature &&
        o.nationalId == nationalId &&
        o.passportNumber == passportNumber &&
        o.documentType == documentType &&
        o.expiryDate == expiryDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstname.hashCode ^
        middlename.hashCode ^
        surname.hashCode ^
        sex.hashCode ^
        birthday.hashCode ^
        phone.hashCode ^
        timeIn.hashCode ^
        timeOut.hashCode ^
        temperature.hashCode ^
        nationalId.hashCode ^
        passportNumber.hashCode ^
        documentType.hashCode ^
        expiryDate.hashCode;
  }
}
