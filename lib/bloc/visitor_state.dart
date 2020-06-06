part of 'visitor_bloc.dart';

@freezed
abstract class VisitorState with _$VisitorState {
  const factory VisitorState({
    @required bool showErrorMessages,
    @required bool isSubmitting,
  }) = _VisitorState;

  factory VisitorState.initial() => VisitorState(
        showErrorMessages: false,
        isSubmitting: false,
      );

  factory VisitorState.visitorLoading() => VisitorState(
        showErrorMessages: false,
        isSubmitting: true,
      );

  factory VisitorState.visitorSignedIn({
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required Option<Either<VisitorFailure, Unit>> signInFailureOrSuccessOption,
  }) = VisitorSignedIn;

  factory VisitorState.visitorSignedOut({
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required
        Option<Either<VisitorFailure, Unit>> signOutFailureOrSuccessOption,
  }) = VisitorSignedOut;

  factory VisitorState.getVisitorsDone({
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required
        Option<Either<VisitorFailure, List<Visitor>>>
            getVisitorsFailureOrSuccessOption,
  }) = GetVisitorDone;
}
