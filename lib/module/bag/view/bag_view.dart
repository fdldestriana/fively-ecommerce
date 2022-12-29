// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/controller/category_controller.dart';
import 'package:fively_ecommerce/controller/product_cart_controller.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/bottom_navigation_bar_custom.dart';
import 'package:fively_ecommerce/module/bag/widget/product_cart_item.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});
  final int index = 2;
  static const routeName = 'bag';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const BagView());
  }

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
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
      bottomSheet: Container(
        color: const Color(0xFFF9F9F9),
        padding: EdgeInsets.only(
            left: bodyWidth * 0.04,
            top: bodyHeight * 0.03,
            right: bodyWidth * 0.04,
            bottom: bodyHeight * 0.04),
        child: CustomButton(
            function: () {},
            title: 'CHECK OUT',
            widthSize: bodyWidth * 0.91,
            heightSize: bodyHeight * 0.06),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(bodyHeight * 0.13),
        child: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          backgroundColor: const Color(0xFFF9F9F9),
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: bodyWidth * 0.04),
            title: const Text(
              'My Bag',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 34,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      body: Consumer<ProductCartController>(
        builder: (BuildContext context, value, Widget? child) {
          List<Product> products = value.products;
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
                    return ProductCartItem(product: products[index]);
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
