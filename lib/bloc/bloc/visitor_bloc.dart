import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:vsnap/failures/visitor_failure.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/models/visitor.dart';

part 'visitor_event.dart';
part 'visitor_state.dart';
part 'visitor_bloc.freezed.dart';

class VisitorBloc extends Bloc<VisitorEvent, VisitorState> {
  @override
  VisitorState get initialState => VisitorState.initial();

  @override
  Stream<VisitorState> mapEventToState(
    VisitorEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
