import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/match/widgets/card_match.dart';
import 'package:flutter/material.dart';

class MatchHistoryPage extends StatelessWidget {
  const MatchHistoryPage({Key? key}) : super(key: key);

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
          'History Pertandingan',
          style: TextSetting.h1,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => CardMath(),
      ),
    );
  }
}
