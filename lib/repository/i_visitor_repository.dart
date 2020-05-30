import 'package:dartz/dartz.dart';
import 'package:vsnap/failures/visitor_failure.dart';

import 'package:vsnap/models/visitor.dart';

abstract class IVisitorRepository {
  Future<Either<VisitorFailure, Unit>> visitorSignIn(Visitor visitor);

  Future<Either<VisitorFailure, Unit>> visitorSignOut(String visitorId);

  Future<Either<VisitorFailure, Visitor>> getVisitor(String visitorId);

  Future<Either<VisitorFailure, List<Visitor>>> getAllVisitors(
      DateTime from, DateTime to);
}
