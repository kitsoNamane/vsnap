part of 'visitor_bloc.dart';

@freezed
abstract class VisitorEvent with _$VisitorEvent {
  const factory VisitorEvent.addVisitorButtonPressed(
      {String phone,
      String temperature,
      Document document}) = AddVisitorButtonPressed;

  const factory VisitorEvent.visitorSignIn(VisitorModel visitor) =
      VisitorSignIn;

  const factory VisitorEvent.visitorSignOut(Document document) = VisitorSignOut;

  const factory VisitorEvent.getVisitors({DateTime from, DateTime to}) =
      GetVisitors;
}
