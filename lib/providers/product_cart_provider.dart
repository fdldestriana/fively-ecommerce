// import package
import 'package:fively_ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductCartProvider with ChangeNotifier {
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
