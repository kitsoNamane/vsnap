part of 'processresults_bloc.dart';

class ProcessResultsEvent extends Equatable {
  final dynamic results;
  const ProcessResultsEvent({this.results});

  @override
  List<Object> get props => [results];

}
