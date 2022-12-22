// import package
import 'package:fively_ecommerce/pages/main_page/my_sliver_appbar.dart';
import 'package:fively_ecommerce/pages/main_page/my_sliver_grid.dart';
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
      body: const CustomScrollView(
        slivers: <Widget>[
          MySliverAppBar(),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: MySliverGrid(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: index,
      ),
    );
  }
}
