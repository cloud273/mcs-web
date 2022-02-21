import 'package:clinic/api/account/account_login_api.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/alert.dart';
import 'package:clinic/util/button.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/validator.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  late String? _username, _password;

  void _setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  bool _validateInputs() {
    bool result = _formKey.currentState!.validate();
    if (result) {
      _formKey.currentState!.save();
    }
    return result;
  }

  void _login(BuildContext context) async {
    try {
      _setLoading(true);
      final token = await AccountLoginApi(
        type: AccountType.clinic,
        username: _username!,
        password: _password!,
      ).run();
      _setLoading(false);
      await UserStorage.instance.setToken(token: token);
    } catch (error) {
      _setLoading(false);
      if (error == 401 || error == 404) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'.localized),
              content: Text('Wrong_login_info'.localized),
            );
          },
        );
      } else {
        HttpAlert.showError(context, error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'.localized),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(18, 30, 18, 30),
            width: 480,
            height: 480,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    keyboardAppearance: Brightness.light,
                    decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        labelText: "Email".localized),
                    validator: (value) {
                      return Validator.validatorEmail(value);
                    },
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    onSaved: (value) => _username = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    keyboardAppearance: Brightness.light,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security),
                      labelText: "Password".localized,
                    ),
                    validator: (value) {
                      return Validator.validatorPassword(value);
                    },
                    onSaved: (value) => _password = value,
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Button.create(
                          text: "Login".localized,
                          onPressed: () {
                            if (_validateInputs()) {
                              _login(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
