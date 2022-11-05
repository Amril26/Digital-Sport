import 'package:cloud_firestore/cloud_firestore.dart';

/// class ini berfungsi untuk membuat storeage pada Firebase dengan collection USer untuk menyimpan data User
class CUserDBFProvider {
  static Future createUserDB({
    required String idUser,
    required String name,
    required String email,
    required String password,
  }) async {
    final CollectionReference instFireStore =
        FirebaseFirestore.instance.collection('users_dumy');
    final Map<String, dynamic> cdataUser = <String, dynamic>{
      'id': idUser,
      'name': name,
      'email': email,
      'password': password,
      'my_product': [],
      'my_ticket': [],
      'status_anggota': 'active'
    };
    await instFireStore.add(cdataUser);
  }
}
