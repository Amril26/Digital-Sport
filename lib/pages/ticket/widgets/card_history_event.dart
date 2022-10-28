import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';

class CardHistoryEvent extends StatelessWidget {
  const CardHistoryEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              child: Image.asset(
                'assets/product1.png',
                fit: BoxFit.contain,
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
                    'Persebaya vs Persib'.toUpperCase(),
                    maxLines: 1,
                    style: TextSetting.p2.copyWith(
                      color: ColorApp.txColorPrimary,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/location.png',
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Gelora Bung Tomo, Surabaya',
                        maxLines: 1,
                        style: TextSetting.d1.copyWith(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Image.asset(
                      'assets/icons/tiket2.png',
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Tiket (2)',
                      maxLines: 1,
                      style: TextSetting.d1.copyWith(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '11 Sep 2022, 15:45 ',
                          maxLines: 1,
                          style: TextSetting.d1.copyWith(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        'Aktif'.toUpperCase(),
                        maxLines: 1,
                        style: TextSetting.d1.copyWith(
                          letterSpacing: 1,
                          color: ColorApp.colorPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
