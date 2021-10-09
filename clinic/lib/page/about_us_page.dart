import 'package:clinic/constant.dart';
import 'package:clinic/page/base/web_info_page.dart';
import 'package:clinic/util/localization.dart';

class AboutUsPage extends WebInfoPage {
  @override
  String get title => "About_us".localized;

  @override
  String get url => AboutUsUrl;
}
