// import package
import 'package:fively_ecommerce/module/main/product_list/widget/custom_sliver_appbar.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/custom_sliver_grid.dart';
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
      body: const CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: CustomSliverGrid(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: index,
      ),
    );
  }
}
