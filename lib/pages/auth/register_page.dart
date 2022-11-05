import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/auth/login_page.dart';
import 'package:digital_sport/pages/auth/widgets/widget_form.dart';
import 'package:digital_sport/pages/auth/widgets/widget_headers.dart';
import 'package:digital_sport/providers/auth_provider/auth_providers.dart';
import 'package:digital_sport/widgets/widget_button_primary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  static String rootNamed = 'register/';
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final GlobalKey<FormState> _keyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _keyPassword = GlobalKey<FormState>();
  final GlobalKey<FormState> _keyName = GlobalKey<FormState>();

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
                    controllerText: _controllerName,
                    keyForm: _keyName,
                    obscureText: false,
                    errorText: 'Silahkan isi kolom email',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetForm(
                    title: 'Alamat Email',
                    hintText: 'Masukan email anda',
                    controllerText: _controllerEmail,
                    keyForm: _keyEmail,
                    obscureText: false,
                    errorText: 'Silahkan isi kolom email',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetForm(
                    title: 'Password',
                    hintText: '********',
                    controllerText: _controllerPassword,
                    keyForm: _keyPassword,
                    obscureText: true,
                    errorText: 'Silahkan isi kolom email',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //  NOTE: Bottom Navigation Action
                  ButtonPrimary(
                      text: 'Daftar Akun',
                      onTap: () {
                        _keyEmail.currentState!.validate();
                        _keyPassword.currentState!.validate();
                        _keyName.currentState!.validate();
                        if (_controllerEmail.text.isNotEmpty &&
                            _controllerPassword.text.isNotEmpty &&
                            _controllerName.text.isNotEmpty) {
                          context.read<AuthProvider>().register(context,
                              name: _controllerName.text,
                              email: _controllerEmail.text,
                              password: _controllerPassword.text);
                        }
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
