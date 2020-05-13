part of 'excel_bloc.dart';

abstract class ExcelState extends Equatable {
  const ExcelState();
  @override
  List<Object> get props => [];
}

class ExcelInitial extends ExcelState {}

class ExcelLoading extends ExcelState {}

class ExcelFileBuilt extends ExcelState {
  final String filepath;

  ExcelFileBuilt({this.filepath});
  List<Object> get props => [filepath];
}

class ExcelFileBuildError extends ExcelState {}
