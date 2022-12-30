// import package
import 'package:fively_ecommerce/model/category.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/controller/categories_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/module/shop/widget/product_shop_item.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/bottom_navigation_bar_custom.dart';
import 'package:fively_ecommerce/module/favorites/widget/category_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopProductView extends StatefulWidget {
  const ShopProductView({super.key});
  final int index = 1;
  static const routeName = 'sho-product';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ShopProductView());
  }

  @override
  State<ShopProductView> createState() => _ShopProductViewState();
}

class _ShopProductViewState extends State<ShopProductView> {
  @override
  void didChangeDependencies() {
    Provider.of<CategoryController>(context, listen: false).getCategories();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    final List<Product> products =
        Provider.of<ProductListController>(context, listen: false).products;

    final Product product = products.firstWhere(
      (element) => element.category == category.name,
    );

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
                  Text(
                    product.category.toUpperCase(),
                    style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 34,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: bodyHeight * 0.02,
                  ),
                  Consumer<CategoryController>(
                      builder: (BuildContext _, value, Widget? __) {
                    return SizedBox(
                      height: bodyHeight * 0.05,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: value.categories.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
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
      body: Consumer<ProductListController>(
        builder: (BuildContext context, value, Widget? child) {
          List<Product> products = value.products
              .where((element) => element.category == product.category)
              .toList();
          return (products.isNotEmpty)
              ? GridView.builder(
                  padding: EdgeInsets.only(
                    left: bodyWidth * 0.03,
                    top: bodyHeight * 0.01,
                    right: bodyWidth * 0.03,
                    bottom: bodyHeight * 0.02,
                  ),
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2.96 / 1,
                      mainAxisSpacing: bodyHeight * 0.04,
                      crossAxisCount: 1),
                  itemBuilder: (((context, index) {
                    return ProductShopItem(product: products[index]);
                  })),
                  itemCount: products.length,
                )
              : Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: widget.index,
      ),
    );
  }
}
