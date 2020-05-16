import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:vsnap/failures/excel_failure.dart';

part 'excel_event.dart';
part 'excel_state.dart';
part 'excel_bloc.freezed.dart';

class ExcelBloc extends Bloc<ExcelEvent, ExcelState> {
  @override
  ExcelState get initialState => ExcelState.initial();

  @override
  Stream<ExcelState> mapEventToState(
    ExcelEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
