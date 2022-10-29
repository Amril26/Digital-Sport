import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatelessWidget {
  static String rootNamed = 'detail-product/';
  DetailProductPage({Key? key}) : super(key: key);

  Widget _headers(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: LayoutMargin.marginVertical20,
            child: Image.asset(
              'assets/product1.png',
              height: MediaQuery.of(context).size.height * 0.33,
            ),
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

  Widget _bottomNavigationBar(BuildContext context,
      {required Function() onTap}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.68,
      alignment: Alignment.center,
      padding: LayoutMargin.marginVertical20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _descriptionProduct(),
        ],
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

  Widget _descriptionProduct() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'T-shirt Persebaya 1927 College - Green',
            style: TextSetting.h1.copyWith(
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Aksesoris',
            style: TextSetting.p2.copyWith(
              letterSpacing: 1,
              color: ColorApp.txColorsecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          _priceProduct()
        ],
      ),
    );
  }

  Widget _priceProduct() {
    return Container(
      padding: LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
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
      backgroundColor: const Color(0XFFB5DAC7),
      body: _headers(context),
      //  Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
      //     _descriptionEvent(),
      //     _priceEvent(),
      //     const Spacer(),
      //     _counterAddEvent(),
      //   ],
      // ),
      bottomNavigationBar: _bottomNavigationBar(
        context,
        onTap: () {},
      ),
    );
  }
}
