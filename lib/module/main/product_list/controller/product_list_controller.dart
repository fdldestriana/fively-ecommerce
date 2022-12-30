// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:flutter/material.dart';

class ProductListController with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  Future<List<Product>> getData() async {
    _products = await WebService.getProducts();
    notifyListeners();
    return _products;
  }
}
