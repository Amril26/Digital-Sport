import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/ticket/body_event.dart';
import 'package:digital_sport/pages/ticket/body_history_event.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  static String rootNamed = 'ticket-page/';
  TicketPage({Key? key}) : super(key: key);

  final List<Widget> _tabBarItem = [
    const Tab(
      text: 'Kegiatan',
    ),
    const Tab(
      text: 'Riwayat Tiket',
    ),
  ];

  final List<Widget> _body = [
    const BodyEvent(),
    const BodyHistoryEvent(),
  ]; 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabBarItem.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: ColorApp.txColorPrimary,
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Event',
            style: TextSetting.h1,
          ),
          shape: Border(
            bottom: BorderSide(color: ColorApp.txColorsecondary),
          ),
          bottom: TabBar(
              indicatorColor: Colors.transparent,
              unselectedLabelColor: ColorApp.txColorsecondary2,
              labelColor: ColorApp.colorPrimary,
              labelStyle: TextSetting.p2.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorApp.txColorsecondary2,
              ),
              tabs: _tabBarItem),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _body,
        ),
      ),
    );
  }
}
