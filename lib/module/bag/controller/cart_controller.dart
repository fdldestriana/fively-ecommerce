import 'package:fively_ecommerce/model/cart/cart.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/shared/utils/notifier_state.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  /*
  This code below is to get the state
   */
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

  /*
  This code below is to get the cart data and products within the cart
   */

  Cart _cart = Cart(id: 0, userId: 0, date: '', products: <Map>[]);
  Future getCart({int userId = 1}) async {
    try {
      _cart = await WebService.getCart(userId);
      _cartProducts = _cart.products;
    } on Failure catch (f) {
      _setFailure(f);
    }
  }

  List<dynamic> _cartProducts = [];
  List<dynamic> get cartProducts => _cartProducts;
  // products paramater should be from Consumer<ProductListProvider>
  void getCartProducts(List<Product> products) {
    int index = 0;
    for (var map in _cartProducts) {
      for (var product in products) {
        if (product.id == map['productId']) {
          // the code below is potentially causing the Unhandle Exception:
          // type Null is not a subtype of type List<dynamic>
          // so we check the value, and if value is null we assign an empty list to _cartProducts
          _cartProducts[index].addAll({'product': product});
          // _cartProducts.add(product);
        } else {
          continue;
        }
      }
      index++;
    }
    _setState(NotifierState.loaded);
    notifyListeners();
  }

  void addToCart(Product product) {
    if (_cartProducts.contains(product)) {
    } else {
      _cartProducts.add(product);
    }

    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartProducts.remove(product);
    notifyListeners();
  }
}
