// // import package
// import 'package:fively_ecommerce/model/category.dart';
// import 'package:fively_ecommerce/service/web_service.dart';
// import 'package:flutter/material.dart';

// class CategoryController with ChangeNotifier {
//   List<Category> _categories = [];
//   List<Category> get categories => _categories;

//   Future<List<Category>> getCategories() async {
//     _categories = await WebService.getCategories();
//     notifyListeners();
//     return _categories;
//   }
// }
