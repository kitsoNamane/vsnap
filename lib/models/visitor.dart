import 'package:equatable/equatable.dart';
import 'package:moor/moor.dart';

import 'package:vsnap/data/local/moor_database.dart' as db;

import 'mrz_document.dart';


class VisitorModel extends Equatable {
  final Document person;
  final String purpose;
  final int phone;
  final DateTime timeIn;
  final DateTime timeOut;
  final double temperature;


  const VisitorModel({
    this.person,
    this.purpose,
    this.phone,
    this.timeIn,
    this.timeOut,
    this.temperature,
  });

  @override
  List<Object> get props => [person, purpose, phone, timeIn, timeOut];

  static VisitorModel create(Document doc, Map<String, String> map) {
    if (doc == null) return null;

    return VisitorModel(
      person: doc,
      temperature: double.tryParse(map['temperature']),
      phone: int.tryParse(map['phone']),
      timeIn: DateTime.now(),
      timeOut: null,
    );
  }

  db.VisitorsCompanion toDBVisitor() {
    //! this is the only place I'm calling length
    var names = person.names.split(" ").length >= 2
        ? person.names.split(" ")
        : [
            person.names,
            null,
          ];
    final visitor = db.VisitorsCompanion(
      nationalId: Value(person.primaryId),
      passportNumber: Value(person.secondaryId),
      documentType: Value(person.documentType),
      documentNumber: Value(person.documentNumber),
      nationalityCountryCode: Value(person.nationalityCountryCode),
      firstName: Value(names[0]),
      middleName: Value(names[1]),
      lastName: Value(person.surname),
      birthday: Value(person.birthDate),
      sex: Value(person.sex),
      temperature: Value(temperature),
      phoneNumber: Value(phone),
    );
    return visitor;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is VisitorModel &&
        o.person == person &&
        o.purpose == purpose &&
        o.phone == phone &&
        o.timeIn == timeIn &&
        o.timeOut == timeOut;
  }

  VisitorModel copyWith({
    Document person,
    String purpose,
    int phone,
    DateTime timeIn,
    DateTime timeOut,
  }) {
    return VisitorModel(
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
