import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:vsnap/data/excel_data_source.dart';
import 'package:vsnap/data/local/moor_database.dart';

import 'package:vsnap/failures/excel_failure.dart';
import 'package:vsnap/failures/visitor_failure.dart';
import 'package:vsnap/utils/utils.dart';

import 'visitor_bloc.dart';

part 'excel_bloc.freezed.dart';
part 'excel_event.dart';
part 'excel_state.dart';

class ExcelBloc extends Bloc<ExcelEvent, ExcelState> {
  final VisitorBloc visitorBloc;
  StreamSubscription visitorSubscription;

  ExcelBloc({@required this.visitorBloc}) {
    visitorBloc.add(GetVisitors());
    visitorSubscription = visitorBloc.listen((state) {
      if (state is GetVisitorDone) {
        add(BuildExcel(
            //state.getVisitorsFailureOrSuccessOption.getOrElse(() => null)));
            state.getVisitorsFailureOrSuccessOption
                .fold(() => null, (visitors) => visitors)));
      }
    });
  }
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

    if (event.visitors.isLeft() || event.visitors == null) {
      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        excelFailureOrSuccess: none(),
      );
    } else {
      final failureOrSuccess = await ExcelDataSource().createExcelFile(
          event.visitors
              .fold((failure) => List<Visitor>(), (visitors) => visitors),
          getCurrentTime());
      yield state.copyWith(
        showErrorMessages: true,
        isSubmitting: false,
        excelFailureOrSuccess: some(failureOrSuccess),
      );
    }
  }

  void refresh() {
    visitorSubscription.cancel();

    visitorSubscription = visitorBloc.listen((state) {
      if (state is GetVisitorDone) {
        add(BuildExcel(
            state.getVisitorsFailureOrSuccessOption.getOrElse(() => null)));
      }
    });
  }

  @override
  Future<void> close() {
    visitorSubscription.cancel();
    return super.close();
  }
}
