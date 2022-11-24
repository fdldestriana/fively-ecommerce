import 'package:fively_ecommerce/pages/forget_password_page.dart';
import 'package:fively_ecommerce/pages/login_page.dart';
import 'package:fively_ecommerce/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Metropolis',
            primaryColor: const Color(0xFFF9F9F9),
          ),
          home: const SignUpPage(),
          initialRoute: SignUpPage.routeName,
          routes: {
            SignUpPage.routeName: (context) => const SignUpPage(),
            LoginPage.routeName: (context) => const LoginPage(),
            ForgetPasswordPage.routeName: (context) =>
                const ForgetPasswordPage()
          },
        );
      },
    );
  }
}
