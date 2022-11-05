import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/helpers/url.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CBuyProduct {
  static Future addProductBuy({
    required int countProduct,
    required int price,
    required String id,
    required String image,
    required String size,
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
            'my_product': item['my_product'] +
                [
                  {
                    'count_product': countProduct,
                    'id': id,
                    'image': image,
                    'price': price,
                    'size': size,
                    'title': title,
                  }
                ]
          },
        );
      }
    }
  }
}
