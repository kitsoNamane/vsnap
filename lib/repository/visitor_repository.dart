import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/failures/visitor_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vsnap/repository/i_visitor_repository.dart';

class VisitorRepository implements IVisitorRepository {
  final VisitorDao visitorDao;

  VisitorRepository(this.visitorDao);

  @override
  Future<Either<VisitorFailure, List<Visitor>>> getAllVisitors(
      DateTime from, DateTime to) async {
    try {
      final visitors = await visitorDao.getAllVisitors();
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
      return left(VisitorFailure.databaseError());
    }
  }

  @override
  Future<Either<VisitorFailure, Unit>> visitorSignOut(
      String visitorId) async {
    try {
      final _visitor = await visitorDao.getLastSignedVisitor(visitorId);
      await visitorDao.updateVisitor(_visitor.copyWith(timeOut: DateTime.now()));
      return right(unit);
    } catch (e) {
      return left(VisitorFailure.databaseError());
    }
  }
}
