import 'package:fively_ecommerce/state_util.dart';

// import package
import 'package:firebase_core/firebase_core.dart';
import 'package:fively_ecommerce/module/bag/controller/cart_controller.dart';
import 'package:fively_ecommerce/module/bag/view/bag_view.dart';
import 'package:fively_ecommerce/module/checkout/view/checkout_view.dart';
import 'package:fively_ecommerce/module/favorites/view/favorites_view.dart';
import 'package:fively_ecommerce/module/forgot_password/view/forgot_password_view.dart';
import 'package:fively_ecommerce/module/login/controller/login_controller.dart';
import 'package:fively_ecommerce/module/login/view/login_view.dart';
import 'package:fively_ecommerce/module/main/product_detail/view/product_detail_view.dart';
import 'package:fively_ecommerce/module/favorites/controller/product_favorite_controller.dart';
import 'package:fively_ecommerce/controller/categories_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/view/product_listview.dart';
import 'package:fively_ecommerce/module/profile/controller/profile_controller.dart';
import 'package:fively_ecommerce/module/profile/view/profile_view.dart';
import 'package:fively_ecommerce/module/shop/view/shop_product_view.dart';
import 'package:fively_ecommerce/module/shop/view/shop_view.dart';
import 'package:fively_ecommerce/module/signup/controller/signup_controller.dart';
import 'package:fively_ecommerce/module/signup/view/signup_view.dart';
import 'package:fively_ecommerce/module/success/view/success_view.dart';
import 'package:fively_ecommerce/shared/utils/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => CartController()),
  ChangeNotifierProvider(create: (context) => CategoryController()),
  ChangeNotifierProvider(create: (context) => LoginController()),
  ChangeNotifierProvider(create: (context) => ProductFavoriteController()),
  ChangeNotifierProvider(create: (context) => ProductListController()),
  ChangeNotifierProvider(create: (context) => SignupController()),
  ChangeNotifierProvider(create: (context) => ProfileController())
];

Map<String, WidgetBuilder> routes = {
  ProductListView.routeName: (context) => const ProductListView(),
  CheckoutView.routeName: (context) => const CheckoutView(),
  ForgotPasswordView.routeName: (context) => const ForgotPasswordView(),
  LoginView.routeName: (context) => const LoginView(),
  ProductDetailView.routeName: (context) => const ProductDetailView(),
  ShopProductView.routeName: ((context) => const ShopProductView()),
  SignupView.routeName: ((context) => const SignupView()),
  SuccessView.routeName: (context) => const SuccessView(),
  ShopView.routeName: (context) => const ShopView(),
  BagView.routeName: (context) => const BagView(),
  FavoritesView.routeName: (context) => const FavoritesView(),
  ProfileView.routeName: (context) => const ProfileView()
};

ThemeData themeData() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
          color: Color(0xFFDB3022), foregroundColor: Color(0xFF222222)),
      // canvasColor set to transparent to make a showModalBottomSheet clipping the background
      canvasColor: Colors.transparent,
      fontFamily: 'Metropolis',
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all((const Color(0xFF222222))))),
      primaryColor: const Color(0xFF222222),
      scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all((const Color(0xFF222222))))),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF222222)),
          bodyMedium: TextStyle(color: Color(0xFF222222))));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  String? token = prefs.getString('token');
  final MyApp myApp = MyApp(
    initialRoute: (token != null) ? LoginView.routeName : SignupView.routeName,
  );
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.initialRoute});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        // onGenerateRoute: AppRouter.onGenerateRoute,
        // routes: routes,
        home: const SignupView(),
        // navigatorKey: navigatorKey,
        navigatorKey: Get.navigatorKey,
        theme: themeData(),
      ),
    );
  }
}
