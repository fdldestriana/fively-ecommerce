// import package
import 'package:fively_ecommerce/pages/main_page/main_page.dart';
import 'package:fively_ecommerce/pages/product_detail_page.dart';
import 'package:fively_ecommerce/controller/category_controller.dart';
import 'package:fively_ecommerce/controller/product_cart_controller.dart';
import 'package:fively_ecommerce/controller/product_favorite_controller.dart';
import 'package:fively_ecommerce/controller/product_controller.dart';
import 'package:fively_ecommerce/shared/utils/app_router.dart';
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
            ChangeNotifierProvider(create: ((context) => CategoryController())),
            ChangeNotifierProvider(create: (context) => ProductController()),
            ChangeNotifierProvider(
                create: (context) => ProductFavoriteController()),
            ChangeNotifierProvider(create: (context) => ProductCartController())
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
            onGenerateRoute: AppRouter.onGenerateRoute,
            routes: {
              ProductDetailPage.routeName: (context) =>
                  const ProductDetailPage()
            },
          ),
        );
      },
    );
  }
}
