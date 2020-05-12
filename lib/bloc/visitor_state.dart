part of 'visitor_bloc.dart';

abstract class VisitorState extends Equatable {
  const VisitorState();
  @override
  List<Object> get props => [];
}

class VisitorInitial extends VisitorState {}

class VisitorLoading extends VisitorState {}

class VisitorSignedIn extends VisitorState {
  final model.Visitor visitor;

  const VisitorSignedIn({this.visitor});

  @override
  List<Object> get props => [visitor];
}

class VisitorSignedOut extends VisitorState {
  final model.Visitor visitor;

  const VisitorSignedOut({this.visitor});

  @override
  List<Object> get props => [visitor];
}

class VisitorError extends VisitorState {}
