export 'file.dart';
export 'permissions_service.dart';

import 'package:intl/intl.dart';

class Utils {
  static void myUtils() {
    print("Hello Utilities");
  }

  static String getCurrentTime() {
    var now = DateTime.now().toLocal();
    var format = DateFormat().add_d().add_M().add_y().add_Hm();
    return format.format(now);
  }
}
