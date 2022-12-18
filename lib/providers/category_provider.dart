// import package
import 'dart:convert';
import 'package:fively_ecommerce/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  void getCategories() async {
    Uri url = Uri.parse('https://api.escuelajs.co/api/v1/categories');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      _categories = data.map((e) => Category.fromJson(e)).toList();
      notifyListeners();
    } else {
      throw Exception(
          'Request failed with the status code ${response.statusCode}');
    }
  }
}
