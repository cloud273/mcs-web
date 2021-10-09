import 'package:clinic/util/utility.dart';

class DateConverter {
  static String _apiFormat = "yyyy-MM-dd'T'HH:mm:ss";

  static String toDateTimeString({
    required DateTime date,
  }) {
    return Utility.convertDateTime(date: date.toUtc(), toFormat: _apiFormat) +
        '+00:00';
  }
}
