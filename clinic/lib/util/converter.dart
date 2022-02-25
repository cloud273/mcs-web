import 'package:intl/intl.dart';

class Converter {
  static String dateTimeFormat = 'MMM, dd yyyy hh:mm:ss a';

  static String dateFormat = 'MMM, dd yyyy';

  static String monthFormat = 'MMM yyyy';

  static DateTime? parseDateTimeString(String dateString) {
    return DateTime.tryParse(dateString);
  }

  static String dateTimeToString({
    required DateTime date,
    required String toFormat,
    String? locale,
  }) {
    return DateFormat(toFormat, locale).format(date.toLocal());
  }

  static String dateTimeToDateString({
    required DateTime date,
    String? locale,
  }) {
    return dateTimeToString(date: date, toFormat: dateFormat, locale: locale);
  }

  static String dateTimeToDateTimeString({
    required DateTime date,
    String? locale,
  }) {
    return dateTimeToString(
      date: date,
      toFormat: dateTimeFormat,
      locale: locale,
    );
  }

  static String dateTimeStringToString({
    required String dateString,
    required String toFormat,
    String? locale,
  }) {
    DateTime dateTime = parseDateTimeString(dateString)!;
    return dateTimeToString(
      date: dateTime,
      toFormat: toFormat,
      locale: locale,
    );
  }

  static String dateTimeStringToDateTimeString({
    required String dateString,
    String? locale,
  }) {
    return dateTimeStringToString(
      dateString: dateString,
      toFormat: dateTimeFormat,
      locale: locale,
    );
  }

  static String dateTimeStringToDateString({
    required String dateString,
    String? locale,
  }) {
    return dateTimeStringToString(
      dateString: dateString,
      toFormat: dateFormat,
      locale: locale,
    );
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
