import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

class AppState extends _AppState {
  static final AppState instance = AppState._init();

  AppState._init();
  void initialize({
    required bool isLogged,
    required AppMainPage initPage,
  }) {
    this.isLogged = isLogged;
    this.currentMainPage = initPage;
  }
}

class _AppState = AppStateBase with _$AppState;

enum AppMainPage {
  activeAppointment,
  historyAppointment,
  doctorInformation,
  clinicInformation,
  packageInformation,
  timetableInformation,
  aboutUs,
  faq,
  termCondition,
  contact,
}

abstract class AppStateBase with Store {
  @observable
  bool isLogged = false;

  @observable
  AppMainPage currentMainPage = AppMainPage.activeAppointment;

  @action
  void login() {
    isLogged = true;
  }

  @action
  void logout() {
    isLogged = false;
  }

  @action
  void setMainPage(AppMainPage page) {
    currentMainPage = page;
  }
}
