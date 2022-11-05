import 'package:digital_sport/create_db_fb/cuser_dbf.dart';
import 'package:digital_sport/helpers/snack_bar_custom.dart';
import 'package:digital_sport/pages/wrapper_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoadingsignIn = false;
  bool get isLoadingsignIn => _isLoadingsignIn;

  bool _isLoadingRegister = false;
  bool get isLoadingRegister => _isLoadingRegister;

  Future login(BuildContext context,
      {required String email, required String password}) async {
    _isLoadingsignIn = true;
    try {
      _isLoadingsignIn = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _isLoadingsignIn = false;
    } on FirebaseAuthException catch (e) {
      _isLoadingsignIn = false;
      if (e.message!.toLowerCase() ==
          'The password is invalid or the user does not have a password.'
              .toLowerCase()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget.snackBarNotSucces(
                message: 'Gagal Login, Password Yang anda masukan salah!'));
      } else if (e.message!.toLowerCase() ==
          'There is no user record corresponding to this identifier. The user may have been deleted.'
              .toLowerCase()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget.snackBarNotSucces(
                message: 'Gagal Login, Email Yang anda masukan salah!'));
      } else if (e.message!.toLowerCase() ==
          'The email address is badly formatted.'.toString()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget.snackBarNotSucces(
                message: 'Periksa format email anda'));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBarWidget.snackBarNotSucces(
            message:
                'Gagal login, Kesalahan email atau password tidak terdaftar!'));
      }
    }
    _isLoadingsignIn = false;
    notifyListeners();
  }

  Future register(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    try {
      _isLoadingRegister = true;
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      CUserDBFProvider.createUserDB(
          name: name,
          email: email,
          password: password,
          idUser: _auth.currentUser!.uid);
      Navigator.of(context).pushNamed(WrapperPage.rootNamed);
      _isLoadingRegister = true;
    } on FirebaseAuthException catch (e) {
      _isLoadingRegister = false;
      if (e.message.toString().toLowerCase() ==
          'The email address is already in use by another account.'
              .toLowerCase()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget.snackBarNotSucces(
                message: 'Email sudah digunakan, isi form degan data berbeda'));
      } else if (e.message.toString().toLowerCase() ==
          'The email address is badly formatted.'.toLowerCase()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget.snackBarNotSucces(
                message: 'Periksa format email anda'));
      }
    }
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    await _auth.signOut();
  }

  Stream<User?> get userStreamChange => _auth.authStateChanges();
}
