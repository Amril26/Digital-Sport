import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';

class WidgetCardHorizontal extends StatelessWidget {
  final Function() onTap;
  const WidgetCardHorizontal({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                color: ColorApp.colorPrimary.withOpacity(0.30),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/product1.png',
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: ColorApp.colorPrimary,
                      child: Text(
                        'XL',
                        style: TextSetting.d1.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jersey 2K22 Player  asdas sadas',
                    maxLines: 2,
                    style: TextSetting.p2.copyWith(
                      color: ColorApp.txColorPrimary,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Kaos Persebaya Wani Icon',
                    maxLines: 1,
                    style: TextSetting.d1.copyWith(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
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
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.favorite,
                color: ColorApp.colorPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
