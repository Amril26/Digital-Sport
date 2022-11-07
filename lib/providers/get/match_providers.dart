import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/helpers/url.dart';
import 'package:flutter/foundation.dart';

class MatchProvider extends ChangeNotifier {
  final CollectionReference _collectionData =
      FirebaseFirestore.instance.collection(PathUrl.pathmatch);
  List _dataMatch = [];
  List get dataMatch => _dataMatch;

  bool _isLoad = true;
  bool get isLoad => _isLoad;

  Future getDataMathc() async {
    _dataMatch = [];
    _isLoad = true;
    try {
      _isLoad = true;
      final response = await _collectionData.get();
      final message = response.docs;
      for (var item in message) {
        print(item['1']);
        _dataMatch.add(item['1']);
      }
      _isLoad = false;
    } catch (e) {
      _isLoad = false;
      _dataMatch = [];
      print('error Data');
    }
    notifyListeners();
  }
}
