import 'package:clinic/api/clinic/clinic_detail_api.dart';
import 'package:clinic/api/clinic/clinic_user_detail_api.dart';
import 'package:clinic/model/app_state.dart';
import 'package:clinic/page/appointment/list_appointment_page.dart';
import 'package:clinic/page/clinic_page.dart';
import 'package:clinic/page/history/list_history_appointment_page.dart';
import 'package:clinic/page/list_doctor_page.dart';
import 'package:clinic/page/timetable_page.dart';
import 'package:clinic/page/web/about_us_page.dart';
import 'package:clinic/page/web/contact_page.dart';
import 'package:clinic/page/web/faq_page.dart';
import 'package:clinic/page/web/term_condition_page.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/button.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/view/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  Map<AppMainPage, Widget> get _pageMap => {
        AppMainPage.activeAppointment: ListAppointmentPage(),
        AppMainPage.historyAppointment: ListHistoryAppointmentPage(),
        AppMainPage.clinicInformation: ClinicPage(),
        AppMainPage.doctorInformation: ListDoctorPage(),
        AppMainPage.timetableInformation: TimetablePage(),
        AppMainPage.aboutUs: AboutUsPage(),
        AppMainPage.faq: FaqPage(),
        AppMainPage.termCondition: TermConditionPage(),
        AppMainPage.contact: ContactPage(),
      };

  void _loadInformation(String token) async {
    try {
      final clinic = await ClinicDetailApi(token: token).run();
      final user = await ClinicUserDetailApi(token: token).run();
      await UserStorage.instance.setClinicAndUser(clinic: clinic, user: user);
    } catch (e) {
      if (e == 403) {
        UserStorage.instance.logout();
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'.localized),
              content: Text('Error occur, please retry'.localized),
              actions: <Widget>[
                Button.create(
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
              return _pageMap[AppState.instance.currentMainPage]!;
            },
          ),
        ),
      ],
    );
  }
}
