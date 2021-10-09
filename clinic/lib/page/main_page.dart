import 'package:clinic/api/clinic/clinic_detail_api.dart';
import 'package:clinic/api/clinic/clinic_user_detail_api.dart';
import 'package:clinic/model/app_state.dart';
import 'package:clinic/page/about_us_page.dart';
import 'package:clinic/page/clinic_page.dart';
import 'package:clinic/page/contact_page.dart';
import 'package:clinic/page/faq_page.dart';
import 'package:clinic/page/list_appointment_page.dart';
import 'package:clinic/page/list_doctor_page.dart';
import 'package:clinic/page/list_history_appointment_page.dart';
import 'package:clinic/page/list_schedule_page.dart';
import 'package:clinic/page/term_condition_page.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/button.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/view/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  Map<AppPage, Widget> get _pageMap => {
        AppPage.activeAppointment: ListAppointmentPage(),
        AppPage.historyAppointment: ListHistoryAppointmentPage(),
        AppPage.clinicInformation: ClinicPage(),
        AppPage.doctorInformation: ListDoctorPage(),
        AppPage.scheduleInformation: ListSchedulePage(),
        AppPage.aboutUs: AboutUsPage(),
        AppPage.faq: FaqPage(),
        AppPage.termCondition: TermConditionPage(),
        AppPage.contact: ContactPage(),
      };

  void _loadInformation(String token) async {
    try {
      final clinic = await ClinicDetailApi(token: token).run();
      final user = await ClinicUserDetailApi(token: token).run();
      await UserStorage.instance.setClinicAndUser(clinic: clinic, user: user);
    } catch (e) {
      print(e);
      if (e is int && e == 403) {
        UserStorage.instance.logout();
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'.localized),
              content: Text('Error occur, please retry'.localized),
              actions: <Widget>[
                Button.submit(
                  text: 'Retry'.localized,
                  onPressed: () {
                    _loadInformation(token);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void initState() {
    _loadInformation(UserStorage.instance.token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 304,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Admin".localized),
            ),
            body: MainDrawer(),
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
        ),
        Expanded(
          child: Observer(
            builder: (context) {
              return _pageMap[AppState.instance.currentPage]!;
            },
          ),
        ),
      ],
    );
  }
}
