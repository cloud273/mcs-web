import 'package:clinic/constant.dart';
import 'package:clinic/model/app_state.dart';
import 'package:clinic/model/extension.dart';
import 'package:clinic/page/base/web_info_page.dart';

class ContactPage extends WebInfoPage {
  @override
  String get title => AppMainPage.contact.text;

  @override
  String get url => ContactUrl;
}
