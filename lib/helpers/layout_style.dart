import 'package:flutter/material.dart';

/// class ini digunakan untuk beberapa default **margin** dan **border** untuk mengatur jarak layout
class LayoutMargin {
  static EdgeInsets marginHorizontal20 =
      const EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsets marginVertical20 =
      const EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsets marginTop20 = const EdgeInsets.only(top: 20);
  static EdgeInsets marginBottom20 = const EdgeInsets.only(bottom: 20);
  static EdgeInsets marginLeft20 = const EdgeInsets.only(left: 20);
  static EdgeInsets marginRight20 = const EdgeInsets.only(right: 20);

  static BorderRadius radiusAll = BorderRadius.circular(8);
  static BorderRadius radiusTop = const BorderRadius.only(
      topLeft: Radius.circular(8), topRight: Radius.circular(8));
  static BorderRadius radiusBottom = const BorderRadius.only(
      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8));
}
