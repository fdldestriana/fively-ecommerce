// import package
import 'package:fively_ecommerce/module/bag/controller/cart_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/view/product_list_view.dart';
import 'package:fively_ecommerce/module/main/product_detail/view/product_detail_view.dart';
import 'package:fively_ecommerce/module/favorites/controller/product_favorite_controller.dart';
import 'package:fively_ecommerce/controller/categories_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/module/shop/view/shop_product_view.dart';
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
            ChangeNotifierProvider(create: (context) => CartController()),
            ChangeNotifierProvider(create: ((context) => CategoryController())),
            ChangeNotifierProvider(
                create: (context) => ProductListController()),
            ChangeNotifierProvider(
                create: (context) => ProductFavoriteController()),
            // ChangeNotifierProvider(
            //     create: (context) => ProductCartController()),
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
            initialRoute: ProductListView.routeName,
            onGenerateRoute: AppRouter.onGenerateRoute,
            routes: {
              ProductDetailView.routeName: (context) =>
                  const ProductDetailView(),
              ShopProductView.routeName: ((context) => const ShopProductView())
            },
          ),
        );
      },
    );
  }
}
