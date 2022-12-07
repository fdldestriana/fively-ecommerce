// import package
import 'package:fively_ecommerce/pages/main_page/my_sliver_appbar.dart';
import 'package:fively_ecommerce/pages/main_page/my_sliver_grid.dart';
import 'package:fively_ecommerce/widgets/bottom_navigation_bar_custom.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});
  static const routeName = 'shop';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          MySliverAppBar(),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: MySliverGrid(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarCustom(),
    );
  }
}
