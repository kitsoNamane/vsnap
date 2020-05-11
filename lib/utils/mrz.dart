import 'package:mrz_parser/mrz_parser.dart';
import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/data/local/moor_database.dart';

final String _td1_pattern =
    r"([A|C|I][A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{9})([0-9]{1})([A-Z0-9<]{15})\n([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z]{3})([A-Z0-9<]{11})([0-9]{1})\n([A-Z0-9<]{30})";
final String _td2_pattern =
    r"([A|C|I][A-Z0-9<]{1})([A-Z]{3})([A-Z0-9<]{31})\n([A-Z0-9<]{9})([0-9]{1})([A-Z]{3})([0-9]{6})([0-9]{1})([M|F|X|<]{1})([0-9]{6})([0-9]{1})([A-Z0-9<]{7})([0-9]{1})";
final String _td1_string = '''I<SWE59000002<8198703142391<<<
8703145M1701027SWE<<<<<<<<<<<8
SPECIMEN<<SVEN<<<<<<<<<<<<<<<<''';
final String _td2_string = '''I<UTOERIKSSON<<ANNA<MARIA<<<<<<<<<<<
D231458907UTO7408122F1204159<<<<<<<6''';
final String _td1_or_td2 = "$_td1_pattern|$_td2_pattern";

final RegExp regex = new RegExp(_td1_or_td2);

// MRTD -> Machine Readable Travel Document such as passports and national IDs
bool isMRTD(String input) {
  var x = AppDatabase().visitorDao;
  return regex.hasMatch(input);
}

String getMRTDmatch(String input) {
  // returns the first match of block with matching pattern
  return regex.stringMatch(input);
}


MRZResult decodeMRTD(String input) {
  final getMRZ = getMRTDmatch(input);
  if (getMRZ == null) return null;
  final mrz = getMRZ.split("\n");
  return MRZParser.parse(mrz);
}
