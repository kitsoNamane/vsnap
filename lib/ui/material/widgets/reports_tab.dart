import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:vsnap/data/excel_data_source.dart';
import 'package:vsnap/utils/utils.dart';

class ReportsTab extends StatefulWidget {
  const ReportsTab({Key key}) : super(key: key);

  @override
  _ReportsTabState createState() => _ReportsTabState();
}

class _ReportsTabState extends State<ReportsTab> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Enter the email address of relevent authorities",
                style: TextStyle(fontSize: 18.0),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'email recipient'),
                  controller: _emailTextController,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "email required";
                    } else if (!EmailValidator.validate(value)) {
                      return "please enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
              RaisedButton(
                child: Text("Email Report"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ExcelDataSource()
                        .createExcelFile(getCurrentTime())
                        .then((file) {
                      sendEMail(file.path);
                    }).catchError((error) => print("try again later"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
