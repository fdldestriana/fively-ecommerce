// import package
import 'package:fively_ecommerce/shared/utils/notifier_state.dart';
import 'package:flutter/material.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/service/web_service.dart';

class ProductListController with ChangeNotifier {
  NotifierState _state = NotifierState.loading;
  NotifierState get state => _state;

  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Failure _failure = Failure('message');

  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> getProducts() async {
    try {
      _products = await WebService.getProducts();
      notifyListeners();
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }
}
