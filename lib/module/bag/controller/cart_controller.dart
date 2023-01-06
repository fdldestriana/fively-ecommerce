import 'package:fively_ecommerce/model/cart/cart.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:flutter/material.dart';

enum NotifierState { initial, loading, loaded }

class CartController with ChangeNotifier {
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

  /////////////////////////////////////////////////////////////////

  Cart _cart = Cart(id: 0, userId: 0, date: '', products: []);

  int _cartId = 0;
  int get cartId => _cartId;
  void setCartId() {
    _cartId = _cart.id;
  }

  int _totalQuantity = 0;
  int get totalQuantity => _totalQuantity;
  void setCounter() {
    for (int index = 0; _cart.products.length; index++) {
      _totalQuantity + _cart.products[index]['quantity'];
    }
  }

  num _totalAmount = 0;
  num get totalAmount => _totalAmount;

  Map<Product, int> cartProducts = {};

  Future getCart({int userId = 1}) async {
    try {
      _cart = await WebService.getCart(userId);
      notifyListeners();
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }
}
