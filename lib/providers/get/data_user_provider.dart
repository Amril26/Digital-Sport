import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/helpers/snack_bar_custom.dart';
import 'package:digital_sport/helpers/url.dart';
import 'package:digital_sport/models/profil_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataUserProvider extends ChangeNotifier {
  final CollectionReference _collectionData =
      FirebaseFirestore.instance.collection(PathUrl.pathUser);

  final FirebaseAuth user = FirebaseAuth.instance;

  ProfileModel _dataProfile = ProfileModel.fromJson({'': ''});
  ProfileModel get dataProfile => _dataProfile;

  bool _isLoad = true;
  bool get isLoad => _isLoad;

  Future userData(BuildContext context) async {
    try {
      _isLoad = true;
      final response = await _collectionData.get();
      final message = response.docs;
      for (var item in message) {
        if (user.currentUser!.uid == item['id']) {
          print(item['status_anggota']);
          _dataProfile = ProfileModel.fromJson({
            'id': item['id'],
            'email': item['email'],
            'name': item['name'],
            'status_anggota': item['status_anggota'],
          });
        }
      }
      _isLoad = false;
    } catch (e) {
      _isLoad = false;
      _dataProfile = ProfileModel.fromJson({'': ''});
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBarWidget.snackBarNotSucces(message: 'Gagal mengambil data'));
    }
    notifyListeners();
  }
}
