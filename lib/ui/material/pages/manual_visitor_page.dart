import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vsnap/bloc/visitor_bloc.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/repository/visitor_repository.dart';
import 'package:vsnap/utils/utils.dart';

class ManualVisitorPage extends StatefulWidget {
  @override
  _ManualVisitorPageState createState() => _ManualVisitorPageState();
}

class _ManualVisitorPageState extends State<ManualVisitorPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VisitorBloc(RepositoryProvider.of<VisitorRepository>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Visitor"),
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
  final _surnameController = TextEditingController();
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
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'firstname'),
                  controller: _fullnamesController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "firstname required";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'surname'),
                  controller: _surnameController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "surname required";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Id Number'),
                  keyboardType: TextInputType.number,
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
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
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
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
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
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
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
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'temperature'),
                  controller: _purposeController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "temperature required";
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
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate() && _birth != null) {
                      final document = Document(
                        names: _fullnamesController.text,
                        primaryId: _idController.text,
                        secondaryId: null,
                        nationalityCountryCode:
                            _nationalityController.text.substring(0, 3),
                        sex: _genderController.text,
                        surname: _surnameController.text,
                        documentNumber: "",
                        documentType: "I",
                        countryCode:
                            _nationalityController.text.substring(0, 3),
                        birthDate: _birth,
                        expiryDate: null,
                      );
                      if (!state.isSubmitting) {
                        BlocProvider.of<VisitorBloc>(context)
                            .add(AddVisitorButtonPressed(
                          phone: _phoneController.text,
                          temperature: _purposeController.text,
                          document: document,
                        ));
                      }
                    }
                  },
                  child: const Text('Add Visitor'),
                ),
              ),
              Container(
                child: state.isSubmitting == true
                    ? CircularProgressIndicator()
                    : null,
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is VisitorSignedIn) {
          final results = state.signInFailureOrSuccessOption.fold(
              () => false, (result) => result.fold((l) => false, (r) => true));

          if (!results) {
            final document = Document(
              names: _fullnamesController.text.split(" ")[0],
              primaryId: _idController.text,
              secondaryId: null,
              nationalityCountryCode:
                  _nationalityController.text.substring(0, 3),
              sex: _genderController.text,
              surname: _fullnamesController.text.split(" ")[1],
              documentNumber: "",
              documentType: "I",
              countryCode: _nationalityController.text.substring(0, 3),
              birthDate: _birth,
              expiryDate: null,
            );

            AwesomeDialog(
                context: context,
                title: 'INFO',
                dialogType: DialogType.WARNING,
                animType: AnimType.BOTTOMSLIDE,
                btnOkText: "try again",
                btnCancelText: "cancel",
                padding: const EdgeInsets.all(16.0),
                desc: "sign in failed",
                btnOkOnPress: () {
                  BlocProvider.of<VisitorBloc>(context)
                      .add(AddVisitorButtonPressed(
                    phone: _phoneController.text,
                    temperature: _purposeController.text,
                    document: document,
                  ));
                },
                btnCancelOnPress: () {
                  Navigator.of(context).popAndPushNamed('/');
                }).show();
          } else {
            AwesomeDialog(
                context: context,
                title: 'INFO',
                dialogType: DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                desc: "sign in successfult",
                btnOkText: "continue",
                padding: const EdgeInsets.all(16.0),
                btnOkOnPress: () {
                  Navigator.of(context).popAndPushNamed('/');
                }).show();
          }
        }
      },
    );
  }
}
