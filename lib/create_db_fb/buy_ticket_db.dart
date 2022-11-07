import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/helpers/url.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CBuyTicket {
  static Future addProductBuy({
    required int countTicket,
    required int totalPrice,
    required String codeTicket,
    required String thumbnail,
    required String title,
    required String location,
    required String date,
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
            'my_ticket': item['my_ticket'] +
                [
                  {
                    'count_ticket': countTicket,
                    'total_price': totalPrice,
                    'code_ticket': codeTicket,
                    'date': date,
                    'id': '0',
                    'location': location,
                    'thumbnail': thumbnail,
                    'title': title,
                  }
                ]
          },
        );
      }
    }
  }
}
