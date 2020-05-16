part of 'excel_bloc.dart';

@freezed
abstract class ExcelEvent with _$ExcelEvent {
  const factory ExcelEvent.buildExcel() = BuildExcel;
}
