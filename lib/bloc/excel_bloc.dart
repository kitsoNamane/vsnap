import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vsnap/data/excel_data_source.dart';
import 'package:vsnap/utils/utils.dart';
import 'package:vsnap/utils/visitor_log.dart';

part 'excel_event.dart';
part 'excel_state.dart';

class ExcelBloc extends Bloc<ExcelEvent, ExcelState> {
  @override
  ExcelState get initialState => ExcelInitial();

  @override
  Stream<ExcelState> mapEventToState(
    ExcelEvent event,
  ) async* {
    if (event is BuildExcel) {
      yield ExcelLoading();
      yield* _buildExcel();
    }
  }

  Stream<ExcelState> _buildExcel() async* {
    yield ExcelLoading();
    String file = await getVisitors().then((visitors) {
      return ExcelDataSource(visitors)
          .createExcelFile(getCurrentTime())
          .then((excel) {
        return excel.path;
      });
    });
    yield await fileExists(file).then((value) {
      print(value);
      if (value) {
        return ExcelFileBuilt(filepath: file);
      } else {
        print(file);
        return ExcelFileBuildError();
      }
    }).catchError((_)=>print("error occured help"));
  }
}
