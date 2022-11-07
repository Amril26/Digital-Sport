import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardMath extends StatelessWidget {
  final String score1, score2, image1, image2, date, location;
  const CardMath(
      {Key? key,
      required this.score1,
      required this.score2,
      required this.image1,
      required this.image2,
      required this.date,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: LayoutMargin.radiusAll,
          color: ColorApp.colorPrimary,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorApp.txColorsecondary,
                        radius: 30,
                        child: Image.network(image1, fit: BoxFit.fill),
                      ),
                      Text(
                        '$score1   VS   $score2',
                        style: TextSetting.h1
                            .copyWith(fontSize: 21, color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundColor: ColorApp.txColorsecondary,
                        radius: 30,
                        child: Image.network(
                          image2,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.parse(date))}',
                    style: TextSetting.d1.copyWith(color: Colors.white),
                  ),
                  Text(
                    location,
                    style: TextSetting.d1.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
