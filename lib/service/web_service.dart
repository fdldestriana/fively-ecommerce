import 'dart:convert';
import 'package:fively_ecommerce/model/category.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:http/http.dart' as http;

class WebService {
  static Future<List<Product>> getProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception(
          'Request failed with the status code ${response.statusCode}');
    }
  }

  static Future<List<Category>> getCategories() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products/categories');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Category(name: e)).toList();
    } else {
      throw Exception(
          'Request failed with the status code ${response.statusCode}');
    }
  }
}
