import 'dart:io';

import 'package:excel/excel.dart';
import 'package:vsnap/utils/utils.dart';
import 'package:vsnap/data/local/moor_database.dart';

class ExcelDataSource {
  Future<File> file;
  String sheetName;
  var decoder = Excel.createExcel();
  var _extension = ".xlsx";
  final List<Visitor> visitors;
  final List<String> cells = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    /*
    'I',
    'J',
    'K',
    'L',
    'M',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    */
  ];

  ExcelDataSource(this.visitors);

  void createTableTitles() {
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("A3"), "NAME",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("B3"), "SURNAME",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("C3"), "ID",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("D3"), "PASSPORT ID",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("E3"), "DOCUMENT TYPE",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("F3"), "SEX",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("A3"), "TIME IN",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("H3"), "TIME OUT",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
  }

  Future<File> createExcelFile(String filename) {
    file = getFile(filename + _extension);
    sheetName = "$filename Visitors";

    decoder
      .updateCell(sheetName, CellIndex.indexByString("A1"), "$filename",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    decoder.merge(
        sheetName, CellIndex.indexByString("A1"), CellIndex.indexByString("K1"),
        customValue: "$sheetName");
    if (visitors == null || visitors.isEmpty) {
      decoder
        .updateCell(sheetName, CellIndex.indexByString("A3"),
            "You don't have visitor registered, please register your visitors to get log",
            fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    } else {
      createTableTitles();
      var _cell = 4;

      for (int i = 0; i < visitors.length; i++) {
        int j = 0;
        var visitor = visitors[i];
        decoder
          .updateCell(sheetName, CellIndex.indexByString("${cells[j]}$_cell"),
              visitor.firstName,
              fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
        j += 1;
        decoder
          .updateCell(sheetName, CellIndex.indexByString("${cells[j]}$_cell"),
              visitor.lastName,
              fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
        j += 1;
        decoder
          .updateCell(sheetName, CellIndex.indexByString("${cells[j]}$_cell"),
              visitor.nationalId != null ? visitor.nationalId : "",
              fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
        j += 1;
        decoder
          .updateCell(sheetName, CellIndex.indexByString("${cells[j]}$_cell"),
              visitor.passportNumber != null ? visitor.passportNumber : "",
              fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
        j += 1;
        decoder
          .updateCell(sheetName, CellIndex.indexByString("${cells[j]}$_cell"),
              visitor.documentType,
              fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
        j += 1;
        decoder
          .updateCell(sheetName, CellIndex.indexByString("${cells[j]}$_cell"),
              visitor.sex.toUpperCase(),
              fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
        j += 1;
        decoder
          .updateCell(sheetName, CellIndex.indexByString("${cells[j]}$_cell"),
              visitor.timeIn != null ? dateTimeToString(visitor.timeIn) : "",
              fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
        j += 1;
        decoder
          .updateCell(sheetName, CellIndex.indexByString("${cells[j]}$_cell"),
              visitor.timeOut != null ? dateTimeToString(visitor.timeOut) : "",
              fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
        j = 0;
        _cell += 1;
      }
    }

    try {
      decoder.encode().then((onValue) {
        file.then((file) {
          file
            ..createSync(recursive: true)
            ..writeAsBytesSync(onValue);
        });
      });
      return file;
    } catch (_) {
      return null;
    }
  }
}
