import 'package:flutter/material.dart';
import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';

class CameraPage extends StatefulWidget {
  final String scanType;

  const CameraPage({Key key, this.scanType}) : super(key: key);
  @override
  CameraPageState createState() => CameraPageState(scanType);
}

class CameraPageState extends State<CameraPage> {
  bool isParsed = false;
  final String scanType;

  CameraPageState(this.scanType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Camera'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: MRZScanner(
                onParsed: (result) async {
                  if (isParsed) {
                    return;
                  }
                  isParsed = true;

                  await showDialog<void>(
                      context: this.context,
                      builder: (context) => AlertDialog(
                              content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Document type: ${result.documentType}'),
                              Text('Country: ${result.countryCode}'),
                              Text('Surnames: ${result.surnames}'),
                              Text('Given names: ${result.givenNames}'),
                              Text('Document number: ${result.documentNumber}'),
                              Text(
                                  'Nationality code: ${result.nationalityCountryCode}'),
                              Text('Birthdate: ${result.birthDate}'),
                              Text('Sex: ${result.sex}'),
                              Text('Expriy date: ${result.expiryDate}'),
                              Text('Personal number: ${result.personalNumber}'),
                              Text(
                                  'Personal number 2: ${result.personalNumber2}'),
                              RaisedButton(
                                child: const Text('ok'),
                                onPressed: () {
                                  isParsed = false;
                                  return Navigator.pop(context, true);
                                },
                              ),
                            ],
                          )));
                },
                onError: (error) => print(error),
              ),
            ),
            Flexible(
              child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: const Center(
                    child: Text('Flutter view below the native camera'),
                  )),
            ),
          ],
        ));
  }
}
