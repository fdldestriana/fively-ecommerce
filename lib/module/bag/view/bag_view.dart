// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/controller/categories_controller.dart';
import 'package:fively_ecommerce/module/bag/controller/cart_controller.dart';
import 'package:fively_ecommerce/module/bag/widget/bottom_sheet_custom.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/bottom_navigation_bar_custom.dart';
import 'package:fively_ecommerce/module/bag/widget/product_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  final SizeConfig sizeConfig = SizeConfig();
  final ScrollController _controller = ScrollController();
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoryController>(context, listen: false).getCategories();
    if (cartProducts.isEmpty) {
      Provider.of<CartController>(context, listen: false).getCart();
    }

    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.idle ||
          _controller.position.userScrollDirection == ScrollDirection.forward) {
        setState(() => isVisible = true);
      } else if (_controller.position.userScrollDirection ==
              ScrollDirection.reverse &&
          isVisible == true) {
        setState(() => isVisible = false);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Product> cartProducts = [];

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    return Scaffold(
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
      body: Consumer2<ProductListController, CartController>(
        builder: (_, productListController, cartController, __) {
          List<Product> products = productListController.products;
          cartController.getCartProducts(products);
          cartProducts = cartController.cartProducts;
          print(cartProducts.length);

          return (cartProducts.isNotEmpty)
              ? GridView.builder(
                  clipBehavior: Clip.none,
                  controller: _controller,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2.96 / 1,
                      mainAxisSpacing: bodyHeight * 0.04,
                      crossAxisCount: 1),
                  itemBuilder: (((context, index) {
                    return ProductCartItem(product: cartProducts[index]);
                  })),
                  itemCount: cartProducts.length,
                  padding: EdgeInsets.only(
                    left: bodyWidth * 0.03,
                    top: bodyHeight * 0.01,
                    right: bodyWidth * 0.03,
                    bottom: bodyHeight * 0.02,
                  ),
                )
              : Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: widget.index,
      ),
      bottomSheet: (cartProducts.isNotEmpty)
          ? Visibility(
              visible: isVisible,
              child: const BottomSheetCustom(),
            )
          : null,
    );
  }
}
