import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:meta/meta.dart';
import 'package:vsnap/models/visitor.dart';

Future<Database> initDB() async {
  final database = openDatabase(join(await getDatabasesPath(), 'vsnap.db'),
      onCreate: (db, version) {
    return db.execute(
      '''CREATE TABLE IF NOT EXISTS visitors(
          id INTEGER PRIMARY KEY,
          national_id TEXT,
          passport_number TEXT,
          document_type TEXT,
          document_number TEXT,
          nationality_country_code TEXT,
          expiry_date INTEGER,
          firstname TEXT,
          middlename TEXT,
          surname TEXT,
          sex TEXT,
          birthday INTEGER,
          phone_number INTEGER,
          temperature REAL,
          time_in INTEGER,
          time_out INTEGER,
          purpose TEXT
    )''',
    );
  }, version: 1);
  return database;
}

class VisitorDao {
  final Database db;
  const VisitorDao({@required this.db});

  Future<void> insertVisitor(Visitor visitor) async {
    await db.insert(
      'visitors',
      visitor.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Visitor>> getVisitors() async {
    final List<Map<String, dynamic>> maps = await db.query('visitors');

    return List.generate(maps.length, (i) {
      final visitorMap = maps[i];
      return Visitor.fromMap(visitorMap);
    });
  }

  Future<void> updateVisitor(Visitor visitor) async {
    await db.update(
      'visitors',
      visitor.toMap(),
      where: "id = ?",
      whereArgs: [visitor.id, visitor.timeIn],
    );
  }

  Future<Visitor> getVisitor(String id) async {
    final maps = await db.query(
      'visitors',
      where: "national_id = ? OR passport_number = ?",
      whereArgs: [id, id],
      orderBy: "time_in DESC",
      limit: 1,
    );

    final visitor = List.generate(
      maps.length,
      (i) {
        final visitor = maps[i];
        return Visitor.fromMap(visitor);
      },
    );
    if (visitor.length > 0) {
      return visitor.single;
    }
    return null;
  }
}
