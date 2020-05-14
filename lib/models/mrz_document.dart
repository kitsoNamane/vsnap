import 'package:equatable/equatable.dart';
import 'package:mrz_parser/mrz_parser.dart';

class Document extends Equatable {
  final String names;
  final String surname;
  final String sex;
  final DateTime birthDate;
  final String documentType;
  final String documentNumber;
  final String countryCode;
  final String nationalityCountryCode;
  final String primaryId;
  final String secondaryId;
  final DateTime expiryDate;

  const Document({
    this.names,
    this.surname,
    this.sex,
    this.birthDate,
    this.documentType,
    this.documentNumber,
    this.countryCode,
    this.nationalityCountryCode,
    this.primaryId,
    this.secondaryId,
    this.expiryDate,
  });

  @override
  List<Object> get props => [
        names,
        surname,
        sex,
        birthDate,
        documentNumber,
        documentType,
        countryCode,
        nationalityCountryCode,
        primaryId,
        secondaryId,
        expiryDate
      ];

  static Document fromMRTD(MRZResult result) {
    if (result == null) return null;
    String sex = result.sex == Sex.male ? 'M' : 'F';
    return Document(
      names: result.givenNames.toLowerCase(),
      surname: result.surnames.toLowerCase(),
      sex: sex,
      birthDate: result.birthDate,
      documentType: result.documentType.toLowerCase(),
      documentNumber: result.documentNumber.toLowerCase(),
      countryCode: result.countryCode.toLowerCase(),
      nationalityCountryCode: result.nationalityCountryCode.toLowerCase(),
      primaryId: result.personalNumber.toLowerCase(),
      secondaryId: result.personalNumber2.toLowerCase(),
      expiryDate: result.expiryDate,
    );
  }

  Document copyWith({
    String names,
    String surname,
    String sex,
    DateTime birthDate,
    String documentType,
    String documentNumber,
    String countryCode,
    String nationalityCountryCode,
    String primaryId,
    String secondaryId,
    DateTime expiryDate,
  }) {
    return Document(
      names: names ?? this.names,
      surname: surname ?? this.surname,
      sex: sex ?? this.sex,
      birthDate: birthDate ?? this.birthDate,
      documentType: documentType ?? this.documentType,
      documentNumber: documentNumber ?? this.documentNumber,
      countryCode: countryCode ?? this.countryCode,
      nationalityCountryCode:
          nationalityCountryCode ?? this.nationalityCountryCode,
      primaryId: primaryId ?? this.primaryId,
      secondaryId: secondaryId ?? this.secondaryId,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Document &&
        o.names == names &&
        o.surname == surname &&
        o.sex == sex &&
        o.birthDate == birthDate &&
        o.documentType == documentType &&
        o.documentNumber == documentNumber &&
        o.countryCode == countryCode &&
        o.nationalityCountryCode == nationalityCountryCode &&
        o.primaryId == primaryId &&
        o.secondaryId == secondaryId &&
        o.expiryDate == expiryDate;
  }

  @override
  int get hashCode {
    return names.hashCode ^
        surname.hashCode ^
        sex.hashCode ^
        birthDate.hashCode ^
        documentType.hashCode ^
        documentNumber.hashCode ^
        countryCode.hashCode ^
        nationalityCountryCode.hashCode ^
        primaryId.hashCode ^
        secondaryId.hashCode ^
        expiryDate.hashCode;
  }

  @override
  String toString() {
    return 'Document(names: $names, surname: $surname, sex: $sex, birthDate: $birthDate, documentType: $documentType, documentNumber: $documentNumber, countryCode: $countryCode, nationalityCountryCode: $nationalityCountryCode, primaryId: $primaryId, secondaryId: $secondaryId, expiryDate: $expiryDate,)';
  }
}
