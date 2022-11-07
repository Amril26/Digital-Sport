import 'package:digital_sport/pages/auth/login_page.dart';
import 'package:digital_sport/pages/auth/register_page.dart';
import 'package:digital_sport/pages/current_index_pages.dart';
import 'package:digital_sport/pages/dashboard/search_page.dart';
import 'package:digital_sport/pages/favorite/favorite_page.dart';
import 'package:digital_sport/pages/splash_page.dart';
import 'package:digital_sport/pages/ticket/ticket_page.dart';
import 'package:digital_sport/pages/wrapper_pages.dart';
import 'package:digital_sport/providers/auth_provider/auth_providers.dart';
import 'package:digital_sport/providers/get/data_events_providers.dart';
import 'package:digital_sport/providers/get/data_favorite_providers.dart';
import 'package:digital_sport/providers/get/data_myproduct_provider.dart';
import 'package:digital_sport/providers/get/data_myticket_provider.dart';
import 'package:digital_sport/providers/get/match_providers.dart';
import 'package:digital_sport/providers/post/buy_product_provider.dart';
import 'package:digital_sport/providers/post/buy_ticket_provider.dart';
import 'package:digital_sport/providers/post/setun_favotire_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/get/data_products_provider.dart';
import 'providers/get/data_user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider>[
        ChangeNotifierProvider<AuthProvider>(
            create: ((context) => AuthProvider())),
        ChangeNotifierProvider<ProductProviders>(
            create: ((context) => ProductProviders())),
        ChangeNotifierProvider<EventsProvider>(
            create: ((context) => EventsProvider())),
        ChangeNotifierProvider<DataUserProvider>(
            create: ((context) => DataUserProvider())),
        ChangeNotifierProvider<BuyProductProvider>(
            create: ((context) => BuyProductProvider())),
        ChangeNotifierProvider<BuyTicketProvider>(
            create: ((context) => BuyTicketProvider())),
        ChangeNotifierProvider<DataMyTicketProviders>(
            create: ((context) => DataMyTicketProviders())),
        ChangeNotifierProvider<DataMyProdukProviders>(
            create: ((context) => DataMyProdukProviders())),
        ChangeNotifierProvider<SetUnSetFavoriteProviders>(
            create: ((context) => SetUnSetFavoriteProviders())),
        ChangeNotifierProvider<DataFavoriteProvider>(
            create: ((context) => DataFavoriteProvider())),
        ChangeNotifierProvider<MatchProvider>(
            create: ((context) => MatchProvider())),
      ],
      builder: (context, child) {
        return StreamProvider.value(
            value: context.read<AuthProvider>().userStreamChange,
            initialData: null,
            child: MaterialApp(
              title: 'Digital Sport',
              debugShowCheckedModeBanner: false,
              initialRoute: SplashPage.rootNamed,
              routes: {
                SplashPage.rootNamed: (context) => const SplashPage(),
                LoginPage.rootNamed: (context) => LoginPage(),
                RegisterPage.rootNamed: (context) => RegisterPage(),
                CurrentIndexPage.rootNamed: (context) =>
                    const CurrentIndexPage(),
                FavoritePage.rootNamed: (context) => const FavoritePage(),
                TicketPage.rootNamed: (context) => TicketPage(),
                SearchPage.rootNamed: (context) => const SearchPage(),
                WrapperPage.rootNamed: (context) => const WrapperPage(),
              },
            ));
      },
    );
  }
}
