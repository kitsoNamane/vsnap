import 'package:mrz_parser/mrz_parser.dart';
import 'dart:developer' as developer;

import 'package:vsnap/models/mrz_document.dart';

const String _td1_pattern =
    r"([A|C|I][A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{9})([0-9]{1})([A-Z0-9<]{15})\n([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z]{3})([A-Z0-9<]{11})([0-9]{1})\n([A-Z0-9<]{30})";
const String _td2_pattern =
    "([A|C|I][A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{31})\n([A-Z0-9<]{9})([0-9]{1})([A-Z]{3})([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z0-9<]{7})([0-9]{1})";
const String _td1_or_td2 = "$_td1_pattern|$_td2_pattern";

final RegExp regex = new RegExp(_td1_or_td2);

// MRTD -> Machine Readable Travel Document such as passports and national IDs
bool isMRTD(String input) {
  return regex.hasMatch(input);
}

String getMRTDmatch(String input) {
  // returns the first match of block with matching pattern
  return regex.stringMatch(input);
}

Document decodeMRTD(String input) {
  developer.log("$input", name: "AppMain");
  final getMRZ = getMRTDmatch(input);
  if (getMRZ == null) return null;
  final mrz = getMRZ.split("\n");
  var document = Document.fromMRTD(MRZParser.parse(mrz));
  return document;
}