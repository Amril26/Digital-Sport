import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/providers/get/data_products_provider.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailCategoryPage extends StatefulWidget {
  final String category;
  const DetailCategoryPage({Key? key, required this.category})
      : super(key: key);

  @override
  State<DetailCategoryPage> createState() => _DetailCategoryPageState();
}

class _DetailCategoryPageState extends State<DetailCategoryPage> {
  @override
  void initState() {
    super.initState();

    context.read<ProductProviders>().dataByCategory(category: widget.category);
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
        body: ListView(
          padding: LayoutMargin.marginHorizontal20,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: ColorApp.colorPrimary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: ColorApp.colorPrimary.withOpacity(0.6),
                    ),
                    hintText: 'Cari daftar ${widget.category}',
                    hintStyle: TextSetting.p2.copyWith(
                        color: ColorApp.colorPrimary.withOpacity(0.6),
                        fontWeight: FontWeight.w300),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer<ProductProviders>(builder: (context, proByCategory, _) {
              if (proByCategory.isLoadingCate == true) {
                return const WidgetLoadingIndicator(size: 30);
              } else {
                // GridView.count(
                //   crossAxisCount: 2,
                // );
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: proByCategory.productCategory.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                            proByCategory.productCategory[index].image[0],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            proByCategory.productCategory[index].title,
                            maxLines: 2,
                            style: TextSetting.p2.copyWith(
                              color: ColorApp.txColorsecondary,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rp ${NumberFormat("#,###", "ID_id").format(proByCategory.productCategory[index].price)}',
                            maxLines: 1,
                            style: TextSetting.d1.copyWith(
                              letterSpacing: 1.5,
                              color: ColorApp.colorPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                    // Image.network(
                    //   proByCategory.productCategory[index].image[0],
                    //   fit: BoxFit.fill,
                    //   color: ColorApp.colorPrimary.withOpacity(0.30),
                    //   colorBlendMode: BlendMode.color,
                    // );
                  },
                );
              }
            })
          ],
        ));
  }
}
