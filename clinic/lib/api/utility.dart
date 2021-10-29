import 'package:clinic/util/converter.dart';

class DateConverter {
  static String _apiFormat = "yyyy-MM-dd'T'HH:mm:ss";

  static String toDateTimeString({
    required DateTime date,
  }) {
    return Converter.dateTimeToString(date: date.toUtc(), toFormat: _apiFormat) +
        '+00:00';
  }
}
