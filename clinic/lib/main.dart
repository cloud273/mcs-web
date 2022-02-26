import 'dart:async';

import 'package:clinic/model/app_info.dart';
import 'package:clinic/model/app_state.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/page/main/login_page.dart';
import 'package:clinic/page/main/main_page.dart';
import 'package:clinic/storage/other_storage.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/system_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  _main();
}

void _main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInfo.instance.set('com.cloud273.clinic');
  await SystemInfo.initialize();
  await UserStorage.instance.initialize();
  await OtherStorage.instance.initialize();
  await CustomLocalizationDelegate.instance.initialize(
    supportedLanguages: {'en', 'vi'},
    defaultLanguage: UserStorage.instance.language.code,
  );
  runZoned(
    () {
      runApp(_ApplicationWidget());
    },
  );
}

class _ApplicationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud273',
      home: Observer(builder: (context) {
        if (AppState.instance.isLogged) {
          return const MainPage();
        } else {
          return const LoginPage();
        }
      }),
    );
  }
}
