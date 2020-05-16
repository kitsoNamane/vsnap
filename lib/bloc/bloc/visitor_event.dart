part of 'visitor_bloc.dart';

@freezed
abstract class VisitorEvent with _$VisitorEvent {
  const factory VisitorEvent.addVisitorButtonPressed(
          String phone, String purpose, Document document) =
      AddVisitorButtonPressed;

  const factory VisitorEvent.visitorSignIn(Visitor visitor) =
      VisitorSignIn;

  const factory VisitorEvent.visitorSignOut(Document document) =
      VisitorSignOut;
}
