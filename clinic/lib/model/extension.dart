import 'package:clinic/model/enum.dart';

extension AccountTypeExtension on AccountType {
  String get api {
    String result;
    switch (this) {
      case AccountType.admin:
        result = "admin";
        break;
      case AccountType.clinic:
        result = "clinic/account";
        break;
      case AccountType.doctor:
        result = "doctor";
        break;
      default:
        result = "patient";
        break;
    }
    return result;
  }
}

extension AptStatusTypeExtension on AptStatusType {
  String get text {
    String result;
    switch (this) {
      case AptStatusType.created:
        result = "created";
        break;
      case AptStatusType.accepted:
        result = "accepted";
        break;
      case AptStatusType.started:
        result = "started";
        break;
      case AptStatusType.rejected:
        result = "rejected";
        break;
      case AptStatusType.cancelled:
        result = "cancelled";
        break;
      default:
        result = "finished";
        break;
    }
    return result;
  }
}

extension DeviceOSExtension on DeviceOS {
  String get text {
    String result;
    switch (this) {
      case DeviceOS.ios:
        result = "ios";
        break;
      case DeviceOS.android:
        result = "android";
        break;
      case DeviceOS.mac:
        result = "mac";
        break;
      case DeviceOS.window:
        result = "window";
        break;
      case DeviceOS.linux:
        result = "linux";
        break;
      case DeviceOS.chrome:
        result = "chrome";
        break;
      case DeviceOS.safari:
        result = "safari";
        break;
      case DeviceOS.firefox:
        result = "firefox";
        break;
      case DeviceOS.ie:
        result = "ie";
        break;
      case DeviceOS.edge:
        result = "edge";
        break;
      default:
        result = "unsupported";
        break;
    }
    return result;
  }
}

extension LanguageExtension on Language {
  String get text {
    String result;
    switch (this) {
      case Language.english:
        result = "en";
        break;
      default:
        result = "vn";
        break;
    }
    return result;
  }
}

extension NotifyTypeExtension on NotifyType {
  static NotifyType? parse(String text) {
    if (text == 'email') {
      return NotifyType.email;
    } else if (text == 'sms') {
      return NotifyType.sms;
    } else {
      return null;
    }
  }
}

extension PackageTypeExtension on PackageType {
  String get text {
    String result;
    switch (this) {
      case PackageType.classic:
        result = "classic";
        break;
      default:
        result = "telemed";
        break;
    }
    return result;
  }
}
