import 'package:clinic/model/app_state.dart';
import 'package:clinic/model/extension.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/button.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/system_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Observer(
        builder: (context) {
          final page = AppState.instance.currentMainPage;
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox.fromSize(
                size: Size.fromHeight(SystemInfo.isMobileApp ? 84 : 15.0),
              ),
              _Item(
                thisPage: AppMainPage.activeAppointment,
                currentPage: page,
              ),
              _Item(
                thisPage: AppMainPage.historyAppointment,
                currentPage: page,
              ),
              const Divider(
                height: 30,
              ),
              _Item(
                thisPage: AppMainPage.doctorInformation,
                currentPage: page,
              ),
              _Item(
                thisPage: AppMainPage.timetableInformation,
                currentPage: page,
              ),
              const Divider(),
              _Item(
                thisPage: AppMainPage.aboutUs,
                currentPage: page,
              ),
              _Item(
                thisPage: AppMainPage.faq,
                currentPage: page,
              ),
              _Item(
                thisPage: AppMainPage.termCondition,
                currentPage: page,
              ),
              _Item(
                thisPage: AppMainPage.contact,
                currentPage: page,
              ),
              const Divider(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Button.create(
                  text: "Logout".localized,
                  onPressed: () {
                    UserStorage.instance.logout();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  _Item({
    required this.thisPage,
    required this.currentPage,
  });

  String get title => thisPage.text;
  final AppMainPage thisPage;
  final AppMainPage currentPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.grey,
      selected: thisPage == currentPage,
      title: Text(title),
      onTap: () {
        if (currentPage != thisPage) {
          AppState.instance.setMainPage(thisPage);
        }
      },
    );
  }
}
