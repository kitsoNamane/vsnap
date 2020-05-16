import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import 'package:vsnap/failures/excel_failure.dart';
import 'package:vsnap/models/visitor.dart';
import 'package:vsnap/repository/i_excel_facade.dart';

part 'excel_bloc.freezed.dart';
part 'excel_event.dart';
part 'excel_state.dart';

class ExcelBloc extends Bloc<ExcelEvent, ExcelState> {
  final IExcelRepository _excel;
  ExcelBloc(
    this._excel,
  );

  @override
  ExcelState get initialState => ExcelState.initial();

  @override
  Stream<ExcelState> mapEventToState(
    ExcelEvent event,
  ) async* {
    yield* _mapBuildExcelToState(event);
  }

  Stream<ExcelState> _mapBuildExcelToState(BuildExcel event) async* {
    yield state.copyWith(
      isSubmitting: true,
      excelFailureOrSuccess: none(),
    );

    final failureOrSuccess = await _excel.createExcelFile(event.visitors);
    yield state.copyWith(
      isSubmitting: false,
      excelFailureOrSuccess: optionOf(failureOrSuccess),
    );
  }
}
