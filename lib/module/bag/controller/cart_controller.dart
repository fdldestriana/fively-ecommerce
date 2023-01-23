import 'package:fively_ecommerce/model/cart.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/shared/utils/notifier_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      products: <Product>[],
      totalProducts: 0,
      totalQuantity: 0);
  Future getCart({int userId = 5}) async {
    _setState(NotifierState.loading);
    try {
      _cart = await WebService.getCart(userId);
      _cartProducts = _cart.products.map((e) => Product.fromJson(e)).toList();
      _setState(NotifierState.loaded);
    } on Failure catch (f) {
      _setFailure(f);
    }
  }

  /*
  This code below is used to get products list within the cart
  */
  List<Product> _cartProducts = [];
  List<Product> get cartProducts {
    // Calling _setTotalAmount for the first time calculating and displaying the _totalAmount
    _setTotalAmount();
    return _cartProducts;
  }

  /*
  This code below is to get image of a product from productListController,
  because the cart endpoint doesn't providing list of products with the image urls
  productListController variable should be an object from ProductListProvider.
  */
  void getProductImage(BuildContext context) {
    List<Product> productListController =
        Provider.of<ProductListController>(context, listen: false).products;
    for (var productCart in _cartProducts) {
      for (var product in productListController) {
        if (productCart.id == product.id) {
          productCart.images = product.images;
        } else {
          continue;
        }
      }
    }
    notifyListeners();
  }

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
      _totalAmount = _totalAmount + (product.quantity! * product.price);
    }
  }

  /*
  The code below is used to add and or remove product from the cart
  */
  void addToCart(Product product) {
    (_cartProducts.any((element) => element.id == product.id))
        ? addQuantity(product.id)
        : _cartProducts.add(Product(
            id: product.id,
            title: product.title,
            images: product.images,
            price: product.price,
            quantity: 1,
            total: product.price * 1,
            discountPercentage: 0,
            discountedPrice: 0,
            brand: product.brand,
            category: product.category,
            description: product.description,
            rating: product.rating));
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
    _cartProducts[index].quantity = _cartProducts[index].quantity! + 1;
    // Calling _setTotalAmount to reset the _totalAmount every adding the quantity
    _setTotalAmount();
    notifyListeners();
  }

  void removeQuantity(int productId) {
    int index = _cartProducts.indexWhere((element) => element.id == productId);
    _cartProducts[index].quantity = _cartProducts[index].quantity! - 1;
    // Calling _setTotalAmount to reset the _totalAmount every removing the quantity
    _setTotalAmount();
    notifyListeners();
  }
}
