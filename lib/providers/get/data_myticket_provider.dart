import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/helpers/snack_bar_custom.dart';
import 'package:digital_sport/helpers/url.dart';
import 'package:digital_sport/models/profil_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataMyTicketProviders extends ChangeNotifier {
  final CollectionReference _collectionData =
      FirebaseFirestore.instance.collection(PathUrl.pathUser);

  final FirebaseAuth user = FirebaseAuth.instance;

  List _myTicket = [];
  List get myTicket => _myTicket;

  bool _isLoad = true;
  bool get isLoad => _isLoad;

  Future getMyTicket(BuildContext context) async {
    try {
      _myTicket = [];
      _isLoad = true;
      final response = await _collectionData.get();
      final message = response.docs;
      for (var item in message) {
        if (user.currentUser!.uid == item['id']) {
          _myTicket = item['my_ticket'];
        }
      }
      print(_myTicket);
      _isLoad = false;
    } catch (e) {
      _isLoad = false;
      _myTicket = [];
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.snackBarNotSucces(message: 'Gagal mengambil data'));
    }
    notifyListeners();
  }
}
