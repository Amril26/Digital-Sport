import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DataUserProvider extends ChangeNotifier {
  final CollectionReference _collectionData =
      FirebaseFirestore.instance.collection('users_dumy');

  final FirebaseAuth user = FirebaseAuth.instance;

  Future userData() async {
    final response = await _collectionData.get();
    final message = response.docs;

    for (var item in message) {
      if (user.currentUser!.uid == item['id']) {
        _collectionData.doc(item.id).update(
          {
            'my_product': item['my_product'] +
                [
                  {'abg': 'shofi', 'age': 20, 'status': 'punya Pacar'}
                ]
          },
        );
      }
    }
  }
}
