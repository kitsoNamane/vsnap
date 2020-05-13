import 'package:intl/intl.dart';

String getCurrentTime() {
  var now = DateTime.now().toLocal();
  var format = DateFormat().add_d().add_M().add_y().add_Hms();
  return format.format(now);
}

DateTime getCurrentDate() {
  return DateTime.now().toLocal();
}

String dateTimeToString(DateTime dateTime){
  var format = DateFormat().add_d().add_M().add_y().add_Hms();
  return format.format(dateTime);
}

String dateToString(DateTime dateTime){
  var format = DateFormat().add_d().add_M().add_y();
  return format.format(dateTime);
}