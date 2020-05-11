import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:mrz_parser/mrz_parser.dart';

import 'package:vsnap/models/mrz_document.dart';

class Visitor extends Equatable {
  final Document person;
  final String purpose;
  final int phone;
  final DateTime timeIn;
  final DateTime timeOut;

  const Visitor({
    this.person,
    this.purpose,
    this.phone,
    this.timeIn,
    this.timeOut,
  });

  @override
  List<Object> get props => [person, purpose, phone, timeIn, timeOut];

  static Visitor create(MRZResult result, Map<String, dynamic> map) {
    if (result == null) return null;

    return Visitor(
      person: Document.fromMRTD(result),
      purpose: map['purpose'].toString().toLowerCase(),
      phone: map['phone'],
      timeIn: DateTime.now(),
      timeOut: null,
    );
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
    return 'Visitor(person: $person, purpose: $purpose, phone: $phone, timeIn: $timeIn, timeOut: $timeOut)';
  }
}
