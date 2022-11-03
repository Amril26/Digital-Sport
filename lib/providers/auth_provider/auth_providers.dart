import 'package:digital_sport/helpers/snack_bar_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoadingsignIn = false;
  bool get isLoadingsignIn => _isLoadingsignIn;

  Future login(BuildContext context,
      {required String email, required String password}) async {
    _isLoadingsignIn = true;
    try {
      print('============>  ' + _isLoadingsignIn.toString());
      await _auth.signInWithEmailAndPassword(
          email: 'user2@gmail.com', password: '123456');
      // print(response.user!.email);
      // print(response.user!.displayName);
      // print(await response.user!.getIdToken());
      _isLoadingsignIn = false;
      print('============>  ' + _isLoadingsignIn.toString());
      // return response;
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
                message: 'Periksa formated email anda'));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBarWidget.snackBarNotSucces(
            message:
                'Gagal login, Kesalahan email atau password tidak terdaftar!'));
      }
    }
    notifyListeners();
  }

  Future register({required String email, required String password}) async {}

  Future<void> logOut(BuildContext context) async {
    await _auth.signOut();
  }

  Stream<User?> get userStreamChange => _auth.authStateChanges();
}
