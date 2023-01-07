// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductCartController with ChangeNotifier {
  // final int _counter = 0;

  final num _totalAmount = 0;
  num get totalAMount => _totalAmount;

  final List<Product> _products = [];
  List<Product> get products => _products;

  void addToCart(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
