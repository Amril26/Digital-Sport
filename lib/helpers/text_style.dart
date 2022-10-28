import 'package:digital_sport/helpers/color_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// class ini digunakan untuk style default yang digunakan pada text fonts style yang akan digunakan pada aplikasi
class TextSetting {
  ///fontSize 18
  ///
  ///
  ///color  dark
  static TextStyle h1 = GoogleFonts.beVietnamPro(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorApp.txColorPrimary,
  );

  ///fontSize 16
  ///
  ///
  ///color  dark
  static TextStyle h2 = GoogleFonts.beVietnamPro(
    fontSize: 16,
    color: ColorApp.txColorPrimary,
  );

  ///fontSize 14
  ///
  ///
  ///color  greysecondary2
  static TextStyle p1 = GoogleFonts.beVietnamPro(
    fontSize: 14,
    color: ColorApp.txColorsecondary2,
  );

  ///fontSize 12
  ///
  ///
  ///color  greysecondary2
  static TextStyle p2 = GoogleFonts.beVietnamPro(
    fontSize: 12,
    color: ColorApp.txColorsecondary2,
  );

  ///fontSize 10
  ///color  greysecondary2
  static TextStyle d1 = GoogleFonts.beVietnamPro(
    fontSize: 10,
    color: ColorApp.txColorsecondary2,
  );
}
