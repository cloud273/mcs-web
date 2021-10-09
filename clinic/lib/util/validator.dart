import 'package:flutter/material.dart';

import 'localization.dart';

class Validator {
  static String emailRegExp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String? validatorEmail(String? candidate) {
    if (candidate == null || candidate.isEmpty) {
      return "Field_required".localized;
    } else {
      if (RegExp(emailRegExp).hasMatch(candidate)) {
        return null;
      } else {
        return "Invalid_email_format".localized;
      }
    }
  }

  static String? validatorPassword(String? candidate) {
    if (candidate == null || candidate.isEmpty) {
      return "Field_required".localized;
    } else {
      if (candidate.length >= 6) {
        return null;
      } else {
        return "Password_too_short".localized;
      }
    }
  }

  static String? validatorRePassword(String? candidate, String password) {
    if (candidate == null || candidate.isEmpty) {
      return "Field_required".localized;
    } else {
      if (candidate == password) {
        return null;
      } else {
        return "Password_not_match".localized;
      }
    }
  }

  static FormFieldValidator required({String? errorText}) {
    return (value) {
      if (value == null ||
          ((value is Iterable || value is String || value is Map) &&
              value.isEmpty)) {
        return errorText ?? 'Field_required'.localized;
      }
      return null;
    };
  }
}
