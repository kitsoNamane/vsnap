import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/bloc/excel_bloc.dart';
import 'package:vsnap/bloc/permission_bloc.dart';
import 'package:vsnap/data/excel_data_source.dart';
import 'package:vsnap/ui/material/widgets/permission_error_tab.dart';
import 'package:vsnap/utils/utils.dart';

import 'permissions_tab.dart';

class ReportsTab extends StatelessWidget {
  List<Permission> _permissions = [Permission.storage];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PermissionBloc()
        ..add(RequestPermissions(
          permissions: _permissions,
        )),
      child: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {
          if (state is PermissionInitial || state is PermissionLoading) {
            return Container();
          } else if (state is PermissionGranted) {
            return EmailReport();
          } else if (state is PermissionDenied) {
            return PermissionsTab(
              permissions: _permissions,
              message:
                  "Enable access so you can create, save and send report files",
              action: "Enable Storage Access",
            );
          } else if (state is PermissionPermanentlyDenied) {
            return PermissionErrorTab(
              message:
                  "You permenetly denied permission for file storage/read/write, to continue using our service go to your device setting and give us storage permissions",
            );
          } else if (state is PermissionRestricted) {
            return PermissionErrorTab(
              message:
                  "Your Admin/Guardian has restricted file storage/read/write permissions, contact them to give you access",
            );
          } else {
            return PermissionErrorTab(
              message:
                  "Something went wrong, contact our admin at kitso@abstractclass.co",
            );
          }
        },
      ),
    );
  }
}

class EmailReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExcelBloc()..add(BuildExcel()),
      child: BlocBuilder<ExcelBloc, ExcelState>(
        builder: (context, state) {
          if (state is ExcelLoading || state is ExcelInitial) {
            return Container(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Creating Excel File..."),
                  ),
                  CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ],
              )),
            );
          } else if (state is ExcelFileBuilt) {
            return ReportsForm();
          } else {
            // assume state is ExcelFileBuildError
            return Container(
              child: Center(
                child: Text("Something went wrong"),
              ),
            );
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
  final _emailTextController = TextEditingController(text: "info@abstractclass.co");
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
                    ExcelFileBuilt _state = BlocProvider.of(context).state;
                    sendEMail(_state.filepath);
                    /*
                    ExcelDataSource()
                        .createExcelFile(getCurrentTime())
                      /  .then((file) {
                      sendEMail(file.path);
                    }).catchError((error) => print("try again later"));
                    */
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
