import 'package:digital_sport/pages/auth/login_page.dart';
import 'package:digital_sport/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Sport',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.rootNamed,
      routes: {
        SplashPage.rootNamed: (context) => const SplashPage(),
        LoginPage.rootNamed: (context) => const LoginPage(),
      },
    );
  }
}
