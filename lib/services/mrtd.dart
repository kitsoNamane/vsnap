import 'package:dartz/dartz.dart';
import 'package:mrz_parser/mrz_parser.dart';
import 'package:vsnap/failures/mrtd_failure.dart';

import 'package:vsnap/models/mrz_document.dart';

class MRTD{
  static const String TD1Pattern =
      r"([A|C|I][A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{9})([0-9]{1})([A-Z0-9<]{15})\n([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z]{3})([A-Z0-9<]{11})([0-9]{1})\n([A-Z0-9<]{30})";
  static const String TD2Pattern =
      r"([A|C|I][A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{31})\n([A-Z0-9<]{9})([0-9]{1})([A-Z]{3})([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z0-9<]{7})([0-9]{1})";

  static const String TD3Pattern =
      r"(P[A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{39})\n([A-Z0-9<]{9})([0-9]{1})([A-Z]{3})([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z0-9<]{14})([0-9]{1})([0-9]{1})";

  static const String MRVAPattern =
      r"(V[A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{39})\n([A-Z0-9<]{9})([0-9]{1})([A-Z]{3})([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z0-9<]{16})";

  static const String MRVBPattern =
      r"(V[A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{31})\n([A-Z0-9<]{9})([0-9]{1})([A-Z]{3})([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z0-9<]{8})";

  static const String MRTDRegex = "$TD1Pattern|$TD2Pattern|$TD3Pattern";

  static final RegExp regex = new RegExp(MRTDRegex);

  // MRTD -> Machine Readable Travel Document such as passports and national IDs
  static bool isMRTD(String input) {
    return regex.hasMatch(input);
  }

  static String getMRTDmatch(String input) {
    // returns the first match of block with matching pattern
    return regex.stringMatch(input);
  }

  static Either<MRTDFailure, Document> decodeMRTD(String input) {
    try {
      final getMRZ = getMRTDmatch(input);
      if (getMRZ == null) return null;
      final mrz = getMRZ.split("\n");
      final document = Document.fromMRTD(MRZParser.parse(mrz));
      return right(document);
    } catch (e) {
      return left(MRTDFailure.invalidMRTDText());
    }
  }
}
