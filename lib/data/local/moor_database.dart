import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'moor_database.g.dart';

class Visitors extends Table {
  IntColumn get id => integer().autoIncrement()();

  // These are the visitor's document informantion
  TextColumn get nationalId => text().withLength(min: 2, max: 16)();
  TextColumn get passportNumber => text().withLength(min: 2, max: 16)();
  TextColumn get documentType => text().withLength(min: 2, max: 6)();
  TextColumn get documentNumber => text().withLength(min: 2, max: 16)();
  TextColumn get nationalityCountryCode => text().withLength(min: 2, max: 50)();
  DateTimeColumn get expiryDate => dateTime().nullable()();

  // These are the visitor's personal informantion
  TextColumn get firstName => text().withLength(min: 3, max: 50)();
  TextColumn get middleName => text().withLength(min: 3, max: 50)();
  TextColumn get lastName => text().withLength(min: 3, max: 50)();
  TextColumn get sex => text().withLength(min: 1, max: 1)();
  DateTimeColumn get birthday => dateTime().nullable()();

  // Here is the visitor's Log
  TextColumn get purpose => text()();
  DateTimeColumn get timeIn => dateTime().nullable()();
  DateTimeColumn get timeOut => dateTime().nullable()();
  TextColumn get plateNumber => text()();
  IntColumn get phoneNumber => integer()();
}
// Denote which tables this DAO can access
@UseDao(tables: [Visitors])
class VisitorDao extends DatabaseAccessor<AppDatabase> with _$VisitorDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  VisitorDao(this.db) : super(db);

  Future<List<Visitor>> getAllTasks() => select(visitors).get();
  Stream<List<Visitor>> watchAllTasks() => select(visitors).watch();
  Future insertTask(Visitor visitor) => into(visitors).insert(visitor);
  Future updateTask(Visitor visitor) => update(visitors).replace(visitor);
  Future deleteTask(Visitor visitor) => delete(visitors).delete(visitor);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
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

