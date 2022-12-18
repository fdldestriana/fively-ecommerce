// import package
import 'package:fively_ecommerce/models/category.dart';
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
  static const indexPage = 3;

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
                  Consumer<CategoryProvider>(
                      builder: (BuildContext _, value, Widget? child) {
                    List<Category> categories = value.categories;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) => CategoryButton(
                              category: categories[index],
                            ));
                  }),
                  SizedBox(
                    height: bodyHeight * 0.02,
                  ),
                  Row(children: const [Icon(Icons.search)])
                ],
              ),
            )),
      ),
      body: const CustomScrollView(
        slivers: [MySliverGrid()],
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        currentIndex: FavoritesPage.indexPage,
      ),
    );
  }
}
