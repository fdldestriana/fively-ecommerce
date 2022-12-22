// import package
import 'package:fively_ecommerce/pages/main_page/my_sliver_grid.dart';
import 'package:fively_ecommerce/providers/category_provider.dart';
import 'package:fively_ecommerce/utils/size.dart';
import 'package:fively_ecommerce/widgets/bottom_navigation_bar_custom.dart';
import 'package:fively_ecommerce/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});
  static const routeName = 'favorites';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const FavoritesPage());
  }

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void didChangeDependencies() {
    Provider.of<CategoryProvider>(context, listen: false).getCategories();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    return Scaffold(
      appBar: //
          AppBar(
        elevation: 7,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        backgroundColor: const Color(0xFFF9F9F9),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(bodyHeight * 0.25),
            child: Padding(
              padding: EdgeInsets.only(left: bodyWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Favorites',
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 34,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: bodyHeight * 0.02,
                  ),
                  Consumer<CategoryProvider>(
                      builder: (BuildContext _, value, Widget? __) {
                    return SizedBox(
                      height: bodyHeight * 0.05,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: value.categories.length,
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(
                                  right: bodyWidth * 0.02,
                                ),
                                child: CategoryButton(
                                  category: value.categories[index],
                                ),
                              )),
                    );
                  }),
                  SizedBox(
                    height: bodyHeight * 0.02,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Text('Filter')),
                        IconButton(onPressed: () {}, icon: const Text('Price')),
                        Padding(
                          padding: EdgeInsets.only(right: bodyWidth * 0.03),
                          child: const Icon(Icons.filter),
                        ),
                      ])
                ],
              ),
            )),
      ),
      body: const CustomScrollView(
        slivers: [MySliverGrid()],
      ),
      bottomNavigationBar: const BottomNavigationBarCustom(),
    );
  }
}
