// import package
import 'dart:io';
import 'dart:convert';
import 'package:fively_ecommerce/model/category.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:http/http.dart' as http;

class WebService {
  static Future getProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    try {
      var response = await http.get(url);
      List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } on SocketException catch (e) {
      throw Failure(
          'There is no internet connection. Please check your data, $e');
    }
  }

  static Future<List<Category>> getCategories() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products/categories');
    try {
      var response = await http.get(url);
      List data = json.decode(response.body);
      return data.map((e) => Category(name: e)).toList();
    } on SocketException catch (e) {
      throw Failure(
          'There is no internet connection. Please check your data, $e');
    }
  }
}
