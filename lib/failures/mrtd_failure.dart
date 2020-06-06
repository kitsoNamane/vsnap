import 'package:freezed_annotation/freezed_annotation.dart';

part 'mrtd_failure.freezed.dart';

@freezed
abstract class MRTDFailure with _$MRTDFailure {
  const factory MRTDFailure.invalidMRTDText() = InvalidMRTDText;
}
