import 'package:clinic/model/app_state.dart';
import 'package:clinic/model/clinic.dart';
import 'package:clinic/model/clinic_user.dart';
import 'package:clinic/model/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static final UserStorage instance = UserStorage._init();

  String _tokenKey = 'token';

  late SharedPreferences _store;

  Clinic? _clinic;

  ClinicUser? _user;

  String? _token;

  UserStorage._init();

  Future<void> initialize() async {
    _store = await SharedPreferences.getInstance();
    _token = _store.getString(_tokenKey);
    AppState.instance.initialize(
      isLogged: _token != null,
      initPage: AppMainPage.activeAppointment,
    );
  }

  Future<void> setToken({required String token}) async {
    _token = token;
    await _store.setString(_tokenKey, token);
    AppState.instance.login();
  }

  Future<void> setClinicAndUser({
    required Clinic clinic,
    required ClinicUser user,
  }) async {
    _user = _user;
    _clinic = clinic;
  }

  Language get language => Language.vietnamese;

  String? get token => _token;

  Clinic? get clinic => _clinic;

  Future<void> logout() async {
    await _store.remove(_tokenKey);
    _token = null;
    _clinic = null;
    _user = null;
    AppState.instance.logout();
  }
}
