import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/detail_product/detail_product_page.dart';
import 'package:digital_sport/providers/get/data_favorite_providers.dart';
import 'package:digital_sport/widgets/widget_card_horizontal.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  static String rootNamed = 'favorite/';
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    context.read<DataFavoriteProvider>().getDataFavotire(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          iconTheme: IconThemeData(
            color: ColorApp.txColorPrimary,
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Favorite Jersey',
            style: TextSetting.h1,
          ),
        ),
        body:
            Consumer<DataFavoriteProvider>(builder: (context, dataFavorite, _) {
          if (dataFavorite.isLoad == true) {
            return const WidgetLoadingIndicator(size: 30);
          } else {
            return ListView.builder(
              padding: LayoutMargin.marginHorizontal20,
              itemCount: dataFavorite.myFavorite.length,
              itemBuilder: (context, index) => WidgetCardHorizontal(
                image: dataFavorite.myFavorite[index]['image'],
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailProductPage(
                              id: dataFavorite.myFavorite[index]['id'])));
                },
                title: dataFavorite.myFavorite[index]['title'],
                categoryName: '',
                price: dataFavorite.myFavorite[index]['price'],
              ),
            );
          }
        }));
  }
}
