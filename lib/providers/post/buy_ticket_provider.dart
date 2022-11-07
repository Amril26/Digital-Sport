import 'dart:math';

import 'package:digital_sport/create_db_fb/buy_product_db.dart';
import 'package:digital_sport/create_db_fb/buy_ticket_db.dart';
import 'package:digital_sport/helpers/snack_bar_custom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BuyTicketProvider extends ChangeNotifier {
  int _countTicket = 1;
  int get countTicket => _countTicket;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  bool _isLoadBuy = false;
  bool get isLoadBuy => _isLoadBuy;
  final _char =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _random = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _char.codeUnitAt(_random.nextInt(_char.length))));

  void addTicket(BuildContext context, {required int price}) {
    if (_countTicket < 2) {
      _countTicket += 1;
      _totalPrice = price * _countTicket;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBarWidget.snackBarSucces(
          message: 'Maximal 2 tiket dalam 1 pembelian event'));
    }
    notifyListeners();
  }

  void removeTicket({required int price}) {
    if (_countTicket > 1) {
      _countTicket -= 1;
      _totalPrice = price * _countTicket;
      notifyListeners();
    }
  }

  Future buyTicket(
    BuildContext context, {
    required String thumbnail,
    required String title,
    required int totalPrice,
    required String location,
    required String date,
  }) async {
    _isLoadBuy = true;
    try {
      await CBuyTicket.addProductBuy(
        countTicket: countTicket,
        totalPrice: totalPrice,
        codeTicket: getRandomString(10),
        thumbnail: thumbnail,
        title: title,
        location: location,
        date: date,
      );
    } catch (e) {
      _isLoadBuy = false;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.snackBarNotSucces(
              message: 'Periksa format email anda'));
    }
    _isLoadBuy = false;
    notifyListeners();
  }

  void restart() {
    _countTicket = 1;
    _totalPrice = 0;
  }
}
