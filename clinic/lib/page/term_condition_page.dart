import 'package:clinic/constant.dart';
import 'package:clinic/page/base/web_info_page.dart';
import 'package:clinic/util/localization.dart';

class TermConditionPage extends WebInfoPage {
  @override
  String get title => "Term_condition".localized;

  @override
  String get url => TermUrl;
}
