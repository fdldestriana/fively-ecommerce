// import package
import 'package:fively_ecommerce/models/product.dart';
import 'package:fively_ecommerce/providers/category_provider.dart';
import 'package:fively_ecommerce/providers/product_cart_provider.dart';
import 'package:fively_ecommerce/utils/size.dart';
import 'package:fively_ecommerce/widgets/bottom_navigation_bar_custom.dart';
import 'package:fively_ecommerce/widgets/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});
  final int index = 2;
  static const routeName = 'bag';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const BagPage());
  }

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
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
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        backgroundColor: const Color(0xFFF9F9F9),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(bodyHeight * 0.13),
            child: const Text(
              'My Bag',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 34,
                  fontWeight: FontWeight.w700),
            )),
      ),
      body: Consumer<ProductCartProvider>(
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
                    return ProductItemCart(product: products[index]);
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

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => throw UnimplementedError();
}
