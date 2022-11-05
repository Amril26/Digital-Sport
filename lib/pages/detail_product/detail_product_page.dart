import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/providers/get/data_products_provider.dart';
import 'package:digital_sport/providers/post/buy_product_provider.dart';
import 'package:digital_sport/widgets/widget_button_primary.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailProductPage extends StatefulWidget {
  final String id;
  const DetailProductPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProviders>().getdetailProduct(id: widget.id);
    context.read<BuyProductProvider>().restart();
  }

  Widget _headers(BuildContext context) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.33,
            child: Consumer<ProductProviders>(
                builder: (context, dataDetialPro, _) {
              if (dataDetialPro.isLoadingDetail == true) {
                return const WidgetLoadingIndicator(size: 30);
              } else {
                return PageView.builder(
                  itemCount: dataDetialPro.detailProduct.image.length,
                  itemBuilder: (context, index) => Image.network(
                    dataDetialPro.detailProduct.image[index],
                    width: double.infinity,
                    fit: BoxFit.fill,
                    color: ColorApp.colorPrimary.withOpacity(0.30),
                    colorBlendMode: BlendMode.color,
                  ),
                );
              }
            })),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: ColorApp.colorPrimary,
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _descriptionProduct(),
        )
      ],
    );
  }

  Widget _descriptionProduct() {
    return Consumer<ProductProviders>(builder: (context, dataProduct, _) {
      if (dataProduct.isLoadingDetail == true) {
        return const WidgetLoadingIndicator(size: 30);
      } else {
        return Container(
          height: MediaQuery.of(context).size.height * 0.50,
          alignment: Alignment.center,
          padding: LayoutMargin.marginVertical20,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                dataProduct.detailProduct.title,
                style: TextSetting.h1.copyWith(
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                dataProduct.detailProduct.category,
                style: TextSetting.p2.copyWith(
                  letterSpacing: 1,
                  color: ColorApp.txColorsecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _priceProduct(price: dataProduct.detailProduct.price),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Description',
                style: TextSetting.p1.copyWith(
                  letterSpacing: 1,
                  color: ColorApp.txColorPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                dataProduct.detailProduct.description,
                style: TextSetting.p1.copyWith(
                  letterSpacing: 1,
                  color: ColorApp.txColorPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  Widget _priceProduct({required int price}) {
    return Container(
      padding: LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorApp.colorPrimary.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Harga Tiket',
            style: TextSetting.p1
                .copyWith(letterSpacing: 1, color: ColorApp.txColorPrimary),
          ),
          Text(
            'Rp ${NumberFormat("#,###", "ID_id").format(price)}',
            style: TextSetting.p1.copyWith(
              letterSpacing: 1,
              color: ColorApp.colorPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBuyProduct() {
    return Consumer2<BuyProductProvider, ProductProviders>(
        builder: (context, dataBuyPro, dataDetail, _) => Container(
              color: Colors.white,
              padding:
                  LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Total  ',
                            style: TextSetting.h2
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text:
                                'Rp ${dataBuyPro.countProduct == 1 ? NumberFormat("#,###", "ID_id").format(dataDetail.detailProduct.price) : NumberFormat("#,###", "ID_id").format(dataBuyPro.totalPrice)}',
                            style: TextSetting.h2.copyWith(
                                color: ColorApp.colorPrimary,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => context
                            .read<BuyProductProvider>()
                            .removeProduct(
                                price: dataDetail.detailProduct.price),
                        child: Image.asset(
                          'assets/icons/remove_item.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        dataBuyPro.countProduct.toString(),
                        style: TextSetting.h2.copyWith(
                            color: ColorApp.colorPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () => context
                            .read<BuyProductProvider>()
                            .addProduct(price: dataDetail.detailProduct.price),
                        child: Image.asset(
                          'assets/icons/add_item.png',
                          height: 24,
                          width: 24,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: ColorApp.colorPrimary),
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: ColorApp.colorPrimary,
                              size: 24,
                            ),
                          )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ButtonPrimary(
                          text: dataBuyPro.isLoadBuy == false
                              ? 'Beli Produk'.toUpperCase()
                              : 'Loading....',
                          onTap: () => dataBuyPro.isLoadBuy == false
                              ? context.read<BuyProductProvider>().buyproduct(
                                    context,
                                    image: dataDetail.detailProduct.image[0],
                                    title: dataDetail.detailProduct.title,
                                    price: dataBuyPro.countProduct == 1
                                        ? dataDetail.detailProduct.price
                                        : dataBuyPro.totalPrice,
                                  )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFB5DAC7),
        body: _headers(context),
        bottomNavigationBar: _bottomBuyProduct());
  }
}
