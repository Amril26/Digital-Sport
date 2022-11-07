import 'package:digital_sport/create_db_fb/buy_product_db.dart';
import 'package:digital_sport/helpers/snack_bar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BuyProductProvider extends ChangeNotifier {
  int _countProduct = 1;
  int get countProduct => _countProduct;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  bool _isLoadBuy = false;
  bool get isLoadBuy => _isLoadBuy;

  void addProduct({required int price}) {
    _countProduct += 1;
    _totalPrice = price * _countProduct;
    notifyListeners();
  }

  void removeProduct({required int price}) {
    if (_countProduct > 1) {
      _countProduct -= 1;
      _totalPrice = price * _countProduct;
      notifyListeners();
    }
  }

  Future buyproduct(BuildContext context,
      {required String image,
      required String title,
      required int price}) async {
    _isLoadBuy = true;
    try {
      await CBuyProduct.addProductBuy(
        countProduct: countProduct,
        price: price,
        id: '1',
        image: image,
        size: 'xl',
        title: title,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBarWidget.snackBarSucces(
          message: 'Berhasil Membeli Produk  ${title.toUpperCase()}'));
      Navigator.pop(context);
    } catch (e) {
      _isLoadBuy = false;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.snackBarNotSucces(message: 'Gagal membeli Product'));
    }
    _isLoadBuy = false;
    notifyListeners();
  }

  void restart() {
    _countProduct = 1;
    _totalPrice = 0;
  }
}
