import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vsnap/bloc/visitor_bloc.dart';
import 'package:vsnap/data/local/moor_database.dart';

class VisitorPage extends StatefulWidget {
  @override
  _VisitorPageState createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {
  final _phoneController = TextEditingController();
  final _purposeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final document = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Visitor"),
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (context) => VisitorBloc(dao: RepositoryProvider.of<VisitorDao>(context)),
        child: Container(
          child: BlocConsumer<VisitorBloc, VisitorState>(
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
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
                showDialog(
                  context: null,
                  builder: (context) => Icon(
                    Icons.check,
                    size: 20.0,
                    color: Colors.green,
                  ),
                ).then((value){
                });
              }
              if (state is VisitorError) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: new Text("Alert Dialog title"),
                    content: new Text("Alert Dialog body"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      FlatButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
