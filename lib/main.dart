// import package
import 'package:fively_ecommerce/pages/bag_page.dart';
import 'package:fively_ecommerce/pages/favorites_page.dart';
import 'package:fively_ecommerce/pages/forgot_password_page.dart';
import 'package:fively_ecommerce/pages/login_page.dart';
import 'package:fively_ecommerce/pages/main_page/main_page.dart';
import 'package:fively_ecommerce/pages/product_detail_page.dart';
import 'package:fively_ecommerce/pages/profile_page.dart';
import 'package:fively_ecommerce/pages/shop_page.dart';
import 'package:fively_ecommerce/pages/signup_page.dart';
import 'package:fively_ecommerce/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext _, Widget? __) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductProvider())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
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
            initialRoute: MainPage.routeName,
            routes: {
              SignUpPage.routeName: (context) => const SignUpPage(),
              LoginPage.routeName: (context) => const LoginPage(),
              ForgetPasswordPage.routeName: (context) =>
                  const ForgetPasswordPage(),
              MainPage.routeName: (context) => const MainPage(),
              ShopPage.routeName: (context) => const ShopPage(),
              BagPage.routeName: (context) => const BagPage(),
              FavoritesPage.routeName: (context) => const FavoritesPage(),
              ProfilePage.routeName: (context) => const ProfilePage(),
              ProductDetailPage.routeName: (context) =>
                  const ProductDetailPage()
            },
          ),
        );
      },
    );
  }
}
