import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/providers/get/data_products_provider.dart';
import 'package:digital_sport/widgets/widget_button_primary.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
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
  }

  Widget _headers(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: Consumer<ProductProviders>(
                  builder: (context, dataDetialPro, _) {
                if (dataDetialPro.isLoadingDetail == true) {
                  return const WidgetLoadingIndicator(size: 30);
                } else {
                  return Image.network(
                    dataDetialPro.detailProduct.image[0],
                    height: MediaQuery.of(context).size.height * 0.33,
                    fit: BoxFit.fill,
                  );
                }
              })),
        ),
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
        )
      ],
    );
  }

  Widget _bottomNavigationBar(BuildContext context,
      {required Function() onTap}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.68,
      alignment: Alignment.center,
      padding: LayoutMargin.marginVertical20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _descriptionProduct(),
          const Spacer(),
          _counterAddEvent(),
          const SizedBox(
            height: 20,
          ),
          _bottomBuyProduct(),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _descriptionProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          'T-shirt Persebaya 1927 College - Greenasd asd asdasd ',
          style: TextSetting.h1.copyWith(
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Aksesoris',
          style: TextSetting.p2.copyWith(
            letterSpacing: 1,
            color: ColorApp.txColorsecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _priceProduct(),
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
          'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
          style: TextSetting.p1.copyWith(
            letterSpacing: 1,
            color: ColorApp.txColorPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _priceProduct() {
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
            'Rp 45.000',
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

  Widget _counterAddEvent() {
    return Row(
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'SubTotal   ',
              style: TextSetting.h2.copyWith(fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: 'Rp 0',
              style: TextSetting.h2.copyWith(
                  color: ColorApp.colorPrimary, fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
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
          '2',
          style: TextSetting.h2.copyWith(
              color: ColorApp.colorPrimary, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: () {},
          child: Image.asset(
            'assets/icons/add_item.png',
            height: 24,
            width: 24,
          ),
        )
      ],
    );
  }

  Widget _bottomBuyProduct() {
    return Row(
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
              text: 'Beli Produk'.toUpperCase(),
              onTap: () {
                // TODO buy product
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFB5DAC7),
      body: _headers(context),
      bottomNavigationBar: _bottomNavigationBar(
        context,
        onTap: () {},
      ),
    );
  }
}
