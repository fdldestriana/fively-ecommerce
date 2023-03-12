// import package
import 'package:fively_ecommerce/shared/utils/state.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductListController with ChangeNotifier {
  DataState _state = DataState.initial;
  DataState get state => _state;
  void _setState(DataState state) {
    _state = state;
  }

  Failure _failure = Failure(message: 'message');
  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
  }

  List<Product> _products = [];
  List<Product> get products => _products;
  Future<void> getProducts() async {
    try {
      _setState(DataState.loading);
      _products = await WebService.getProducts();
      _setState(DataState.loaded);
    } on Failure catch (f) {
      _setFailure(f);
      _setState(DataState.notLoaded);
    }
    notifyListeners();
  }
}
