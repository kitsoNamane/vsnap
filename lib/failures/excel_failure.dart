import 'package:freezed_annotation/freezed_annotation.dart';

part 'excel_failure.freezed.dart';

@freezed
abstract class ExcelFailure with _$ExcelFailure {
  const factory ExcelFailure.failedToWrite() = FailedToWrite;
  const factory ExcelFailure.failedToCreateFile() = FailedToCreate;
  const factory ExcelFailure.excelFormatError() = ExcelFormatError;
  const factory ExcelFailure.noDataAvailable() = NoDataAvailable;
}
