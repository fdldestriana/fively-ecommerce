// import package
import 'package:fively_ecommerce/controller/categories_controller.dart';
import 'package:fively_ecommerce/module/shop/view/shop_product_view.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/bottom_navigation_bar_custom.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});
  static const routeName = 'shop';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ShopView());
  }

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final int index = 1;
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
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        backgroundColor: const Color(0xFFF9F9F9),
        centerTitle: true,
        elevation: 0,
        title: const Text('Categories'),
      ),
      body: ListView(children: [
        SizedBox(
          height: bodyHeight * 0.03,
        ),
        Center(
          child: CustomButton(
              title: 'VIEW ALL ITEMS',
              widthSize: bodyWidth * 0.91,
              heightSize: bodyHeight * 0.06,
              function: () {
                Navigator.pushNamed(context, ShopProductView.routeName,
                    arguments: 'all');
              }),
        ),
        SizedBox(
          height: bodyHeight * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(left: bodyWidth * 0.04),
          child: const Text(
            'Choose category',
            style: TextStyle(color: Color(0xFF9B9B9B)),
          ),
        ),
        Consumer<CategoryController>(
            builder: (BuildContext _, value, Widget? __) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var category = value.categories;
              return InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          bodyWidth * 0.11,
                          bodyHeight * 0.02,
                          bodyWidth * 0.57,
                          bodyHeight * 0.02),
                      child: Text(category[index].name),
                    ),
                    const Divider(
                      color: Color(0xFF9B9B9B),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, ShopProductView.routeName,
                      arguments: category[index].name);
                },
              );
            },
            itemCount: value.categories.length,
          );
        }),
      ]),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: index,
      ),
    );
  }
}
