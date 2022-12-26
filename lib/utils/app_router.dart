import 'package:fively_ecommerce/pages/bag_page.dart';
import 'package:fively_ecommerce/pages/favorites_page.dart';
import 'package:fively_ecommerce/pages/main_page/main_page.dart';
import 'package:fively_ecommerce/pages/profile_page.dart';
import 'package:fively_ecommerce/pages/shop_page.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.arguments) {
      case 0:
        return MainPage.route();
      case 1:
        return ShopPage.route();
      case 2:
        return BagPage.route();
      case 3:
        return FavoritesPage.route();
      case 4:
        return ProfilePage.route();
      default:
        return MainPage.route();
    }
  }
}
