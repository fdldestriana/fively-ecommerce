// import package
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/cart.dart';
import 'package:fively_ecommerce/model/category.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/model/user.dart';

class WebService {
  static Future<Map<String, dynamic>> signUp(
      String username, String email, String password) async {
    Map<String, dynamic> result;
    Uri url = Uri.parse('https://dummyjson.com/users/add');
    Map<String, String> data = {
      'username': username,
      'email': email,
      'password': password
    };
    try {
      var response = await http.post(url,
          body: json.encode(data),
          headers: <String, String>{'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        User user = User.fromJson(json.decode(response.body));
        result = {
          'status': true,
          'message': 'Successfully registered',
          'data': user
        };
      } else {
        result = {
          'status': false,
          'message': 'Registration failed',
          'data': json.decode(response.body)
        };
      }
    } on SocketException {
      result = {
        'status': false,
        'message': 'Unsuccessful request',
        'data': Failure(
            message:
                'There is not internet connection.\n Please check your data roaming')
      };
    }
    return result;
  }

  static Future login(
      {String username = 'kminchelle', String password = '0lelplR'}) async {
    Uri url = Uri.parse('https://dummyjson.com/auth/login');
    try {
      var response = await http.post(url,
          body: json.encode(
              <String, String>{'username': username, 'password': password}),
          headers: <String, String>{'Content-Type': 'application/json'});
      // print(response.body);
      User user = User.fromJson(json.decode(response.body));
      // print('this is token of the current user : ${user.token}');
      return user;
    } on SocketException {
      throw Failure(
          message:
              'There is no internet connection.\n Please check your data roaming');
    }
  }

  static Future getProducts() async {
    Uri url = Uri.parse('https://dummyjson.com/products');
    try {
      var response = await http.get(url);
      List data = json.decode(response.body)['products'];
      return data.map((e) => Product.fromJson(e)).toList();
    } on SocketException {
      throw Failure(
          message:
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
          message:
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
          message:
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
          message:
              'There is no internet connection.\n Please check your data roaming');
    }
  }
}
