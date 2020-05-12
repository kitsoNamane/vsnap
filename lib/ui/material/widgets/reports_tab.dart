import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/bloc/permission_bloc.dart';
import 'package:vsnap/data/excel_data_source.dart';
import 'package:vsnap/utils/utils.dart';

import 'permissions_tab.dart';

class ReportsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PermissionBloc()
        ..add(RequestPermissions(
          permissions: [Permission.storage],
        )),
      child: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {
          if (state is PermissionInitial) {
            return Container();
          } else if (state is PermissionGranted) {
            if (state.props.first == false) {
              return PermissionsTab(
                permissions: [Permission.storage],
                message: "Enable access so you can create, save and send report files",
                action: "Enable Storage Access",
              );
            } else {
              return ReportsForm();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class ReportsForm extends StatefulWidget {
  const ReportsForm({Key key}) : super(key: key);

  @override
  _ReportsFormState createState() => _ReportsFormState();
}

class _ReportsFormState extends State<ReportsForm> {
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
