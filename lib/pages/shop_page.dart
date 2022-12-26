// import package
import 'package:fively_ecommerce/widgets/bottom_navigation_bar_custom.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});
  final int index = 1;
  static const routeName = 'shop';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ShopPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: SizedBox(
          width: 343,
          height: 104,
          // child: AddToBagButton(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: index,
      ),
    );
  }
}
