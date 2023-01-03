// import package
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:flutter/material.dart';

enum NotifierState { initial, loading, loaded }

class ProductListController with ChangeNotifier {
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  List<Product> _products = [];
  List<Product> get products => _products;

  Failure _failure = Failure('message');
  Failure get failure => _failure;
  void setFailure(Failure failure) {
    failure;
    notifyListeners();
  }

  Future<void> getProducts() async {
    _setState(NotifierState.loading);
    try {
      _products = await WebService.getProducts();
      notifyListeners();
    } on Failure catch (f) {
      setFailure(f);
    }
    _setState(NotifierState.loaded);
  }
}
