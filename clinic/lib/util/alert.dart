import 'package:clinic/util/localization.dart';
import 'package:flutter/material.dart';

class TitleAction {
  TitleAction(
    this.title,
    this.action,
  );
  final String title;

  final VoidCallback action;
}

class Alert {
  static show(
    BuildContext context, {
    String? title,
    String? message,
    List<TitleAction>? buttons,
  }) {
    final List<Widget> actions = [];
    if (buttons != null && buttons.isNotEmpty) {
      buttons.forEach((element) {
        actions.add(
          FlatButton(
            child: Text(element.title),
            onPressed: element.action,
          ),
        );
      });
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title != null ? Text(title) : null,
            content: message != null ? Text(message) : null,
            actions: actions,
          );
        });
  }

  static oneActionShow(
    BuildContext context, {
    String? title,
    String? message,
    required String button,
    required VoidCallback action,
  }) {
    show(
      context,
      title: title,
      message: message,
      buttons: [
        TitleAction(
          button,
          action,
        ),
      ],
    );
  }

  static dismissButtonShow(
    BuildContext context, {
    String? title,
    String? message,
    String? cancelButton,
    VoidCallback? action,
  }) {
    show(
      context,
      title: title,
      message: message,
      buttons: [
        TitleAction(
          cancelButton != null ? cancelButton : 'close'.localized,
          () {
            Navigator.pop(context);
            if (action != null) {
              action();
            }
          },
        ),
      ],
    );
  }

  static dismissAndActionButtonShow(
    BuildContext context, {
    String? title,
    String? message,
    required String actionButton,
    required VoidCallback action,
    required String cancelButton,
  }) {
    show(
      context,
      title: title,
      message: message,
      buttons: [
        TitleAction(
          actionButton,
          action,
        ),
        TitleAction(
          cancelButton,
          () => Navigator.pop(context),
        ),
      ],
    );
  }
}

class HttpAlert {
  static showError(BuildContext context, dynamic error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Error: $error'),
        );
      },
    );
  }

  static showTimeout(BuildContext context) {
    Alert.dismissButtonShow(
      context,
      title: 'error_title'.localized,
      message: 'error_timeout'.localized,
    );
  }

  static showUnknown(BuildContext context) {
    Alert.dismissButtonShow(
      context,
      title: 'error_title'.localized,
      message: 'error_unknown'.localized,
    );
  }
}

class DecryptAlert {
  static showUnknown(BuildContext context) {
    Alert.dismissButtonShow(
      context,
      title: 'error_title'.localized,
      message: 'error_decrypt'.localized,
    );
  }
}
