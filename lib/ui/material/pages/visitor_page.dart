import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vsnap/bloc/visitor_bloc.dart';
import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/models/mrz_document.dart';
import 'package:vsnap/utils/utils.dart';

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
    return BlocProvider(
      create: (context) =>
          VisitorBloc(dao: RepositoryProvider.of<VisitorDao>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Visitor"),
          elevation: 0.0,
        ),
        body: VisitorTab(
          formKey: _formKey,
          phoneController: _phoneController,
          purposeController: _purposeController,
          document: document,
        ),
      ),
    );
  }
}

class DocumentText extends StatelessWidget {
  final String dataKey;
  final String data;
  const DocumentText({
    Key key,
    this.data,
    this.dataKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(dataKey), Text(data)],
      ),
    );
  }
}

class VisitorTab extends StatelessWidget {
  const VisitorTab({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required TextEditingController phoneController,
    @required TextEditingController purposeController,
    @required this.document,
  })  : _formKey = formKey,
        _phoneController = phoneController,
        _purposeController = purposeController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _phoneController;
  final TextEditingController _purposeController;
  final Document document;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BlocConsumer<VisitorBloc, VisitorState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DocumentText(
                    dataKey: "Name",
                    data: document.names + " " + document.surname),
                DocumentText(
                  dataKey: "ID Number",
                  data: document.primaryId != null
                      ? document.primaryId
                      : document.secondaryId,
                ),
                DocumentText(
                  dataKey: "Date Of Birth",
                  data: dateToString(document.birthDate),
                ),
                DocumentText(dataKey: "Gender", data: document.sex),
                DocumentText(
                    dataKey: "Nationality",
                    data: document.countryCode != null
                        ? document.countryCode
                        : document.nationalityCountryCode),
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
                    decoration: InputDecoration(labelText: 'body temperatue'),
                    keyboardType: TextInputType.number,
                    controller: _purposeController,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "temperature required";
                      } else if (double.tryParse(value) == null) {
                        return "invalid temperature";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: RaisedButton(
                    onPressed: () async {
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
                    child: const Text('Add Visitor'),
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
              content: const Text('Sign In Success'),
            );
            // Find the Scaffold in the widget tree and use it to show a SnackBar.
            Scaffold.of(context).showSnackBar(snackBar);

            Navigator.of(context).popAndPushNamed("/");
          }
          if (state is VisitorError) {
            final snackBar = SnackBar(
              backgroundColor: Colors.redAccent,
              content: const Text('Sign In Failed'),
            );
            // Find the Scaffold in the widget tree and use it to show a SnackBar.
            Scaffold.of(context).showSnackBar(snackBar);
            Navigator.of(context).popAndPushNamed("/");
          }
        },
      ),
    ]);
  }
}
