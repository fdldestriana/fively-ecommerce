import 'package:fively_ecommerce/pages/forgot_password_page.dart';
import 'package:fively_ecommerce/pages/login_page.dart';
import 'package:fively_ecommerce/pages/main_page/main_page.dart';
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
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductProvider())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Metropolis',
              primaryColor: const Color(0xFFF9F9F9),
            ),
            home: const MainPage(),
            // initialRoute: SignUpPage.routeName,
            routes: {
              SignUpPage.routeName: (context) => const SignUpPage(),
              LoginPage.routeName: (context) => const LoginPage(),
              ForgetPasswordPage.routeName: (context) =>
                  const ForgetPasswordPage(),
              MainPage.routeName: (context) => const MainPage()
            },
          ),
        );
      },
    );
  }
}
