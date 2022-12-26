// import package
import 'package:fively_ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductCartProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
        id: 11,
        title: "Tasty Soft Table",
        price: 924,
        category: "Electronics",
        description:
            "The Football Is Good For Training And Recreational Purposes",
        images: "https://api.lorem.space/image/watch?w=640&h=480&r=5845")
  ];
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
