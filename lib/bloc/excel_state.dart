part of 'excel_bloc.dart';

@freezed
abstract class ExcelState with _$ExcelState{
  const factory ExcelState({
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required Option<Either<ExcelFailure, File>> excelFailureOrSuccess,
  }) = _ExcelState;

  factory ExcelState.initial() => ExcelState(
    showErrorMessages: false,
    isSubmitting: false,
    excelFailureOrSuccess: none(),
  );
}
