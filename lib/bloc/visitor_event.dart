part of 'visitor_bloc.dart';

abstract class VisitorEvent extends Equatable {
  const VisitorEvent();
  @override
  List<Object> get props => [];
}

class AddVisitorButtonPressed extends VisitorEvent {
  final String phone;
  final String temperature;
  final Document document;

  AddVisitorButtonPressed({
    this.phone,
    this.temperature,
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
  final Document document;

  const VisitorSignOut({this.document});

  @override
  List<Object> get props => [document];
}
