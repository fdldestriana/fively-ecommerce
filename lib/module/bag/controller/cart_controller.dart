import 'package:fively_ecommerce/model/cart/cart.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  Failure _failure = Failure('message');

  Failure get failure => _failure;
  void setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  Cart _cart = Cart(id: 0, userId: 0, date: '', products: []);
  Cart get cart => _cart;
  Future<void> getCart() async {
    try {
      _cart = await WebService.getCart(5);
      notifyListeners();
    } on Failure catch (f) {
      setFailure(f);
    }
  }

  num _totalAmount;
  int _counter = 0;
}
