import 'package:clinic/model/address.dart';
import 'package:clinic/model/allergy.dart';
import 'package:clinic/model/app_state.dart';
import 'package:clinic/model/city.dart';
import 'package:clinic/model/country.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/model/specialty.dart';
import 'package:clinic/model/state.dart';
import 'package:clinic/model/surgery.dart';
import 'package:clinic/model/symptom.dart';
import 'package:clinic/storage/other_storage.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/converter.dart';
import 'package:clinic/util/localization.dart';

extension AccountTypeExtension on AccountType {
  String get api {
    String result;
    switch (this) {
      case AccountType.admin:
        result = 'admin';
        break;
      case AccountType.clinic:
        result = 'clinic/account';
        break;
      case AccountType.doctor:
        result = 'doctor';
        break;
      default:
        result = 'patient';
        break;
    }
    return result;
  }
}

extension AddressExtension on Address {
  String get text {
    try {
      final countryName = OtherStorage.instance.country(countryCode).name;
      final stateName = OtherStorage.instance.state(stateCode).name;
      final cityName = OtherStorage.instance.city(cityCode).name;
      return '$line, $cityName, $stateName, $countryName';
    } catch (e) {
      return '';
    }
  }
}

extension AppPageExtension on AppMainPage {
  String get text {
    String result;
    switch (this) {
      case AppMainPage.activeAppointment:
        result = "Book".localized;
        break;
      case AppMainPage.historyAppointment:
        result = "History_appointment".localized;
        break;
      case AppMainPage.doctorInformation:
        result = "Doctor".localized;
        break;
      case AppMainPage.clinicInformation:
        result = "Clinic".localized;
        break;
      case AppMainPage.packageInformation:
        result = "Package".localized;
        break;
      case AppMainPage.timetableInformation:
        result = "Timetable".localized;
        break;
      case AppMainPage.aboutUs:
        result = 'About_us'.localized;
        break;
      case AppMainPage.faq:
        result = 'FAQ'.localized;
        break;
      case AppMainPage.termCondition:
        result = 'Term_condition'.localized;
        break;
      case AppMainPage.contact:
        result = 'Contact'.localized;
        break;
      default:
        result = '';
        break;
    }
    return result;
  }
}

extension AptStatusTypeExtension on AptStatusType {
  String get api {
    String result;
    switch (this) {
      case AptStatusType.created:
        result = 'created';
        break;
      case AptStatusType.accepted:
        result = 'accepted';
        break;
      case AptStatusType.started:
        result = 'started';
        break;
      case AptStatusType.rejected:
        result = 'rejected';
        break;
      case AptStatusType.cancelled:
        result = 'cancelled';
        break;
      default:
        result = 'finished';
        break;
    }
    return result;
  }

  String get text {
    String result;
    switch (this) {
      case AptStatusType.created:
        result = 'Created_status'.localized;
        break;
      case AptStatusType.accepted:
        result = 'Accepted_status'.localized;
        break;
      case AptStatusType.started:
        result = 'Started_status'.localized;
        break;
      case AptStatusType.rejected:
        result = 'Rejected_status'.localized;
        break;
      case AptStatusType.cancelled:
        result = 'Cancelled_status'.localized;
        break;
      default:
        result = 'Finished_status'.localized;
        break;
    }
    return result;
  }
}

extension CityExtension on City {
  String get name {
    return nameMap[UserStorage.instance.language.code] ?? nameMap['vi']!;
  }
}

extension CountryExtension on Country {
  String get name {
    return nameMap[UserStorage.instance.language.code] ?? nameMap['vi']!;
  }
}

extension DeviceOSExtension on DeviceOS {
  String get api {
    String result;
    switch (this) {
      case DeviceOS.ios:
        result = 'ios';
        break;
      case DeviceOS.android:
        result = 'android';
        break;
      case DeviceOS.mac:
        result = 'mac';
        break;
      case DeviceOS.window:
        result = 'window';
        break;
      case DeviceOS.linux:
        result = 'linux';
        break;
      case DeviceOS.chrome:
        result = 'chrome';
        break;
      case DeviceOS.safari:
        result = 'safari';
        break;
      case DeviceOS.firefox:
        result = 'firefox';
        break;
      case DeviceOS.ie:
        result = 'ie';
        break;
      case DeviceOS.edge:
        result = 'edge';
        break;
      default:
        result = 'unsupported';
        break;
    }
    return result;
  }
}

extension GenderExtension on Gender {
  String get text {
    String result;
    switch (this) {
      case Gender.male:
        result = 'Male'.localized;
        break;
      case Gender.female:
        result = 'Female'.localized;
        break;
      default:
        result = 'Unknown'.localized;
        break;
    }
    return result;
  }
}

extension LanguageExtension on Language {
  String get code {
    String result;
    switch (this) {
      case Language.english:
        result = 'en';
        break;
      default:
        result = 'vi';
        break;
    }
    return result;
  }
}

extension ListAlleryExtension on List<Allergy> {
  String get text {
    String result = '';
    this.forEach((element) {
      if (result.isNotEmpty) result += '\n';
      result += element.name;
      if (element.description?.isNotEmpty ?? false) {
        result += ' / ' + element.description!;
      }
    });
    return result;
  }
}

extension ListSurgeryExtension on List<Surgery> {
  String get text {
    String result = '';
    this.forEach((element) {
      if (result.isNotEmpty) result += '\n';
      result += element.name +
          ' / ' +
          Converter.dateTimeToString(date: element.date, toFormat: 'MMM yyyy');
      if (element.description?.isNotEmpty ?? false) {
        result += ' / ' + element.description!;
      }
    });
    return result;
  }
}

extension ListSymptomExtension on List<Symptom> {
  String get text {
    String result = '';
    this.forEach((element) {
      if (result.isNotEmpty) result += '\n';
      result += element.name + ' / ' + element.note;
    });

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
  String get api {
    String result;
    switch (this) {
      case PackageType.classic:
        result = 'classic';
        break;
      default:
        result = 'telemed';
        break;
    }
    return result;
  }

  String get text {
    String result;
    switch (this) {
      case PackageType.classic:
        result = 'Exam_at_clinic'.localized;
        break;
      default:
        result = 'Telemedicine'.localized;
        break;
    }
    return result;
  }
}

extension SpecialtyExtension on Specialty {
  String get text {
    return nameMap[UserStorage.instance.language.code]!;
  }
}

extension StateExtension on State {
  String get name {
    return nameMap[UserStorage.instance.language.code] ?? nameMap['vi']!;
  }
}

extension UserTypeExtension on UserType {
  String get text {
    String result;
    switch (this) {
      case UserType.clinic:
        result = 'Clinic'.localized;
        break;
      case UserType.doctor:
        result = 'Doctor'.localized;
        break;
      case UserType.patient:
        result = 'Patient'.localized;
        break;
      default:
        result = 'System'.localized;
        break;
    }
    return result;
  }
}
