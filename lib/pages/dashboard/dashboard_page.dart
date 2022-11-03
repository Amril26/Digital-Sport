import 'package:digital_sport/core/visibility_stf.dart';
import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/dashboard/search_page.dart';
import 'package:digital_sport/pages/dashboard/widgets/card_category.dart';
import 'package:digital_sport/pages/detail_category/detail_category_page.dart';
import 'package:digital_sport/pages/detail_product/detail_product_page.dart';
import 'package:digital_sport/pages/favorite/favorite_page.dart';
import 'package:digital_sport/pages/ticket/ticket_page.dart';
import 'package:digital_sport/providers/get/data_products_provider.dart';
import 'package:digital_sport/widgets/widget_card_box.dart';
import 'package:digital_sport/widgets/widget_card_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> _itemBanner = <String>[
    'assets/banner/banner3.png',
    'assets/banner/banner1.png',
    'assets/banner/banner2.png',
    'assets/banner/banner4.png',
  ];
  @override
  void initState() {
    super.initState();
    context.read<ProductProviders>().getDataProduct();
  }

  Widget _categoryButton(BuildContext context) {
    return Padding(
      padding: LayoutMargin.marginHorizontal20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardCategory(
            onTapCategory: () {
              //TODO :navigation ke category
              Navigator.pushNamed(context, TicketPage.rootNamed);
            },
            title: 'Tiket',
            pathAssets: 'assets/icons/ticket-2.png',
            gradientColor: ColorApp.colorPrimary,
          ),
          CardCategory(
            onTapCategory: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DetailCategoryPage(
                        category: 'sepatu',
                      )));
            },
            title: 'Sepatu',
            pathAssets: 'assets/icons/sepatu.png',
            gradientColor: ColorApp.colorSecondary3,
          ),
          CardCategory(
            title: 'Baju',
            onTapCategory: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DetailCategoryPage(
                        category: 'kaos',
                      )));
            },
            pathAssets: 'assets/icons/baju.png',
            gradientColor: ColorApp.colorSecondary1,
          ),
          CardCategory(
            title: 'Aksesoris',
            onTapCategory: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DetailCategoryPage(
                        category: 'aksesoris',
                      )));
            },
            pathAssets: 'assets/icons/aksesoris.png',
            gradientColor: ColorApp.colorSecondary4,
          ),
        ],
      ),
    );
  }

  Widget _headers(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: LayoutMargin.marginHorizontal20,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SearchPage.rootNamed);
                },
                child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/search.png',
                          height: 16,
                          color: Colors.white,
                          width: 16,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Cari Jersey',
                          style: TextSetting.p2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        )
                      ],
                    )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, FavoritePage.rootNamed);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.4),
                child: Image.asset(
                  'assets/icons/Vector.png',
                  height: 18,
                  width: 18,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      backgroundColor: ColorApp.colorPrimary,
      centerTitle: true,
      pinned: true,
      titleSpacing: 1,
      title: SABT(
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, SearchPage.rootNamed);
            },
            child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/search.png',
                      height: 16,
                      color: Colors.white,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Cari Jersey',
                      style: TextSetting.p2.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    )
                  ],
                ))),
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.30,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: SizedBox(
          height: MediaQuery.of(context).size.width * 0.6,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: _itemBanner.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Image.asset(_itemBanner[index], fit: BoxFit.fill);
                },
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 10,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _itemBanner.length,
                    itemBuilder: (context, indexIndicator) => Container(
                      height: 7,
                      width: 7,
                      margin: indexIndicator == 0
                          ? const EdgeInsets.only(left: 20)
                          : const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            // indexIndicator == index
                            //     ? Colors.white
                            //     :
                            Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: _headers(context),
              ),
            ],
          ),
        ),
      ),
      actions: [
        SABT(
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, FavoritePage.rootNamed);
            },
            icon: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.4),
              child: Image.asset(
                'assets/icons/Vector.png',
                height: 18,
                width: 18,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
        return <Widget>[
          _appBar(context),
        ];
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          _categoryButton(context),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: LayoutMargin.marginHorizontal20,
            child: Text(
              'Popular Products',
              style: TextSetting.h1.copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Consumer<ProductProviders>(
              builder: (context, dataProducts, _) {
                return ListView.builder(
                  itemCount: dataProducts.dataProducts.length,
                  scrollDirection: Axis.horizontal,
                  padding: LayoutMargin.marginHorizontal20,
                  itemBuilder: (context, index) => WidgetCardBox(
                    image: dataProducts.dataProducts[index].image[0],
                    price: dataProducts.dataProducts[index].price,
                    title: dataProducts.dataProducts[index].title,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailProductPage(
                              id: dataProducts.dataProducts[index].id)));
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: LayoutMargin.marginHorizontal20,
            child: Text(
              'Produk Lainnya',
              style: TextSetting.h1.copyWith(fontSize: 20),
            ),
          ),
          Consumer<ProductProviders>(builder: (context, dataProducts, _) {
            return ListView.builder(
              itemCount: dataProducts.dataProducts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: LayoutMargin.marginHorizontal20,
              itemBuilder: (context, index) => WidgetCardHorizontal(
                categoryName: dataProducts.dataProducts[index].categoryName,
                image: dataProducts.dataProducts[index].image[0],
                price: dataProducts.dataProducts[index].price,
                title: dataProducts.dataProducts[index].title,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                          id: dataProducts.dataProducts[index].id)));
                },
              ),
            );
          })
        ],
      ),
    ));
  }
}
