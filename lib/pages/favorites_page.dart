// import package
import 'package:fively_ecommerce/models/product.dart';
import 'package:fively_ecommerce/providers/category_provider.dart';
import 'package:fively_ecommerce/providers/product_favorite_provider.dart';
import 'package:fively_ecommerce/utils/size.dart';
import 'package:fively_ecommerce/widgets/bottom_navigation_bar_custom.dart';
import 'package:fively_ecommerce/widgets/buttons/category_button.dart';
import 'package:fively_ecommerce/widgets/product_item_favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});
  final int index = 3;
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
      appBar: AppBar(
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
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/images/buttons/filter.png')),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/images/buttons/filter_price.png')),
                        Padding(
                          padding: EdgeInsets.only(right: bodyWidth * 0.03),
                          child: Image.asset('assets/images/buttons/view.png'),
                        ),
                      ])
                ],
              ),
            )),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<ProductFavoriteProvider>(
            builder: (BuildContext context, value, Widget? child) {
              List<Product> products = value.products;
              return (products.isNotEmpty)
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2.96 / 1,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 1),
                      itemBuilder: (((context, index) {
                        return ProductItemFavorite(product: products[index]);
                      })),
                      itemCount: products.length,
                    )
                  : Container();
            },
          )),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: widget.index,
      ),
    );
  }
}
