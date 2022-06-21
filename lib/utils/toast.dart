import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';


class AppToast {
  static successToast(String title, String desc, BuildContext context) {
    MotionToast.success(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            description: Text(desc),
            width: 300)
        .show(context);
  }

  static failureToast(String title, String desc, BuildContext context) {
    MotionToast.error(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            description: Text(desc),
            width: 300)
        .show(context);
  }

  static warningToast(String title, String desc, BuildContext context) {
    MotionToast.warning(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            description: Text(desc),
            width: 300)
        .show(context);
  }

  static infoToast(String title, String desc, BuildContext context) {
    MotionToast.info(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            description: Text(desc),
            width: 300)
        .show(context);
  }
}
