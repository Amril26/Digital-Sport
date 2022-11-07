import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/helpers/snack_bar_custom.dart';
import 'package:digital_sport/helpers/url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataMyProdukProviders extends ChangeNotifier {
  final CollectionReference _collectionData =
      FirebaseFirestore.instance.collection(PathUrl.pathUser);

  final FirebaseAuth user = FirebaseAuth.instance;

  List _myProduct = [];
  List get myProduct => _myProduct;

  bool _isLoad = true;
  bool get isLoad => _isLoad;

  Future getMyProduct(BuildContext context) async {
    try {
      _myProduct = [];
      _isLoad = true;
      final response = await _collectionData.get();
      final message = response.docs;
      for (var item in message) {
        if (user.currentUser!.uid == item['id']) {
          _myProduct = item['my_product'];
        }
      }
      _isLoad = false;
    } catch (e) {
      _isLoad = false;
      _myProduct = [];
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.snackBarNotSucces(message: 'Gagal mengambil data'));
    }
    notifyListeners();
  }
}
