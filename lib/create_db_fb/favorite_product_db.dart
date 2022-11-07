import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/helpers/url.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CFavorite {
  static Future addProductBuy({
    required int price,
    required String id,
    required String image,
    required String title,
  }) async {
    final CollectionReference collectionData =
        FirebaseFirestore.instance.collection(PathUrl.pathUser);
    final FirebaseAuth user = FirebaseAuth.instance;
    final response = await collectionData.get();
    final message = response.docs;

    for (var item in message) {
      if (user.currentUser!.uid == item['id']) {
        collectionData.doc(item.id).update(
          {
            'favorite': item['favorite'] +
                [
                  {
                    'id': id,
                    'image': image,
                    'price': price,
                    'title': title,
                  }
                ]
          },
        );
      }
    }
  }
}
