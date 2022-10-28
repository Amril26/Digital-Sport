import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/dashboard/dashboard_page.dart';
import 'package:digital_sport/pages/match/match_history_page.dart';
import 'package:flutter/material.dart';

class CurrentIndexPage extends StatefulWidget {
  static String rootNamed = 'current-pages/';

  const CurrentIndexPage({Key? key}) : super(key: key);

  @override
  State<CurrentIndexPage> createState() => _CurrentIndexPageState();
}

class _CurrentIndexPageState extends State<CurrentIndexPage> {
  int _indexPage = 0;
  final List<Widget> _pagesCurrent = [
    DashboardPage(),
    const MatchHistoryPage(),
    Container(
      color: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pagesCurrent.elementAt(_indexPage),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int newindex) {
          setState(() {
            _indexPage = newindex;
          });
        },
        currentIndex: _indexPage,
        selectedLabelStyle:
            TextSetting.d1.copyWith(color: ColorApp.colorPrimary),
        unselectedLabelStyle:
            TextSetting.d1.copyWith(color: ColorApp.txColorsecondary),
        selectedItemColor: ColorApp.colorPrimary,
        unselectedItemColor: ColorApp.txColorsecondary,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/house-2.png',
              height: 22,
              width: 22,
              color: _indexPage == 0
                  ? ColorApp.colorPrimary
                  : ColorApp.txColorsecondary,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/jadwal.png',
                height: 22,
                width: 22,
                color: _indexPage == 1
                    ? ColorApp.colorPrimary
                    : ColorApp.txColorsecondary,
              ),
              label: 'Pertandingan'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/profile.png',
                height: 22,
                width: 22,
                color: _indexPage == 2
                    ? ColorApp.colorPrimary
                    : ColorApp.txColorsecondary,
              ),
              label: 'Profil'),
        ],
      ),
    );
  }
}
