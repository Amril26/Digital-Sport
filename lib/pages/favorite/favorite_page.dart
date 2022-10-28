import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/widgets/widget_card_horizontal.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  static String rootNamed = 'favorite/';
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
          color: ColorApp.txColorPrimary,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Favorite Jersey',
          style: TextSetting.h1,
        ),
      ),
      body: ListView.builder(
        padding: LayoutMargin.marginHorizontal20,
        itemCount: 10,
        itemBuilder: (context, index) => WidgetCardHorizontal(),
      ),
    );
  }
}
