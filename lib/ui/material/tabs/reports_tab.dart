import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vsnap/bloc/excel_bloc.dart';
import 'package:vsnap/bloc/permission_bloc.dart';
import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/ui/material/tabs/permission_error_tab.dart';
import 'package:vsnap/utils/utils.dart';

import 'permissions_tab.dart';

class ReportsTab extends StatelessWidget {
  final List<Permission> _permissions = [Permission.storage];
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
                  "Something went wrong, contact our admin at info@abstractclass.co",
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
      create: (context) => ExcelBloc(RepositoryProvider.of<VisitorDao>(context))
        ..add(BuildExcel()),
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
                    child: const Text("Creating Excel File..."),
                  ),
                  CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ],
              )),
            );
          } else if (state is ExcelFileBuilt) {
            return ReportsForm(filepath: state.filepath);
          } else {
            // assume state is ExcelFileBuildError
            return Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("Something went wrong, refresh"),
                    MaterialButton(
                      child: Icon(
                        Icons.refresh,
                        size: 24,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () async {
                        BlocProvider.of<ExcelBloc>(context).add(BuildExcel());
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ReportsForm extends StatefulWidget {
  final String filepath;
  const ReportsForm({Key key, this.filepath}) : super(key: key);

  @override
  _ReportsFormState createState() => _ReportsFormState(filepath);
}

class _ReportsFormState extends State<ReportsForm> {
  final String filepath;
  final _formKey = GlobalKey<FormState>();
  final _emailTextController =
      TextEditingController(text: "info@abstractclass.co");

  _ReportsFormState(this.filepath);
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
              const Text(
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
                child: const Text("Email Report"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    sendEMail(filepath, [_emailTextController.text]).then(
                      (value) => Navigator.of(context).popAndPushNamed("/"),
                    );
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
