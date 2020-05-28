
import 'package:dartz/dartz.dart';
import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/failures/excel_failure.dart';

abstract class IExcelRepository {
  Future<Either<ExcelFailure, Unit>> createExcelFile(List<Visitor> visitors);
}