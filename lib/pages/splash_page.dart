import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/auth/login_page.dart';
import 'package:digital_sport/pages/current_index_pages.dart';
import 'package:digital_sport/pages/dashboard/dashboard_page.dart';
import 'package:digital_sport/pages/wrapper_pages.dart';
import 'package:digital_sport/providers/auth_provider/auth_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static String rootNamed = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, WrapperPage.rootNamed));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.colorPrimary,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'assets/logoes/logo_persebaya.png',
              height: 110,
            ),
            const Spacer(),
            Text(
              'Digital Sport',
              style: TextSetting.h2.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
