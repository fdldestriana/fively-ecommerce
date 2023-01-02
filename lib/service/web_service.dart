// import package
import 'dart:io';
import 'dart:convert';
import 'package:fively_ecommerce/model/category.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:http/http.dart' as http;

class WebService {
  static Future<List<Product>> getProducts() async {
    try {
      Uri url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);
      List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } on SocketException catch (e) {
      print('this is error ${e.toString()}');
      rethrow;
    }
  }

  static Future<List<Category>> getCategories() async {
    try {
      Uri url = Uri.parse('https://fakestoreapi.com/products/categories');
      var response = await http.get(url);
      List data = json.decode(response.body);
      return data.map((e) => Category(name: e)).toList();
    } on SocketException catch (e) {
      print('this is error ${e.toString()}');
      rethrow;
    }
  }
}
