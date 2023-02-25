// import package
import 'package:fively_ecommerce/module/main/product_list/widget/custom_sliver_appbar.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/custom_sliver_grid.dart';
import 'package:fively_ecommerce/shared/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});
  final int index = 0;
  static const routeName = 'product-list';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProductListView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(),
          CustomSliverGrid(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: index,
      ),
    );
  }
}
