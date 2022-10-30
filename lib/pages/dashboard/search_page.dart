import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static String rootNamed = 'search-page/';
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorApp.colorPrimary,
        titleSpacing: -20,
        centerTitle: false,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
            ),
            icon: Image.asset(
              'assets/icons/search.png',
              height: 16,
              color: ColorApp.colorPrimary,
              width: 16,
            ),
            border: InputBorder.none,
            hintText: 'Cari daftar jersey',
            hintStyle: TextSetting.p2.copyWith(
                color: ColorApp.txColorsecondary, fontWeight: FontWeight.w300),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                LayoutMargin.marginHorizontal20.copyWith(top: 20, bottom: 16),
            color: Colors.white,
            child: Text(
              'Hasil Pencarian',
              style: TextSetting.h1.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: LayoutMargin.marginHorizontal20,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(bottom: 16),
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    )),
          )
        ],
      ),
    );
  }
}
