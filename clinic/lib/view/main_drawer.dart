import 'package:clinic/model/app_state.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/button.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/system_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Observer(
        builder: (context) {
          final page = AppState.instance.currentPage;
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox.fromSize(
                size: Size.fromHeight(SystemInfo.isMobileApp ? 84 : 15.0),
              ),
              _Item(
                title: 'List_active_appointment'.localized,
                thisPage: AppPage.activeAppointment,
                currentPage: page,
              ),
              _Item(
                title: 'List_history_appointment'.localized,
                thisPage: AppPage.historyAppointment,
                currentPage: page,
              ),
              Divider(
                height: 30,
              ),
              _Item(
                title: 'Doctor'.localized,
                thisPage: AppPage.doctorInformation,
                currentPage: page,
              ),
              _Item(
                title: 'Schedule'.localized,
                thisPage: AppPage.scheduleInformation,
                currentPage: page,
              ),
              Divider(),
              _Item(
                title: 'About_us'.localized,
                thisPage: AppPage.aboutUs,
                currentPage: page,
              ),
              _Item(
                title: 'Faq'.localized,
                thisPage: AppPage.faq,
                currentPage: page,
              ),
              _Item(
                title: 'Term_condition'.localized,
                thisPage: AppPage.termCondition,
                currentPage: page,
              ),
              _Item(
                title: 'Contact'.localized,
                thisPage: AppPage.contact,
                currentPage: page,
              ),
              Divider(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Button.submit(
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
    required this.title,
    required this.thisPage,
    required this.currentPage,
  });

  final String title;
  final AppPage thisPage;
  final AppPage currentPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.grey,
      selected: thisPage == currentPage,
      title: Text(title),
      onTap: () {
        if (currentPage != thisPage) {
          AppState.instance.setPage(thisPage);
        }
      },
    );
  }
}
