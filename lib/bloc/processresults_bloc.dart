import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vsnap/models/visitor.dart' as model;

part 'processresults_event.dart';
part 'processresults_state.dart';

class ProcessResultsBloc
    extends Bloc<ProcessResultsEvent, ProcessResultsState> {
  @override
  ProcessResultsState get initialState => ProcessResultsInitial();

  @override
  Stream<ProcessResultsState> mapEventToState(
    ProcessResultsEvent event,
  ) async* {
    if (event is ProcessResultsEvent) {
      yield ProcessResultsPassed(results: event.results);
    } else {
      yield ProcessResultsError();
    }
  }
}
