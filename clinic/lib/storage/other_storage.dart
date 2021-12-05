import 'dart:convert';

import 'package:clinic/api/common/config_api.dart';
import 'package:clinic/constant.dart';
import 'package:clinic/model/city.dart';
import 'package:clinic/model/country.dart';
import 'package:clinic/model/specialty.dart';
import 'package:clinic/model/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtherStorage {
  static final OtherStorage instance = OtherStorage._init();

  OtherStorage._init();

  String _configKey = 'config';

  late List<Country> _countries;
  late List<Specialty> _specialties;
  late int _creatableEnd;
  late int _acceptableEnd;
  late int _cancelableEnd;
  late int _rejectableEnd;
  late int _beginableFrom;
  late int _beginableEnd;
  late int _finishableEnd;

  late SharedPreferences _store;

  Future<void> initialize() async {
    _store = await SharedPreferences.getInstance();
    _load();
    await update();
  }

  Future<bool> update() async {
    try {
      final json = await ConfigApi().run();
      return _save(json);
    } catch (e) {
      return false;
    }
  }

  bool _parse(Map<String, dynamic> configJson) {
    try {
      _countries = (configJson['countries'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList();
      _specialties = (configJson['specialties'] as List<dynamic>)
          .map((e) => Specialty.fromJson(e as Map<String, dynamic>))
          .toList();
      final appointmentInfo = configJson['appointment'];
      _creatableEnd = appointmentInfo['creatable'] as int;
      _acceptableEnd = appointmentInfo['acceptable'] as int;
      _cancelableEnd = appointmentInfo['cancelable'] as int;
      _rejectableEnd = appointmentInfo['rejectable'] as int;
      _beginableFrom = appointmentInfo['beginable']['from'] as int;
      _beginableEnd = appointmentInfo['beginable']['to'] as int;
      _finishableEnd = appointmentInfo['finishable'] as int;
      return true;
    } catch (e) {
      print('Spoiled json $configJson - error $e');
      return false;
    }
  }

  _load() {
    bool isUseDefault = true;
    final jsonString = _store.getString(_configKey);
    if (jsonString != null) {
      try {
        final configJson =
            JsonDecoder().convert(jsonString) as Map<String, dynamic>;
        isUseDefault = !_parse(configJson);
      } catch (e) {}
    }
    if (isUseDefault) {
      _countries = [];
      _specialties = [];
      _creatableEnd = DefaultCreatableEnd;
      _acceptableEnd = DefaultAcceptableEnd;
      _cancelableEnd = DefaultCancelableEnd;
      _rejectableEnd = DefaultRejectableEnd;
      _beginableFrom = DefaultBeginableFrom;
      _beginableEnd = DefaultBeginableEnd;
      _finishableEnd = DefaultFinishableEnd;
    }
  }

  Future<bool> _save(Map<String, dynamic> configJson) async {
    if (_parse(configJson)) {
      final jsonString = JsonEncoder().convert(configJson);
      await _store.setString(_configKey, jsonString);
      return true;
    } else {
      return false;
    }
  }

  List<Country> get countries => _countries;

  List<Specialty> get specialties => _specialties;

  int get creatableEnd => _creatableEnd;

  int get acceptableEnd => _acceptableEnd;

  int get cancelableEnd => _cancelableEnd;

  int get rejectableEnd => _rejectableEnd;

  int get beginableFrom => _beginableFrom;

  int get beginableEnd => _beginableEnd;

  int get finishableEnd => _finishableEnd;

  Specialty specialty(String code) {
    return _specialties.firstWhere((element) => element.code == code);
  }

  Country country(String code) {
    return _countries.firstWhere((element) => element.code == code);
  }

  State state(String code) {
    for (Country country in _countries) {
      for (State state in country.states) {
        if (state.code == code) {
          return state;
        }
      }
    }
    throw Exception('Not found');
  }

  City city(String code) {
    for (Country country in _countries) {
      for (State state in country.states) {
        for (City city in state.cities) {
          if (city.code == code) {
            return city;
          }
        }
      }
    }
    throw Exception('Not found');
  }
}
