class AppInfo {
  static final AppInfo instance = AppInfo._init();

  AppInfo._init();

  late final String id;

  void set(String id) {
    this.id = id;
  }
}
