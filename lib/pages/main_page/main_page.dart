// import package
import 'package:fively_ecommerce/pages/main_page/my_sliver_appbar.dart';
import 'package:fively_ecommerce/pages/main_page/my_sliver_grid.dart';
import 'package:fively_ecommerce/widgets/bottom_navigation_bar_custom.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  final int index = 0;
  static const routeName = 'main';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const MainPage());
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
