import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetCardHorizontal extends StatelessWidget {
  final Function() onTap;
  final String image, title, categoryName;
  final int price;
  const WidgetCardHorizontal(
      {Key? key,
      required this.onTap,
      required this.image,
      required this.title,
      required this.categoryName,
      required this.price})
      : super(key: key);

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
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                color: ColorApp.colorPrimary.withOpacity(0.30),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    ColorApp.colorPrimary.withOpacity(0.30),
                    BlendMode.color,
                  ),
                ),
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
                    title,
                    maxLines: 2,
                    style: TextSetting.p2.copyWith(
                      color: ColorApp.txColorPrimary,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    categoryName,
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
                    'Rp ${NumberFormat("#,###", "ID_id").format(price)}',
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
