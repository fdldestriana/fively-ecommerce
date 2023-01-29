// import package
import 'package:fively_ecommerce/module/bag/view/bag_view.dart';
import 'package:fively_ecommerce/module/favorites/view/favorites_view.dart';
import 'package:fively_ecommerce/module/main/product_list/view/product_list_view.dart';
import 'package:fively_ecommerce/module/profile/view/profile_view.dart';
import 'package:fively_ecommerce/module/shop/view/shop_view.dart';
import 'package:fively_ecommerce/module/signup/view/signup_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.arguments) {
      case 0:
        return ProductListView.route();
      case 1:
        return ShopView.route();
      case 2:
        return BagView.route();
      case 3:
        return FavoritesView.route();
      case 4:
        return ProfileView.route();
      default:
        return SignupView.route();
    }
  }
}
