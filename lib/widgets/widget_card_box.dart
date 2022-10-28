import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';

class WidgetCardBox extends StatelessWidget {
  const WidgetCardBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: LayoutMargin.marginRight20.copyWith(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: ColorApp.colorPrimary.withOpacity(0.30),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/product1.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Jersey 2K22 Player',
              maxLines: 2,
              style: TextSetting.p1.copyWith(
                color: Colors.white,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '\$58,67',
              maxLines: 1,
              style: TextSetting.p2.copyWith(
                letterSpacing: 1.5,
                color: ColorApp.colorPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
