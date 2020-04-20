import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:vsnap/utils/utils.dart';

Future<bool> sendEMail(String filepath) {
  final email = Email(
      subject: "Visitor Log ${getCurrentTime()}",
      body: "Here are your visitor logs",
      attachmentPaths: [filepath],
      isHTML: true);
  
  try {
    FlutterEmailSender.send(email).whenComplete(() {
    return new Future<bool>.value(true); 
    });
  } catch (error) {
    print(error.toString());
    return new Future<bool>.value(false);
  }
}