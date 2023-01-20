// import package
import 'dart:io';
import 'dart:convert';
import 'package:fively_ecommerce/model/cart/cart.dart';
import 'package:fively_ecommerce/model/category.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:http/http.dart' as http;

class WebService {
  static Future getProducts() async {
    Uri url = Uri.parse('https://dummyjson.com/products');
    try {
      var response = await http.get(url);
      List data = json.decode(response.body)['products'];
      return data.map((e) => Product.fromJson(e)).toList();
    } on SocketException {
      throw Failure(
          'There is no internet connection.\n Please check your data roaming');
    }
  }

  static Future getProduct(int productId) async {
    Uri url = Uri.parse('https://dummyjson.com/products/$productId');
    try {
      var response = await http.get(url);
      Product product = Product.fromJson(json.decode(response.body));
      return product;
    } on SocketException {
      throw Failure(
          'There is no internet connection.\n Please check your data roaming');
    }
  }

  static Future getCategories() async {
    Uri url = Uri.parse('https://dummyjson.com/products/categories');
    try {
      var response = await http.get(url);
      List categories = json.decode(response.body);
      return categories.map((e) => Category(name: e)).toList();
    } on SocketException {
      throw Failure(
          'There is no internet connection.\n Please check your data roaming');
    }
  }

  static Future getCart(int userId) async {
    Uri url = Uri.parse('https://dummyjson.com/carts/user/$userId');
    try {
      var respone = await http.get(url);
      Cart data = Cart.fromJson(json.decode(respone.body)['carts']);
      return data;
    } on SocketException {
      throw Failure(
          'There is no internet connection.\n Please check your data roaming');
    }
  }
}
