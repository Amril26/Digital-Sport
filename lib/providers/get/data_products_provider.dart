import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sport/helpers/url.dart';
import 'package:digital_sport/models/products_model.dart';
import 'package:flutter/foundation.dart';

class ProductProviders extends ChangeNotifier {
  final CollectionReference _collectionData =
      FirebaseFirestore.instance.collection(PathUrl.pathProduct);

  ProductModel _detailProduct = ProductModel.fromJson({'': ''});
  ProductModel get detailProduct => _detailProduct;

  List<ProductModel> _dataProducts = [];
  List<ProductModel> get dataProducts => _dataProducts;

  List<ProductModel> _productCategory = [];
  List<ProductModel> get productCategory => _productCategory;

  bool _isLoadingCate = true;
  bool get isLoadingCate => _isLoadingCate;
  bool _isLoadingDetail = true;
  bool get isLoadingDetail => _isLoadingDetail;

  Future getDataProduct() async {
    _dataProducts = [];
    try {
      final response = await _collectionData.get();
      final message = response.docs[0].get('product_all');
      for (var item in message) {
        _dataProducts.add(ProductModel.fromJson(item));
      }
    } catch (e) {
      _dataProducts = [];
      print('error Data');
    }
    notifyListeners();
  }

  Future dataByCategory({required String category}) async {
    _productCategory = [];
    _isLoadingCate = true;
    try {
      final response = await _collectionData.get();
      final message = response.docs[0].get('product_all');
      for (var item in message) {
        if (item['category'].toString().toLowerCase() ==
            category.toLowerCase()) {
          _productCategory.add(ProductModel.fromJson(item));
        }
      }
      _isLoadingCate = false;
    } catch (e) {
      _productCategory = [];
      _isLoadingCate = false;
      print('error Data');
    }
    notifyListeners();
  }

  Future getdetailProduct({required String id}) async {
    try {
      _isLoadingDetail = true;

      _detailProduct = ProductModel.fromJson({'': ''});
      final response = await _collectionData.get();
      final message = response.docs[0].get('product_all');
      for (var item in message) {
        if (item['id'].toString() == id) {
          _detailProduct = ProductModel.fromJson(item);
        }
      }
      _isLoadingDetail = false;
    } catch (e) {
      _isLoadingDetail = false;
      _detailProduct = ProductModel.fromJson({'': ''});
      print('error get detail data $e ');
    }
    notifyListeners();
  }
}
