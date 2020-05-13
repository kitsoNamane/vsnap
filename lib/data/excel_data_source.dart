import 'dart:io';

import 'package:excel/excel.dart';
import 'package:vsnap/utils/utils.dart';
import 'package:vsnap/data/local/moor_database.dart';

class ExcelDataSource {
  var _extension = ".xlsx";
  final List<Visitor> visitors;

  ExcelDataSource(this.visitors);

  Future<File> createExcelFile(String filename) {
    var decoder = Excel.createExcel();
    var file = getFile(filename + _extension);
    var sheetName = "$filename Visitors";

    decoder.merge(
        sheetName, CellIndex.indexByString("A1"), CellIndex.indexByString("A5"),
        customValue: "$sheetName");
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("A1"), "$filename",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
    /*
    decoder
      ..updateCell(sheetName, CellIndex.indexByString("A1"), "Here value of A1",
          fontColorHex: "#1AFF1A", verticalAlign: VerticalAlign.Top);
      ..updateCell(
          sheetName,
          CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0),
          "Here value of C1",
          wrap: TextWrapping.WrapText)
      ..updateCell(sheetName, CellIndex.indexByString("A2"), "Here value of A2",
          backgroundColorHex: "#1AFF1A")
      ..updateCell(sheetName, CellIndex.indexByString("E5"), "Here value of E5",
          horizontalAlign: HorizontalAlign.Right);
          */
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

  Future<void> readExcel(String filename) {
    //var bytes = File(filename).readAsBytesSync();
    //var decoder = Excel.decodeBytes(bytes, update: true);
    print("$filename");
    print("printing excel content");
    //
    //for (var table in decoder.tables.keys) {
    // print(table);
    //print(decoder.tables[table].maxCols);
    //print(decoder.tables[table].maxRows);
    //for (var row in decoder.tables[table].rows) {
    //print("$row");
    //}
    //}
    return Future.value();
  }
}
