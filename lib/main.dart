import 'package:flutter/material.dart';
import 'package:vsnap/data/local/excel_data_source.dart';
import 'package:vsnap/utils/permissions_service.dart';
import 'package:vsnap/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  color: Colors.yellow[300],
                  child: Text('Request permission'),
                  onPressed: () {
                    getAppPermissions();
                    //Utils.myUtils();
                    //var _excel = ExcelDataSource();
                    //_excel.createExcelFile();
                  },
                ),
                MaterialButton(
                  color: Colors.green[300],
                  child: Text('Create Excel File'),
                  onPressed: () {
                    var _excel = ExcelDataSource();
                    _excel.createExcelFile(getCurrentTime()).then((file) {
                      _excel.readExcel(file.path);
                      sendEMail(file.path);
                      //print("excel file created");
                      //print("$file.path");
                    });
                    //var _file =
                    //    FileStorage.file("${Utils.getCurrentTime()}.xlsx")
                    //        .then((file) {
                    //  print(file.path);
                    //});
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
