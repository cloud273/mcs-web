import 'package:clinic/constant.dart';
import 'package:clinic/page/base/web_info_page.dart';
import 'package:clinic/util/localization.dart';

class FaqPage extends WebInfoPage {
  @override
  String get title => "Faq".localized;

  @override
  String get url => FaqUrl;
}
