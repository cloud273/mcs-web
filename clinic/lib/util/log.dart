import 'dart:developer';
import 'dart:io';

import 'package:clinic/util/system_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'system_info.dart';

LogDatabase logDatabase = LogDatabase.init(50);

class LogDatabase {
  final int maxLength;

  LogDatabase.init(this.maxLength);

  final _list = <String>[];

  void add(String text, {String? title}) {
    final timeString =
        DateFormat('yyyy-MM-ddThh:mm:ss').format(DateTime.now().toUtc());
    final logText =
        "----------------------$timeString.00:00----------------------\n${(title == null || title.isEmpty) ? text : '$title\n$text'}";
    _list.insert(0, logText);
    if (_list.length > maxLength) {
      _list.removeLast();
    }
    if (SystemInfo.isMobileApp) {
      log(logText);
    } else {
      print(logText);
    }
  }

  List<String> get data => _list;

  String getText() {
    String result = "";
    for (final log in _list) {
      if (result.length > 0) {
        result += '\n\n';
      }
      result += log;
    }
    return result;
  }
}

class LogPage extends StatefulWidget {
  static show(BuildContext context) {
    if (SystemInfo.isMobileApp) {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => LogPage(
            db: logDatabase,
            emailTo: 'nglequduph@gmail.com',
          ),
        ),
      );
    } else {
      throw 'This class only use by mobile';
    }
  }

  final LogDatabase db;
  final String emailTo;
  LogPage({
    Key? key,
    required this.db,
    required this.emailTo,
  }) : super(key: key);

  @override
  _LogPageState createState() => _LogPageState(db: db, emailTo: emailTo);
}

class _LogPageState extends State<LogPage> {
  final LogDatabase db;
  final String emailTo;
  _LogPageState({
    required this.db,
    required this.emailTo,
  }) : super();

  void _showResult(String? message) {}

  void _sendEmail() async {
    if (Platform.isIOS) {
      final bool canSend = await FlutterMailer.canSendMail();
      if (!canSend) {
        _showResult('unsupported');
        return;
      }
    }
    final tmpDirectory = await getTemporaryDirectory();
    final basePath = tmpDirectory.path;
    final path = '$basePath/${'Log.txt'}';
    File file = File(path);
    await file.writeAsBytes(db.getText().codeUnits);
    final MailOptions mailOptions = MailOptions(
      subject: 'Device log',
      body: 'Please refer attachment for log information',
      recipients: [emailTo],
      bccRecipients: [],
      ccRecipients: [],
      isHTML: false,
      attachments: [file.path],
    );
    try {
      final response = await FlutterMailer.send(mailOptions);
      switch (response) {
        case MailerResponse.saved:
          _showResult('mail was saved to draft');
          break;
        case MailerResponse.sent:
          _showResult('mail was cancelled');
          break;
        case MailerResponse.cancelled:
          _showResult('mail was cancelled');
          break;
        case MailerResponse.android:
          _showResult('intent was success');
          break;
        default:
          _showResult('unknown');
          break;
      }
    } on PlatformException catch (error) {
      _showResult(error.message?.toLowerCase());
    } catch (error) {
      _showResult(error.toString().toLowerCase());
    } finally {
      final dir = Directory(file.path);
      dir.deleteSync(recursive: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug Log'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {
              _sendEmail();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
        child: Text(
          db.getText(),
          maxLines: 100,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
