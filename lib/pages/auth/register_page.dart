import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/auth/login_page.dart';
import 'package:digital_sport/pages/auth/widgets/widget_form.dart';
import 'package:digital_sport/pages/auth/widgets/widget_headers.dart';
import 'package:digital_sport/pages/current_index_pages.dart';
import 'package:digital_sport/widgets/widget_button_primary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static String rootNamed = 'register/';
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.white,
              ColorApp.colorPrimary,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  //  NOTE:Headers
                  const WidgetHeadersLogin(
                    title1: 'Daftar',
                    title2: 'Sebagai Anggota',
                    pathImage: 'assets/logoes/logo_persebaya.png',
                  ),
                  const Spacer(),
                  //  NOTE:form
                  WidgetForm(
                    title: 'Nama',
                    hintText: 'Masukan Nama anda',
                    controllerText: _controllerEmail,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetForm(
                    title: 'Alamat Email',
                    hintText: 'Masukan email anda',
                    controllerText: _controllerEmail,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetForm(
                    title: 'Password',
                    hintText: '********',
                    controllerText: _controllerPassword,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //  NOTE: Bottom Navigation Action
                  ButtonPrimary(
                      text: 'Daftar Akun',
                      onTap: () {
                        Navigator.pushNamed(
                            context, CurrentIndexPage.rootNamed);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Sudah punya akun?  ',
                            style:
                                TextSetting.p2.copyWith(color: Colors.white)),
                        TextSpan(
                          text: 'Masuk',
                          style: TextSetting.p2.copyWith(
                              color: ColorApp.colorPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  LoginPage.rootNamed, (route) => false);
                            },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
