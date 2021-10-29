import 'package:sprintf/sprintf.dart';

import 'localization.dart';

class Validator {
  static String emailRegExp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String? validatorEmail(String? candidate) {
    if (candidate == null || candidate.isEmpty) {
      return "Required_asterisk".localized;
    } else {
      if (RegExp(emailRegExp).hasMatch(candidate)) {
        return null;
      } else {
        return "Invalid_email".localized;
      }
    }
  }

  static String? validatorPassword(String? candidate) {
    if (candidate == null || candidate.isEmpty) {
      return "Required_asterisk".localized;
    } else {
      if (candidate.length >= 6) {
        return null;
      } else {
        return "Too_short_password_message".localized;
      }
    }
  }

  static String? validatorRePassword(String? candidate, String password) {
    if (candidate == null || candidate.isEmpty) {
      return "Required_asterisk".localized;
    } else {
      if (candidate == password) {
        return null;
      } else {
        return "Mismatch_password".localized;
      }
    }
  }

  static String? length(String? candidate, {int? minLength, int? maxLength,}) {
    final textLength = candidate?.length ?? 0;
    if (minLength != null && minLength > 0) {
      if (textLength == 0) {
        return "Required_asterisk".localized;
      } else if (textLength < minLength){
        return sprintf("Too_short_message".localized, [minLength]);
      }
    } else if (maxLength != null && textLength > maxLength) {
      return sprintf("Too_long_message".localized, [maxLength]);
    } else {
      return null;
    }
  }

}
