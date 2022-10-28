import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardMath extends StatelessWidget {
  const CardMath({Key? key}) : super(key: key);

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
                      ),
                      Text(
                        '2   VS   0',
                        style: TextSetting.h1
                            .copyWith(fontSize: 21, color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundColor: ColorApp.txColorsecondary,
                        radius: 30,
                      ),
                    ],
                  ),
                  Text(
                    'Minggu, 11 Sep 2022, 15:45',
                    style: TextSetting.d1.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Gelora Bung Tomo, Surabaya',
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
