import 'package:digital_sport/helpers/color_style.dart';
import 'package:digital_sport/helpers/layout_style.dart';
import 'package:digital_sport/helpers/text_style.dart';
import 'package:digital_sport/pages/detail_product/card_history_product.dart';
import 'package:digital_sport/providers/get/data_myproduct_provider.dart';
import 'package:digital_sport/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryTransactionPage extends StatefulWidget {
  const HistoryTransactionPage({Key? key}) : super(key: key);

  @override
  State<HistoryTransactionPage> createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage> {
  @override
  void initState() {
    super.initState();
    context.read<DataMyProdukProviders>().getMyProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: ColorApp.txColorPrimary,
          ),
          backgroundColor: Colors.white,
          title: Text(
            'History Pembelian Produk',
            style: TextSetting.h1,
          ),
          shape: Border(
            bottom: BorderSide(color: ColorApp.txColorsecondary),
          ),
        ),
        body: Consumer<DataMyProdukProviders>(
            builder: (context, dataProducts, _) {
          if (dataProducts.isLoad == true) {
            return const WidgetLoadingIndicator(size: 30);
          } else {
            return ListView.builder(
              itemCount: dataProducts.myProduct.length,
              padding:
                  LayoutMargin.marginHorizontal20.copyWith(top: 16, bottom: 16),
              itemBuilder: (context, index) => CardHistoryProduct(
                title: dataProducts.myProduct[index]['title'],
                countProduct:
                    dataProducts.myProduct[index]['count_product'].toString(),
                price: dataProducts.myProduct[index]['price'],
                thumbnail: dataProducts.myProduct[index]['image'],
              ),
            );
          }
        }));
  }
}
