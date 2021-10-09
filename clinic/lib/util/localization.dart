import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:clinic/util/system_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension Localization on String {
  String get localized {
    return CustomLocalizationDelegate.instance.getText(this);
  }

  String get defaultLocalized {
    return CustomLocalizationDelegate.instance.getDefaultText(this);
  }
}

class Nothing {}

class CustomLocalizationDelegate extends LocalizationsDelegate<Nothing> {
  static final CustomLocalizationDelegate instance =
      CustomLocalizationDelegate._init();
  late Map<String, Map<String, dynamic>> _map;
  late Set<String> _supportedLanguages;
  late String _defaultLanguage;
  late String _currentLanguage;
  late bool _useDeviceLanguage;

  CustomLocalizationDelegate._init();

  Future<void> _load(String language) async {
    final path = 'assets/languages/$language.json';
    final data = await rootBundle.loadString(path);
    _map[language] = json.decode(data);
  }

  String _localLanguage() {
    if (SystemInfo.isMobileApp) {
      final code = Locale(Platform.localeName).languageCode;
      return code.substring(0, min(2, code.length));
    } else {
      return _defaultLanguage;
    }
  }

  Future<void> initialize({
    required Set<String> supportedLanguages,
    required String defaultLanguage,
    String? currentLanguage,
  }) async {
    _map = Map();
    _supportedLanguages = supportedLanguages;
    _defaultLanguage = defaultLanguage;
    String language;
    if (currentLanguage == null) {
      language = _localLanguage();
      _useDeviceLanguage = true;
    } else {
      _useDeviceLanguage = false;
      language = currentLanguage;
    }
    if (_defaultLanguage != language) {
      await _load(_defaultLanguage);
    }
    await setLanguage(language);
  }

  Future<void> update() async {
    if (_useDeviceLanguage) {
      await setLanguage(_localLanguage());
    }
  }

  Future<void> setLanguage(String language) async {
    if (_supportedLanguages.contains(language)) {
      _currentLanguage = language;
    } else {
      _currentLanguage = _defaultLanguage;
      print(
          'Not supported $language, default language $_defaultLanguage will be used');
    }
    await _load(_currentLanguage);
  }

  String getText(String key) {
    return _getText(key, _currentLanguage);
  }

  String getDefaultText(String key) {
    return _getText(key, _defaultLanguage);
  }

  String _getText(String key, String language) {
    String? result;
    final map = _map[language];
    if (map != null) {
      result = map[key];
    }
    return result ?? "$key";
  }

  @override
  bool isSupported(Locale locale) {
    final code = locale.languageCode;
    final language = code.substring(0, min(2, code.length));
    return _supportedLanguages.contains(language);
  }

  @override
  Future<Nothing> load(Locale locale) async {
    await update();
    return SynchronousFuture<Nothing>(Nothing());
  }

  @override
  bool shouldReload(LocalizationsDelegate<void> old) {
    return true;
  }
}
