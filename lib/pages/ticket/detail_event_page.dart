import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/favorite/favorite_page.dart';
import 'package:flutter/material.dart';

class DetailEventPage extends StatelessWidget {
  static String rootNamed = 'detail-event/';
  DetailEventPage({Key? key}) : super(key: key);

  Widget _headers(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.33,
          child: Image.asset(
            'assets/banner_event.png',
            height: MediaQuery.of(context).size.height * 0.33,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: ColorApp.colorPrimary,
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _bottomNavigationBar({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        padding: LayoutMargin.marginVertical20,
        color: ColorApp.colorPrimary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/tiket2.png',
              color: Colors.white,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'beli TIket'.toUpperCase(),
              style: TextSetting.h2.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _counterAddEvent() {
    return Container(
      padding: LayoutMargin.marginHorizontal20.copyWith(
        top: 20,
        bottom: 20,
      ),
      color: ColorApp.colorPrimary.withOpacity(0.1),
      child: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'SubTotal   ',
                style: TextSetting.h2.copyWith(fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: 'Rp 287.96',
                style: TextSetting.h2.copyWith(
                    color: ColorApp.colorPrimary, fontWeight: FontWeight.w500),
              ),
            ]),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/icons/remove_item.png',
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            '2',
            style: TextSetting.h2.copyWith(
                color: ColorApp.colorPrimary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/icons/add_item.png',
              height: 24,
              width: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget _descriptionEvent() {
    return Padding(
      padding: LayoutMargin.marginHorizontal20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Persebaya VS Persib'.toUpperCase(),
            style: TextSetting.h1.copyWith(
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Minggu, 11 Sep 2022, 15:45',
            style: TextSetting.p2.copyWith(
              letterSpacing: 1,
              color: ColorApp.txColorsecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/stadion.png',
                height: 30,
                width: 30,
                color: ColorApp.txColorPrimary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Gelora Bung Tomo, Surabaya',
                maxLines: 1,
                style: TextSetting.p2.copyWith(
                  letterSpacing: 1,
                  color: ColorApp.txColorPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(children: [
            Image.asset(
              'assets/icons/tiket2.png',
              height: 30,
              width: 30,
              color: ColorApp.txColorPrimary,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Tiket (2)',
              maxLines: 1,
              style: TextSetting.p2.copyWith(
                letterSpacing: 1,
                color: ColorApp.txColorPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _priceEvent() {
    return Container(
      padding: LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
      margin: LayoutMargin.marginHorizontal20.copyWith(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorApp.colorPrimary.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Harga Tiket',
            style: TextSetting.p1
                .copyWith(letterSpacing: 1, color: ColorApp.txColorPrimary),
          ),
          Text(
            'Rp 45.000',
            style: TextSetting.p1.copyWith(
              letterSpacing: 1,
              color: ColorApp.colorPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _headers(context),
          _descriptionEvent(),
          _priceEvent(),
          const Spacer(),
          _counterAddEvent(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(
        onTap: () {},
      ),
    );
  }
}
