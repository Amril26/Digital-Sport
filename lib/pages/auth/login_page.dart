import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/auth/register_page.dart';
import 'package:digital_sport/pages/auth/widgets/widget_form.dart';
import 'package:digital_sport/pages/auth/widgets/widget_headers.dart';
import 'package:digital_sport/providers/auth_provider/auth_providers.dart';
import 'package:digital_sport/widgets/widget_button_primary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static String rootNamed = 'login/';
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail =
      TextEditingController(text: '');
  final TextEditingController _controllerPassword =
      TextEditingController(text: '');

  final GlobalKey<FormState> _keyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _keyPassword = GlobalKey<FormState>();

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
                    title1: 'Masuk',
                    title2: 'Digital Sport',
                    pathImage: 'assets/logoes/logo_persebaya.png',
                  ),
                  const Spacer(),
                  //  NOTE:form
                  WidgetForm(
                    title: 'Alamat Email',
                    hintText: 'Masukan email anda',
                    controllerText: _controllerEmail,
                    keyForm: _keyEmail,
                    obscureText: false,
                    errorText: 'Silahkan isi kolom email',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  WidgetForm(
                    title: 'Password',
                    hintText: '********',
                    controllerText: _controllerPassword,
                    errorText: 'silahkan isi kolom password',
                    obscureText: true,
                    keyForm: _keyPassword,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonPrimary(
                      text: 'Masuk Akun',
                      onTap: () {
                        _keyEmail.currentState!.validate();
                        _keyPassword.currentState!.validate();

                        if (_controllerPassword.text != '' &&
                            _controllerEmail.text != '') {
                          context.read<AuthProvider>().login(context,
                              email: _controllerEmail.text,
                              password: _controllerPassword.text);
                        }
                      }),
                  //  NOTE: Bottom Navigation Action
                  Consumer<AuthProvider>(builder: (context, authprof, child) {
                    if (authprof.isLoadingsignIn == false) {
                      return SizedBox();
                    } else {
                      return SizedBox(
                        height: 24,
                        width: 24,
                        child: CupertinoActivityIndicator(
                          color: ColorApp.colorPrimary,
                        ),
                      );
                    }
                  }),

                  const SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Belum memiliki akun?  ',
                            style:
                                TextSetting.p2.copyWith(color: Colors.white)),
                        TextSpan(
                          text: 'Daftar',
                          style: TextSetting.p2.copyWith(
                              color: ColorApp.colorPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RegisterPage.rootNamed, (route) => false);
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
