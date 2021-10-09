import 'package:clinic/constant.dart';
import 'package:clinic/page/base/web_info_page.dart';
import 'package:clinic/util/localization.dart';

class ContactPage extends WebInfoPage {
  @override
  String get title => "Contact".localized;

  @override
  String get url => ContactUrl;
}
