import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';

class SnackBarWidget {
  static snackBarSucces({required String message}) {
    return SnackBar(
      backgroundColor: Colors.green.shade800,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: TextSetting.p2.copyWith(color: Colors.white),
      ),
    );
  }

  static snackBarNotSucces({required String message}) {
    return SnackBar(
      backgroundColor: ColorApp.colorSecondary2,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: TextSetting.p2.copyWith(color: Colors.white),
      ),
    );
  }
}
