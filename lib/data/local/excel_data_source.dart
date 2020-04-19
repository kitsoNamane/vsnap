import 'dart:io';

import 'package:excel/excel.dart';
import 'package:vsnap/utils/utils.dart';

class ExcelDataSource {
  var _extension = ".xlsx";
  var decoder = Excel.createExcel();

  Future<File> createExcelFile(String filename) {
    var file = FileStorage.file(filename + _extension);
    var sheetName = "$filename Visitors";

    decoder
      ..updateCell(sheetName, CellIndex.indexByString("A1"), "Here value of A1",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top)
      ..updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0),
          "Here value of C1",
          wrap: TextWrapping.WrapText)
      ..updateCell(sheetName, CellIndex.indexByString("A2"), "Here value of A2",
          backgroundColorHex: "#1AFF1A")
      ..updateCell(sheetName, CellIndex.indexByString("E5"), "Here value of E5",
          horizontalAlign: HorizontalAlign.Right);

    decoder.encode().then((onValue) {
      file.then((file) {
        file
          ..createSync(recursive: true)
          ..writeAsBytesSync(onValue);
      });
    });
    return file;
  }
}
