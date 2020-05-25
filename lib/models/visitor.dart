import 'package:equatable/equatable.dart';

import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/data/local/moor_database.dart' as db;

class Visitor extends Equatable {
  final Document person;
  final String purpose;
  final int phone;
  final DateTime timeIn;
  final DateTime timeOut;
  final double temperature;

  const Visitor({
    this.person,
    this.purpose,
    this.phone,
    this.timeIn,
    this.timeOut,
    this.temperature,
  });

  @override
  List<Object> get props => [person, purpose, phone, timeIn, timeOut];

  static Visitor create(Document doc, Map<String, String> map) {
    if (doc == null) return null;

    return Visitor(
      person: doc,
      temperature: double.tryParse(map['temperature']),
      phone: int.tryParse(map['phone']),
      timeIn: DateTime.now(),
      timeOut: null,
    );
  }

  db.Visitor toDBVisitor() {
    //! this is the only place I'm calling length
    var names = person.names.split(" ").length >= 2
        ? person.names.split(" ")
        : [
            person.names,
            null,
          ];
    final visitor = db.Visitor(
      nationalId: person.primaryId,
      passportNumber: person.secondaryId,
      documentType: person.documentType,
      documentNumber: person.documentNumber,
      nationalityCountryCode: person.nationalityCountryCode,
      firstName: names[0],
      middleName: names[1],
      lastName: person.surname,
      birthday: person.birthDate,
      sex: person.sex,
      temperature: temperature,
      phoneNumber: phone,
    );
    return visitor;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Visitor &&
        o.person == person &&
        o.purpose == purpose &&
        o.phone == phone &&
        o.timeIn == timeIn &&
        o.timeOut == timeOut;
  }

  Visitor copyWith({
    Document person,
    String purpose,
    int phone,
    DateTime timeIn,
    DateTime timeOut,
  }) {
    return Visitor(
      person: person ?? this.person,
      purpose: purpose ?? this.purpose,
      phone: phone ?? this.phone,
      timeIn: timeIn ?? this.timeIn,
      timeOut: timeOut ?? this.timeOut,
    );
  }

  @override
  int get hashCode {
    return person.hashCode ^
        purpose.hashCode ^
        phone.hashCode ^
        timeIn.hashCode ^
        timeOut.hashCode;
  }

  @override
  String toString() {
    return 'Visitor(person: $person, temperature: $temperature, phone: $phone, timeIn: $timeIn, timeOut: $timeOut)';
  }
}
