import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/match/widgets/card_match.dart';
import 'package:digital_sport/providers/get/match_providers.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchHistoryPage extends StatefulWidget {
  const MatchHistoryPage({Key? key}) : super(key: key);

  @override
  State<MatchHistoryPage> createState() => _MatchHistoryPageState();
}

class _MatchHistoryPageState extends State<MatchHistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<MatchProvider>().getDataMathc();
  }

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
        body: Consumer<MatchProvider>(builder: (context, dataMatch, _) {
          if (dataMatch.isLoad == true) {
            return const WidgetLoadingIndicator(size: 30);
          } else {
            return ListView.builder(
              itemCount: dataMatch.dataMatch.length,
              itemBuilder: (context, index) => CardMath(
                score1: dataMatch.dataMatch[index]['score'][0],
                score2: dataMatch.dataMatch[index]['score'][1],
                image1: dataMatch.dataMatch[index]['imag1'],
                image2: dataMatch.dataMatch[index]['image2'],
                date: dataMatch.dataMatch[index]['date'],
                location: 'location',
              ),
            );
          }
        }));
  }
}
