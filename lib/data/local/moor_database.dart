import 'dart:io';
import 'package:flutter/services.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'moor_database.g.dart';

class Visitors extends Table {
  IntColumn get id => integer().autoIncrement()();

  // These are the visitor's document informantion
  TextColumn get nationalId => text().nullable()();
  TextColumn get passportNumber => text().nullable()();
  TextColumn get documentType => text().nullable()();
  TextColumn get documentNumber => text().nullable()();
  TextColumn get nationalityCountryCode => text().nullable()();
  DateTimeColumn get expiryDate => dateTime().nullable()();

  // These are the visitor's personal informantion
  TextColumn get firstName => text().nullable()();
  //TextColumn get middleName => text().withLength(min: 3, max: 50).nullable()();
  TextColumn get middleName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get sex => text().nullable()();
  DateTimeColumn get birthday => dateTime().nullable()();

  // Here is the visitor's Log
  RealColumn get temperature => real().nullable()();
  DateTimeColumn get timeIn => dateTime().nullable()();
  DateTimeColumn get timeOut => dateTime().nullable()();
  TextColumn get plateNumber => text().nullable()();
  IntColumn get phoneNumber => integer().nullable()();
}

// Denote which tables this DAO can access
@UseDao(tables: [Visitors])
class VisitorDao extends DatabaseAccessor<AppDatabase> with _$VisitorDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  VisitorDao(this.db) : super(db);

  Future<List<Visitor>> getAllVisitors() => select(visitors).get();
  Stream<List<Visitor>> watchAllVisitors() => select(visitors).watch();
  Future<Visitor> getLastSignedVisitor(String _id) {
    return (select(visitors)
          ..where((t) => t.nationalId.equals(_id))
          ..orderBy([
            (t) => OrderingTerm(expression: t.timeIn, mode: OrderingMode.desc),
          ])
          ..limit(1))
        .getSingle();
  }

  Future insertVisitor(Visitor visitor) => into(visitors).insert(visitor);
  Future updateVisitor(Visitor visitor) => update(visitors).replace(visitor);
  Future deleteVisitork(Visitor visitor) => delete(visitors).delete(visitor);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final path = p.join(dbFolder.path, 'db.sqlite');
    final file = File(path);
    if (!await file.exists()) {
      // Make sure the parent directory exists
      try {
        await Directory(p.dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      var data =
          await rootBundle.load(p.join('assets', 'database', 'db.sqlite'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await file.writeAsBytes(bytes, flush: true);
    }
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Visitors], daos: [VisitorDao])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
