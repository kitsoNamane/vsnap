import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/models/visitor.dart' as model;

part 'visitor_event.dart';
part 'visitor_state.dart';

class VisitorBloc extends Bloc<VisitorEvent, VisitorState> {
  VisitorDao dao;
  VisitorBloc({this.dao});

  @override
  VisitorState get initialState => VisitorInitial();

  @override
  Stream<VisitorState> mapEventToState(
    VisitorEvent event,
  ) async* {
    if (event is VisitorSignIn) {
      yield* _mapSignInToState(event);
    } else if (event is VisitorSignOut) {
      yield* _mapSignOutToState(event);
    } else if (event is AddVisitorButtonPressed) {
      yield* _mapButtonPressedToState(event);
    } else {
      yield VisitorError();
    }
  }

  Stream<VisitorState> _mapButtonPressedToState(
      AddVisitorButtonPressed event) async* {
    yield VisitorLoading();
    Map<String, String> map = {'purpose': event.purpose, 'phone': event.phone};
    var visitor = model.Visitor.create(event.document, map);
    this.add(VisitorSignIn(visitor: visitor));
  }

  Stream<VisitorState> _mapSignInToState(VisitorSignIn event) async* {
    // update database
    yield VisitorLoading();
    developer.log("$event", name: "AppMain");
    var names = event.visitor.person.names.split(" ").length == 2
        ? event.visitor.person.names.split(" ")
        : [
            event.visitor.person.names,
            "",
          ];
    final visitor = Visitor(
      nationalId: event.visitor.person.primaryId,
      passportNumber: event.visitor.person.secondaryId,
      documentType: event.visitor.person.documentType,
      documentNumber: event.visitor.person.documentNumber,
      nationalityCountryCode: event.visitor.person.nationalityCountryCode,
      firstName: names[0],
      middleName: names[1],
      lastName: event.visitor.person.surname,
      sex: event.visitor.person.sex,
      purpose: event.visitor.purpose,
      phoneNumber: event.visitor.phone,
    );
    yield await dao
        .insertVisitor(visitor)
        .then((_) => VisitorSignedIn(visitor: event.visitor))
        .catchError((_) => VisitorError());
  }

  Stream<VisitorState> _mapSignOutToState(VisitorSignOut event) async* {
    yield VisitorLoading();
    var visitor = await dao.getLastSignedVisitor(event.document.primaryId);
    var updatedVisitor = visitor.copyWith(timeOut: DateTime.now());
    yield await dao
        .updateVisitor(updatedVisitor)
        .then((_) => VisitorSignedOut())
        .catchError((_) => VisitorError());
  }
}
