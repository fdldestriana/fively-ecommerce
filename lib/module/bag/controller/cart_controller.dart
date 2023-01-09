import 'package:fively_ecommerce/model/cart/cart.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/shared/utils/notifier_state.dart';
import 'package:flutter/material.dart';

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
  /// This code is to get the cart data and products within the cart

  Cart _cart = Cart(id: 0, userId: 0, date: '', products: []);
  Future getCart({int userId = 1}) async {
    try {
      _cart = await WebService.getCart(userId);
      notifyListeners();
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }

  final List<Product> _cartProducts = [];
  List<Product> get cartProducts => _cartProducts;

  // products paramater should be from Consumer<ProductListProvider>
  void getCartProducts(List<Product> products) {
    for (var product in _cart.products) {
      for (var item in products) {
        if (item.id == product['productId']) {
          _cartProducts.add(item);
          _setState(NotifierState.loaded);
          notifyListeners();
        } else {
          continue;
        }
      }
    }
  }

  void addToCart(Product product) {
    _cartProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartProducts.remove(product);
    notifyListeners();
  }
}
