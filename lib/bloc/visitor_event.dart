part of 'visitor_bloc.dart';

abstract class VisitorEvent extends Equatable {
  const VisitorEvent();
  @override
  List<Object> get props => [];
}

class AddVisitorButtonPressed extends VisitorEvent {
  final String phone;
  final String purpose;
  final Document document;

  AddVisitorButtonPressed({
    this.phone,
    this.purpose,
    this.document,
  });
}

class VisitorSignIn extends VisitorEvent {
  final model.Visitor visitor;

  const VisitorSignIn({this.visitor});

  @override
  List<Object> get props => [visitor];
}

class VisitorSignOut extends VisitorEvent {
  final model.Visitor visitor;

  const VisitorSignOut({this.visitor});

  @override
  List<Object> get props => [visitor];
}
