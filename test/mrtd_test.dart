import 'package:flutter_test/flutter_test.dart';
import 'package:mrz_parser/mrz_parser.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/utils/mrz.dart';

void main() {
  final testTD1String = '''ACBWAD0091889<8382212211<<<<<<
9504109M2201122BWA04000694<<<7
NAMANE<<KITSO<GIDION<<<<<<<<<<''';

  test('it should check for TD1 validity', () {
    final check = isMRTD(testTD1String);
    expect(true, check);
  });

  test('it should get valid mrz from paragraph', () {
    final mrz = getMRTDmatch(testTD1String);
    expect(mrz, testTD1String);
  });

  test('it should pipeline mrz decoding', () {
    final check = isMRTD(testTD1String);
    expect(true, check);
    final mrz = getMRTDmatch(testTD1String);
    expect(mrz, testTD1String);
    final splits = mrz.split('\n').toList();
    final result = MRZParser.parse(splits);
    expect(result.surnames.toLowerCase(), 'namane');
    final doc = Document.fromMRTD(result);

    expect(doc.runtimeType, Document);
    expect(doc.surname.toLowerCase(), 'namane');
  });

  test('it should extract TD1 data', () {
    final doc = decodeMRTD(testTD1String);
    expect(doc.runtimeType, Document);
    expect(doc.surname.toLowerCase(), 'namane');
  });
}
