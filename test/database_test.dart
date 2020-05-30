import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vsnap/data/local/database.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/models/visitor.dart';

// tests
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  VisitorDao visitorDao;
  Document document;
  Map<String, String> map;
  Visitor visitor;

  setUp(() async {
    visitorDao = VisitorDao(db: await initDB());
    document = Document(
        names: "Kitso Gidion",
        surname: "Namane",
        primaryId: "382212211",
        secondaryId: null,
        birthDate: DateTime(1995, 4, 10),
        expiryDate: DateTime(2022, 4, 10),
        sex: "M",
        countryCode: "BWA",
        nationalityCountryCode: "BWA",
        documentType: "I",
        documentNumber: "382212211");
    map = {"temperature": "39", "phone": "75757459"};
    visitor = Visitor.create(document, map);
  });

  tearDown(() async {
    visitorDao.db.close();
  });

  _addVisitor() async {
    await visitorDao.insertVisitor(visitor);
    final dbVisitor = await visitorDao.getVisitor("382212211");
    return dbVisitor;
  }

  test('visitors can be signed in', () async {
    final vs = await _addVisitor();
    expect(visitor.nationalId, vs.nationalId);
    final v = await visitorDao.getVisitor("382212211");
    expect(v.timeOut, null);
  });

  test('visitors can be signed out', () async {
    await _addVisitor();
    final v = await visitorDao.getVisitor("382212211");
    expect(v.timeOut, null);
    final timeOut = DateTime.now();
    await visitorDao.updateVisitor(v.copyWith(timeOut: timeOut));
    final vUpdated = await visitorDao.getVisitor("382212211");
    final allVisitors = await visitorDao.getVisitors();
    expect(allVisitors.length, 1);
    expect(vUpdated.timeOut, timeOut);
  });

  test('sign in many before signout', () async {
    Visitor v = await _addVisitor();
    expect(visitor.nationalId, v.nationalId);
    v = await _addVisitor();
    expect(visitor.nationalId, v.nationalId);
    v = await _addVisitor();
    expect(visitor.nationalId, v.nationalId);
    v = await _addVisitor();
    expect(visitor.nationalId, v.nationalId);
  });

  test('signout after many add without signout', () async {
    await _addVisitor();
    await _addVisitor();
    await _addVisitor();
    await _addVisitor();
    await _addVisitor();

    final v = await visitorDao.getVisitor("382212211");
    expect(v.timeOut, null);
    final timeOut = DateTime.now();
    await visitorDao.updateVisitor(v.signOut());
    final vUpdated = await visitorDao.getVisitor("382212211");
    final allVisitors = await visitorDao.getVisitors();
    expect(allVisitors.length, 5);
    expect(vUpdated.timeOut, timeOut);
  });

  test('get all visitors', () async {
    await _addVisitor();
    await _addVisitor();
    await _addVisitor();
    await _addVisitor();
    final allVisitors = await visitorDao.getVisitors();
    expect(allVisitors.length, 4);
    allVisitors.forEach((visitor) {
      expect(visitor.firstname.toLowerCase(), "kitso");
    });
  });
}
