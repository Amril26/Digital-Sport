import 'package:digital_sport/helpers/color_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// class ini digunakan untuk style default yang digunakan pada text fonts style yang akan digunakan pada aplikasi
class FontStyle {
  ///fontSize 18
  ///
  ///fontWeight semiBold
  ///
  ///color  dark
  static TextStyle h1 = GoogleFonts.beVietnamPro(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorApp.txColorPrimary,
  );

  ///fontSize 14
  ///
  ///fontWeight medium
  ///
  ///color  greysecondary2
  static TextStyle p1 = GoogleFonts.beVietnamPro(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorApp.txColorsecondary2,
  );

  ///fontSize 12
  ///
  ///fontWeight medium
  ///
  ///color  greysecondary2
  static TextStyle p2 = GoogleFonts.beVietnamPro(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ColorApp.txColorsecondary2,
  );

  ///fontSize 12
  ///fontWeight medium
  ///color  greysecondary2
  static TextStyle d1 = GoogleFonts.beVietnamPro(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: ColorApp.txColorsecondary2,
  );
}
