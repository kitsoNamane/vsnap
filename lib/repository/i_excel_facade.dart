
import 'package:dartz/dartz.dart';
import 'package:vsnap/failures/excel_failure.dart';
import 'package:vsnap/models/visitor.dart';

abstract class IExcelRepository {
  Future<Either<ExcelFailure, Unit>> createExcelFile(List<Visitor> visitors);
}