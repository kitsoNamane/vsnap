import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:vsnap/failures/visitor_failure.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/models/visitor.dart';
import 'package:vsnap/repository/i_visitor_facade.dart';

part 'visitor_event.dart';
part 'visitor_state.dart';
part 'visitor_bloc.freezed.dart';

class VisitorBloc extends Bloc<VisitorEvent, VisitorState> {
  final IVisitorRepository _visitorRepository;

  VisitorBloc(this._visitorRepository);
  @override
  VisitorState get initialState => VisitorState.initial();

  @override
  Stream<VisitorState> mapEventToState(
    VisitorEvent event,
  ) async* {
    yield* event.map(
      addVisitorButtonPressed: (e) async* {
        yield VisitorState.visitorLoading();
        Map<String, String> map = {'temperature': e.purpose, 'phone': e.phone};
        var visitor = Visitor.create(e.document, map);
        this.add(VisitorSignIn(visitor));
      },
      visitorSignIn: (e) async* {
        yield VisitorState.visitorLoading();
        final failureOrSuccess =
            await _visitorRepository.visitorSignIn(e.visitor);
        yield VisitorSignedIn(
          showErrorMessages: true,
          isSubmitting: false,
          signInFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
      visitorSignOut: (e) async* {
        yield VisitorState.visitorLoading();
        final failureOrSuccess = await _visitorRepository.visitorSignOut(
            e.document.primaryId != null
                ? e.document.primaryId
                : e.document.secondaryId);
        yield VisitorSignedOut(
          showErrorMessages: true,
          isSubmitting: false,
          signOutFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
      getVisitors: (e) async* {
        yield VisitorState.visitorLoading();
        final failureOrSuccess = await _visitorRepository.getAllVisitors();
        yield GetVisitorDone(
          showErrorMessages: true,
          isSubmitting: false,
          getVisitorsFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
