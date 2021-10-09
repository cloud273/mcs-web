import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

class AppState extends _AppState {
  static final AppState instance = AppState._init();

  AppState._init();
  void initialize({
    required bool isLogged,
    required AppPage initPage,
  }) {
    this.isLogged = isLogged;
    this.currentPage = initPage;
  }
}

class _AppState = AppStateBase with _$AppState;

enum AppPage {
  activeAppointment,
  historyAppointment,
  doctorInformation,
  clinicInformation,
  packageInformation,
  scheduleInformation,
  aboutUs,
  faq,
  termCondition,
  contact,
}

abstract class AppStateBase with Store {
  @observable
  bool isLogged = false;

  @observable
  AppPage currentPage = AppPage.activeAppointment;

  @action
  void login() {
    isLogged = true;
  }

  @action
  void logout() {
    isLogged = false;
  }

  @action
  void setPage(AppPage page) {
    currentPage = page;
  }
}
