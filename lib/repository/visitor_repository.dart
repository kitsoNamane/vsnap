import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:vsnap/data/local/database.dart';
import 'package:vsnap/failures/visitor_failure.dart';
import 'package:vsnap/models/visitor.dart';
import 'package:vsnap/repository/i_visitor_repository.dart';

class VisitorRepository implements IVisitorRepository {
  final VisitorDao visitorDao;

  VisitorRepository(this.visitorDao);

  @override
  Future<Either<VisitorFailure, List<Visitor>>> getAllVisitors(
      DateTime from, DateTime to) async {
    try {
      final visitors = await visitorDao.getVisitors();
      return right(visitors);
    } catch (e) {
      return left(VisitorFailure.databaseError());
    }
  }

  @override
  Future<Either<VisitorFailure, Visitor>> getVisitor(String visitorId) async {
    try {
      final visitor = await visitorDao.getVisitor(visitorId);
      return right(visitor);
    } catch (e) {
      return left(VisitorFailure.databaseError());
    }
  }

  @override
  Future<Either<VisitorFailure, Unit>> visitorSignIn(
      Visitor visitor) async {
    try {
      await visitorDao.insertVisitor(visitor);
      return right(unit);
    } catch (e) {
      print(e.toString());
      developer.log("${e.toString()}", name: "AppMain");
      return left(VisitorFailure.databaseError());
    }
  }

  @override
  Future<Either<VisitorFailure, Unit>> visitorSignOut(String visitorId) async {
    try {
      final _visitor = await visitorDao.getVisitor(visitorId);
      await visitorDao
          .updateVisitor(_visitor.signOut());
      return right(unit);
    } catch (e) {
      print(e.toString());
      developer.log("${e.toString()}", name: "AppMain");
      return left(VisitorFailure.databaseError());
    }
  }
}
