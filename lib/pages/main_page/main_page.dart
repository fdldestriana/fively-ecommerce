// import package
import 'package:fively_ecommerce/pages/main_page/my_sliver_appbar.dart';
import 'package:fively_ecommerce/pages/main_page/my_sliver_grid.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const routeName = 'main';

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
    );
  }
}
