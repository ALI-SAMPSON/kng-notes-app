import 'package:intl/intl.dart';

class TDateUtil {
  TDateUtil._();
  static String dateFromTimestamp(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat.jmv().format(date);
  }
}
