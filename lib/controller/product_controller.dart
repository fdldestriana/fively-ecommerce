// import package
import 'dart:convert';
import 'package:fively_ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductController with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;

  void getProducts() async {
    Uri url =
        Uri.parse('https://api.escuelajs.co/api/v1/categories/2/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      _products = data.map((e) => Product.fromJson(e)).toList();
      notifyListeners();
    } else {
      throw Exception(
          'Request failed with the status code ${response.statusCode}');
    }
  }
}
