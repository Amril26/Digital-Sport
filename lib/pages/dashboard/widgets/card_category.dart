import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final String pathAssets, title;
  final Color gradientColor;
  final Function() onTapCategory;
  const CardCategory(
      {Key? key,
      required this.pathAssets,
      required this.title,
      required this.gradientColor,
      required this.onTapCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCategory,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  gradientColor.withOpacity(0.3),
                  gradientColor.withOpacity(0.3),
                  Colors.white.withOpacity(0.2),
                ],
              ),
            ),
            child: Image.asset(
              pathAssets,
              height: 28,
              width: 28,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextSetting.p2.copyWith(color: ColorApp.txColorPrimary),
          )
        ],
      ),
    );
  }
}
