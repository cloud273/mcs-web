import 'dart:io';

import 'package:clinic/util/system_info.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static showCamera(context, void Function(File? file) completion) {
    if (SystemInfo.isMobileApp) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => _CameraWidget(
            onFinish: (file) {
              Navigator.pop(context);
              completion(file);
            },
          ),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    } else {
      throw 'This class only use by mobile';
    }
  }
}

class _CameraWidget extends StatelessWidget {
  _CameraWidget({
    required this.onFinish,
  });

  final void Function(File? file) onFinish;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 200), () async {
      try {
        var image = await ImagePicker().getImage(source: ImageSource.camera);
        if (image != null) {
          onFinish(File(image.path));
        } else {
          onFinish(null);
        }
      } catch (e) {
        onFinish(null);
      }
    });
    return Container(
      color: Colors.transparent,
    );
  }
}
