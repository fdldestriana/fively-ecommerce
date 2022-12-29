// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductFavoriteController with ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;

  void addToWishlist(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeFromWishlist(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
