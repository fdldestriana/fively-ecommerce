// import package
import 'package:fively_ecommerce/model/user.dart';
import 'package:fively_ecommerce/module/bag/controller/cart_controller.dart';
import 'package:fively_ecommerce/module/checkout/view/checkout_view.dart';
import 'package:fively_ecommerce/module/forgot_password/view/forgot_password_view.dart';
import 'package:fively_ecommerce/module/login/controller/login_controller.dart';
import 'package:fively_ecommerce/module/login/view/login_view.dart';
import 'package:fively_ecommerce/module/main/product_detail/view/product_detail_view.dart';
import 'package:fively_ecommerce/module/favorites/controller/product_favorite_controller.dart';
import 'package:fively_ecommerce/controller/categories_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/view/product_list_view.dart';
import 'package:fively_ecommerce/module/shop/view/shop_product_view.dart';
import 'package:fively_ecommerce/module/signup/controller/signup_controller.dart';
import 'package:fively_ecommerce/module/success/view/success_view.dart';
import 'package:fively_ecommerce/service/user_preferrences.dart';
import 'package:fively_ecommerce/shared/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
];

Map<String, Widget Function(BuildContext)> routes = {
  CheckoutView.routeName: (context) => const CheckoutView(),
  ForgotPasswordView.routeName: (context) => const ForgotPasswordView(),
  LoginView.routeName: (context) => const LoginView(),
  ProductDetailView.routeName: (context) => const ProductDetailView(),
  ShopProductView.routeName: ((context) => const ShopProductView()),
  SuccessView.routeName: (context) => const SuccessView(),
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<User> getUser() => UserPreferrences().getUser();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext _, Widget? __) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FutureBuilder(
                future: getUser(),
                builder: ((context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator(
                        color: Colors.red,
                      );
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data == null) {
                        return const LoginView();
                      } else {
                        UserPreferrences().removeUser();
                      }
                      return const ProductListView();
                  }
                })),
            onGenerateRoute: AppRouter.onGenerateRoute,
            routes: routes,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    color: Color(0xFFDB3022),
                    foregroundColor: Color(0xFF222222)),
                // canvasColor set to transparent to make a showModalBottomSheet clipping the background
                canvasColor: Colors.transparent,
                fontFamily: 'Metropolis',
                outlinedButtonTheme: OutlinedButtonThemeData(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            (const Color(0xFF222222))))),
                primaryColor: const Color(0xFF222222),
                scaffoldBackgroundColor: const Color(0xFFF9F9F9),
                textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            (const Color(0xFF222222))))),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(color: Color(0xFF222222)),
                    bodyText2: TextStyle(color: Color(0xFF222222)))),
          ),
        );
      },
    );
  }
}
