part of 'excel_bloc.dart';

abstract class ExcelEvent extends Equatable {
  const ExcelEvent();
}

class BuildExcel extends ExcelEvent {
  @override
  List<Object> get props => [];
}
