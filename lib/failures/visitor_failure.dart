import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_failure.freezed.dart';

@freezed
abstract class VisitorFailure with _$VisitorFailure {
  const factory VisitorFailure.invalidVisitorData() = InvalidVisitorData;
  const factory VisitorFailure.databaseError() = DatabaseError;
}