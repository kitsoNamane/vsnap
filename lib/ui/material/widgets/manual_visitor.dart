import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vsnap/bloc/visitor_bloc.dart';
import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/utils/utils.dart';

class ManualVisitor extends StatefulWidget {
  @override
  _ManualVisitorState createState() => _ManualVisitorState();
}

class _ManualVisitorState extends State<ManualVisitor> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VisitorBloc(dao: RepositoryProvider.of<VisitorDao>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Visitor"),
          elevation: 0.0,
        ),
        body: ListView(
          children: [ManualVisitorTab()],
        ),
      ),
    );
  }
}

class ManualVisitorTab extends StatefulWidget {
  @override
  _ManualVisitorTabState createState() => _ManualVisitorTabState();
}

class _ManualVisitorTabState extends State<ManualVisitorTab> {
  final _phoneController = TextEditingController();
  final _fullnamesController = TextEditingController();
  final _idController = TextEditingController();
  final _genderController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _purposeController = TextEditingController();
  DateTime _birth;
  String _date = "Date of Birth";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisitorBloc, VisitorState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'fullname'),
                  controller: _fullnamesController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "names required required";
                    } else if (value.split(" ").length < 2) {
                      return "enter all your names e.g John Doe";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Id Number'),
                  controller: _idController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "phone required";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Gender'),
                  controller: _genderController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty || value.length > 1) {
                      return "gender required: use M-ale or F-emale ";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Nationality'),
                  controller: _nationalityController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter a country of origin";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'phone'),
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "phone required";
                    } else if (int.tryParse(value) == null ||
                        value.length != 8) {
                      return "please enter a valid number";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'purpose'),
                  controller: _purposeController,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "purpose required";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: RaisedButton(
                    child: Text(
                      _date,
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2021),
                      ).then((value) {
                        _birth = value;
                        setState(() {
                          _date = dateToString(value);
                        });
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate() && _birth != null) {
                      var document = Document(
                        names: _fullnamesController.text.split(" ")[0],
                        primaryId: _idController.text,
                        secondaryId: null,
                        nationalityCountryCode:
                            _nationalityController.text.substring(0, 3),
                        sex: _genderController.text,
                        surname: _fullnamesController.text.split(" ")[1],
                        documentNumber: "",
                        documentType: "I",
                        countryCode:
                            _nationalityController.text.substring(0, 3),
                        birthDate: _birth,
                        expiryDate: null,
                      );
                      if (state is! VisitorLoading) {
                        BlocProvider.of<VisitorBloc>(context)
                            .add(AddVisitorButtonPressed(
                          phone: _phoneController.text,
                          purpose: _purposeController.text,
                          document: document,
                        ));
                      }
                    }
                  },
                  child: Text('Add Visitor'),
                ),
              ),
              Container(
                child: state is VisitorLoading
                    ? CircularProgressIndicator()
                    : null,
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is VisitorSignedIn) {
          final snackBar = SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text('Sign In Success'),
          );
          // Find the Scaffold in the widget tree and use it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
          Navigator.of(context).popAndPushNamed("/");
        }
        if (state is VisitorError) {
          final snackBar = SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Sign In Failed'),
          );
          // Find the Scaffold in the widget tree and use it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
          Navigator.of(context).popAndPushNamed("/");
        }
      },
    );
  }
}
