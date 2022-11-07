import 'dart:math';

import 'package:digital_sport/create_db_fb/favorite_product_db.dart';
import 'package:digital_sport/helpers/snack_bar_custom.dart';
import 'package:flutter/material.dart';

class SetUnSetFavoriteProviders extends ChangeNotifier {
  bool _isLoad = true;
  bool get isLoad => _isLoad;

  Future setUnSetFavorite(
    BuildContext context, {
    required String image,
    required String title,
    required String id,
    required int price,
  }) async {
    try {
      _isLoad = true;
      await CFavorite.addProductBuy(
        price: price,
        id: id,
        image: image,
        title: title,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBarWidget.snackBarSucces(
          message: 'Berhasil Menambahkan Favorite ${title.toUpperCase()}'));
      _isLoad = false;
    } catch (e) {
      _isLoad = false;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.snackBarNotSucces(
              message: 'Gagal Menambahkan Favorite'));
    }
    notifyListeners();
  }
}
