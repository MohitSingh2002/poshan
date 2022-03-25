import 'package:intl/intl.dart';

class Utils {

  String getDateTimeFormString(String date) {
    DateTime dateTime = DateFormat('ddMMyyyy').parse(date);
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

}
