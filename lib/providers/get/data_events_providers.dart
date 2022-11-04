import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/models/events_model.dart';
import 'package:flutter/foundation.dart';

class EventsProvider extends ChangeNotifier {
  final CollectionReference _collectionData =
      FirebaseFirestore.instance.collection('event_ticket');
  List<EventModel> _dataEvent = [];
  List<EventModel> get dataEvent => _dataEvent;

  EventModel _datadetail = EventModel.fromJson({"": ""});
  EventModel get dataDetail => _datadetail;

  bool _isLoadEvent = true;
  bool get isLoadEvent => _isLoadEvent;

  bool _isLoadDetail = true;
  bool get isLoadDetail => _isLoadDetail;

  Future getdataEvent() async {
    _dataEvent = [];
    _isLoadEvent = true;
    try {
      _isLoadEvent = true;
      final response = await _collectionData.get();
      final message = response.docs[0].get('events');
      for (var item in message) {
        _dataEvent.add(EventModel.fromJson(item));
      }
      _isLoadEvent = false;
    } catch (e) {
      _isLoadEvent = false;
      _dataEvent = [];
      print('error Data');
    }
    notifyListeners();
  }

  Future detailEvent({required String id}) async {
    _datadetail = EventModel.fromJson({"": ""});
    try {
      _isLoadDetail = true;
      final response = await _collectionData.get();
      final message = response.docs[0].get('events');
      for (var item in message) {
        if (item['id'] == id) {
          _datadetail = EventModel.fromJson(item);
        }
      }
      _isLoadDetail = false;
    } catch (e) {
      _isLoadDetail = false;
      _datadetail = EventModel.fromJson({"": ""});
      print('error Data');
    }
    notifyListeners();
  }
}
