// import package
import 'package:dartz/dartz.dart';
import 'package:fively_ecommerce/shared/utils/state.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductListController with ChangeNotifier {
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  List<Product> _products = [];
  List<Product> get products => _products;
  void _setProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  Either<Failure, List<Product>> _data = right([]);
  Either<Failure, List<Product>> get data => _data;
  void _setData(Either<Failure, List<Product>> data) {
    _data = data;
    notifyListeners();
  }

  void getProducts() async {
    _setState(NotifierState.loading);
    var products = await WebService.getProducts();
    await Task(() => WebService.getProducts())
        .attempt()
        .map((either) => either.bimap((failure) => failure as Failure,
            (products) => products as List<Product>))
        .run()
        .then(
          (value) => _setData(value),
        );
    _setProducts(products);
    _setState(NotifierState.loaded);
  }
}
