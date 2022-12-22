// import package
import 'package:fively_ecommerce/pages/main_page/main_page.dart';
import 'package:fively_ecommerce/providers/category_provider.dart';
import 'package:fively_ecommerce/providers/product_favorite_provider.dart';
import 'package:fively_ecommerce/providers/product_provider.dart';
import 'package:fively_ecommerce/widgets/app_router.dart';
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
            ChangeNotifierProvider(create: ((context) => CategoryProvider())),
            ChangeNotifierProvider(create: (context) => ProductProvider()),
            ChangeNotifierProvider(
                create: (context) => ProductFavoriteProvider())
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
          ),
        );
      },
    );
  }
}
