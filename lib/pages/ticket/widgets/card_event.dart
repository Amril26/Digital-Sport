import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/banner_event.png'),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/bg_ticket.png'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Persebaya VS Persib',
                style: TextSetting.h1
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                'Minggu, 11 Sep 2022, 15:45',
                style: TextSetting.p2
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/stadion.png',
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Gelora Bung Tomo, Surabaya',
                    maxLines: 1,
                    style: TextSetting.p2.copyWith(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(children: [
                Image.asset(
                  'assets/icons/tiket2.png',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Tiket (2)',
                  maxLines: 1,
                  style: TextSetting.p2.copyWith(
                    letterSpacing: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
