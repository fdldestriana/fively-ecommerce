import 'package:fively_ecommerce/model/cart/cart.dart';
import 'package:fively_ecommerce/model/cart/product_cart.dart';
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

  Cart _cart = Cart(
      id: 0,
      userId: 0,
      total: 0,
      products: <ProductCart>[],
      totalProducts: 0,
      totalQuantity: 0);
  Future getCart({int userId = 5}) async {
    _setState(NotifierState.loading);
    try {
      _cart = await WebService.getCart(userId);
      _cartProducts =
          _cart.products.map((e) => ProductCart.fromJson(e)).toList();
      _setState(NotifierState.loaded);
    } on Failure catch (f) {
      _setFailure(f);
    }
  }

  /*
  This code below is used to get products list within the cart
  */
  List<ProductCart> _cartProducts = [];
  List<ProductCart> get cartProducts {
    // Calling _setTotalAmount for the first time calculating and displaying the _totalAmount
    _setTotalAmount();
    return _cartProducts;
  }
  // products paramater should be from Consumer<ProductListProvider>
  // void getCartProducts(List<Product> products) {
  //   int index = 0;
  //   for (var map in _cartProducts) {
  //     for (var product in products) {
  //       if (product.id == map['productId']) {
  //         _cartProducts[index].addAll({'product': product});
  //       } else {
  //         continue;
  //       }
  //     }
  //     index++;
  //   }

  //   _setTotalAmount();
  //   _setState(NotifierState.loaded);
  //   notifyListeners();
  // }

  /*
  This code below is used to get totalAmount price of products within the cart
  */
  num _totalAmount = 0;
  num get totalAmount => _totalAmount;
  void _setTotalAmount() {
    /*
    Set _totalAmount to 0, to ensure everytime the _setTotalAmount is called
    the _totalAmount not go with the higher/undesired amount
    */
    _totalAmount = 0;
    for (var product in _cartProducts) {
      _totalAmount = _totalAmount + (product.quantity * product.price);
    }
  }

  /*
  The code below is used to add and or remove product from the cart
  */
  void addToCart(Product product) {
    (_cartProducts.any((element) => element.id == product.id))
        ? addQuantity(product.id)
        : _cart.products.add(ProductCart.fromJson({
            'id': product.id,
            'title': product.title,
            'price': product.price,
            'quantity': 1,
            'total': product.price * 1,
            'discountPercentage': 0,
            'discountedPrice': 0
          }));
    _setTotalAmount();
  }

  void removeFromCart(Product product) {
    int index = _cartProducts.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      _cartProducts.removeAt(index);
    }
    // Calling _setTotalAmount to reset the _totalAmount every removing a product from cart
    _setTotalAmount();
    notifyListeners();
  }

  /*
  This code below is used to get quantity of a particular product within the cart
  */
  void addQuantity(int productId) {
    int index = _cartProducts.indexWhere((element) => element.id == productId);
    _cartProducts[index].quantity++;
    // Calling _setTotalAmount to reset the _totalAmount every adding the quantity
    _setTotalAmount();
    notifyListeners();
  }

  void removeQuantity(int productId) {
    int index = _cartProducts.indexWhere((element) => element.id == productId);
    _cartProducts[index].quantity--;
    // Calling _setTotalAmount to reset the _totalAmount every removing the quantity
    _setTotalAmount();
    notifyListeners();
  }
}
