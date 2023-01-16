// import package
import 'package:fively_ecommerce/widget/bottom_navigation_bar_custom.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  final int index = 4;
  static const routeName = 'profile';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProfileView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('This is profile page\nNot developed yet'),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: index,
      ),
    );
  }
}
