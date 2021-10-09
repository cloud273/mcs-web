import 'dart:io';

import 'package:clinic/model/enum.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:web_browser_detect/web_browser_detect.dart';

class SystemInfo {
  static late PackageInfo _packageInfo;
  static AndroidDeviceInfo? _androidDeviceInfo;
  static IosDeviceInfo? _iosDeviceInfo;
  static MacOsDeviceInfo? _macOsDeviceInfo;
  static WindowsDeviceInfo? _windowDeviceInfo;
  static LinuxDeviceInfo? _linuxDeviceInfo;
  static WebBrowserInfo? _webBrowserInfo;

  static initialize() async {
    _packageInfo = await PackageInfo.fromPlatform();
    DeviceInfoPlugin info = DeviceInfoPlugin();
    if (isWebApp) {
      _webBrowserInfo = await info.webBrowserInfo;
    } else {
      if (Platform.isAndroid) {
        _androidDeviceInfo = await info.androidInfo;
      } else if (Platform.isIOS) {
        _iosDeviceInfo = await info.iosInfo;
      } else if (Platform.isMacOS) {
        _macOsDeviceInfo = await info.macOsInfo;
      } else if (Platform.isMacOS) {
        _windowDeviceInfo = await info.windowsInfo;
      } else if (Platform.isMacOS) {
        _linuxDeviceInfo = await info.linuxInfo;
      }
    }
    print("-------BEGIN-------");
    print(_packageInfo.version);
    print(_packageInfo.appName);
    print(_packageInfo.buildNumber);
    print(_packageInfo.packageName);
    print(deviceInfo);
    print("-------END-------");
  }

  static String? get _iosInfoString => _iosDeviceInfo != null
      ? "${_iosDeviceInfo!.name!} - ${_iosDeviceInfo!.systemName!} ${_iosDeviceInfo!.systemVersion!}"
      : null;

  static String? get _androidInfoString => _androidDeviceInfo != null
      ? "${_androidDeviceInfo!.manufacturer!} - ${_androidDeviceInfo!.brand!} - ${_androidDeviceInfo!.model} - ${_androidDeviceInfo!.version.sdkInt}"
      : null;

  static String? get _webInfoString =>
      _webBrowserInfo != null ? _webBrowserInfo!.userAgent! : null;

  static String? get _windowInfoString => _windowDeviceInfo != null
      ? "Core ${_windowDeviceInfo!.numberOfCores} - Ram ${_windowDeviceInfo!.systemMemoryInMegabytes} MByte"
      : null;

  static String? get _macInfoString => _macOsDeviceInfo != null
      ? "${_macOsDeviceInfo!.model} - ${_macOsDeviceInfo!.osRelease} - ${_macOsDeviceInfo!.kernelVersion}"
          " - CPU ${_macOsDeviceInfo!.activeCPUs}core(s)/${_macOsDeviceInfo!.cpuFrequency / 1000000000}GHz - Ram ${_macOsDeviceInfo!.memorySize / (1024 * 1024)}MB"
      : null;

  static String? get _linuxInfoString =>
      _linuxDeviceInfo != null ? "${_linuxDeviceInfo!.name}" : null;

  static String get deviceInfo =>
      _iosInfoString ??
      _androidInfoString ??
      _webInfoString ??
      _macInfoString ??
      _windowInfoString ??
      _linuxInfoString ??
      'Unsupported';

  static String get appVersion => _packageInfo.version;

  static bool get isMobileApp =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static bool get isWebApp => kIsWeb;
}

DeviceOS get currentDeviceOS {
  if (kIsWeb) {
    final browser = Browser().browserAgent;
    if (browser == BrowserAgent.Chrome) {
      return DeviceOS.chrome;
    } else if (browser == BrowserAgent.Safari) {
      return DeviceOS.safari;
    } else if (browser == BrowserAgent.Firefox) {
      return DeviceOS.firefox;
    } else if (browser == BrowserAgent.Explorer) {
      return DeviceOS.ie;
    } else if (browser == BrowserAgent.Edge) {
      return DeviceOS.edge;
    } else {
      return DeviceOS.unsupported;
    }
  } else {
    if (Platform.isAndroid) {
      return DeviceOS.android;
    } else if (Platform.isIOS) {
      return DeviceOS.ios;
    } else if (Platform.isMacOS) {
      return DeviceOS.mac;
    } else if (Platform.isWindows) {
      return DeviceOS.window;
    } else if (Platform.isLinux) {
      return DeviceOS.linux;
    } else {
      return DeviceOS.unsupported;
    }
  }
}
