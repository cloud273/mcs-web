import 'package:intl/intl.dart';

class Utility {
  static DateTime? parseIso8601DateTimeString(String dateString) {
    return DateTime.tryParse(dateString);
  }

  static String convertDateTime({
    required DateTime date,
    String toFormat = 'MMM, dd yyyy, hh:mm:ss a',
    String? locale,
  }) {
    return DateFormat(toFormat, locale).format(date.toLocal());
  }

  static String? convertIso8601DateTimeString({
    required String dateString,
    String toFormat = 'MMM dd yyyy',
  }) {
    DateTime? dateTime = parseIso8601DateTimeString(dateString);
    if (dateTime != null) {
      return convertDateTime(date: dateTime, toFormat: toFormat);
    } else {
      return null;
    }
  }

  static String byteToString(int byte) {
    if (byte < 1024) {
      return '${byte}B';
    } else if (byte < 1024 * 1024) {
      return '${byte ~/ 1024}KB';
    } else {
      return '${(byte / (1024 * 1024)).toStringAsFixed(2)}MB';
    }
  }
}
