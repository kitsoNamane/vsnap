part of 'processresults_bloc.dart';

abstract class ProcessResultsState extends Equatable {
  const ProcessResultsState();
  @override
  List<Object> get props => [];
}

class ProcessResultsInitial extends ProcessResultsState {}


class ProcessResultsPassed extends ProcessResultsState {
  final dynamic results;
  ProcessResultsPassed({this.results});
}

class ProcessResultsError extends ProcessResultsState {}