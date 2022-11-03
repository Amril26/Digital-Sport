import 'package:digital_sport/pages/auth/login_page.dart';
import 'package:digital_sport/pages/current_index_pages.dart';
import 'package:digital_sport/providers/auth_provider/auth_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class WrapperPage extends StatelessWidget {
  static String rootNamed = 'wrapper/';
  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? fireBase = Provider.of<User?>(context);

    return fireBase != null ? const CurrentIndexPage() : LoginPage();
  }
}
