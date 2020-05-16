import 'package:dartz/dartz.dart';
import 'package:vsnap/failures/visitor_failure.dart';
import 'package:vsnap/models/visitor.dart';

abstract class IVisitorRepository {
  Future<Either<VisitorFailure, Unit>> visitorSignIn(Visitor visitor);
  Future<Either<VisitorFailure, Unit>> visitorSignOut(Visitor visitor);
  Future<Either<VisitorFailure, Unit>> getVisitor(String id);
  Future<Either<VisitorFailure, Unit>> getAllVisitors();
}