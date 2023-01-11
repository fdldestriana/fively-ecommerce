// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/bag/controller/cart_controller.dart';
import 'package:fively_ecommerce/module/bag/widget/bottom_sheet_custom.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/shared/utils/notifier_state.dart';
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
  final ScrollController _controller = ScrollController();
  bool isVisible = true;
  bool isHasData = false;
  final SizeConfig sizeConfig = SizeConfig();

  @override
  void initState() {
    super.initState();

    /*
    The code below is within the Future to prevent: 
    Unhandled Exception: inheritFromWidgetOfExactType<_LocalizationsScope><ProductListController>>
    or dependOnInheritedElement() was called before _BagView.initState() completed.
    */

    Future.delayed(Duration.zero, () {
      // The if statement to control that the code below just called once
      if (Provider.of<CartController>(context, listen: false)
          .cartProducts
          .isEmpty) {
        // The code below is to fetch the list of product from the value of ProductListController
        List<Product> products =
            Provider.of<ProductListController>(context, listen: false).products;

        // The code below is to fetch the list of product id from the cart api
        Provider.of<CartController>(context, listen: false)
            .getCart()
            .whenComplete(() =>
                // The code below is to get the appropriate list of products that contained within the cart

                Provider.of<CartController>(context, listen: false)
                    .getCartProducts(products));
      }
    });

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
        body:
            // FutureBuilder(
            //     future:
            //         Provider.of<CartController>(context, listen: false).getCart(),
            //     builder: ((context, snapshot) {
            //       Provider.of<CartController>(context)
            //           .getCartProducts(snapshot.data);
            //       List<dynamic> data =
            //           Provider.of<CartController>(context).cartProducts;

            //       return (snapshot.connectionState == NotifierState.loading &&
            //               data.isEmpty)
            //           ? const LoadingStateCart()
            //           : LoadedStateCart(
            //               controller: _controller, cartProducts: data);
            //     }))
            Consumer<CartController>(
          builder: (_, value, __) {
            if (value.state == NotifierState.loading &&
                value.cartProducts.isEmpty) {
              return const LoadingStateCart();
            }
            if (value.state == NotifierState.loaded &&
                value.cartProducts.isEmpty) {
              return const LoadingStateCart();
            }
            if (value.failure.message.isNotEmpty &&
                value.failure.message != 'message') {
              return ErrorStateCart(
                message: value.failure.message,
              );
            }
            if (value.state == NotifierState.loaded &&
                value.cartProducts.isNotEmpty) {
              return LoadedStateCart(
                  controller: _controller, cartProducts: value.cartProducts);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBarCustom(
          initialIndex: widget.index,
        ),
        bottomSheet: Consumer<CartController>(
          builder: (_, value, __) {
            if (value.cartProducts.isEmpty) {
              return Container();
            } else {
              return Visibility(
                  visible: isVisible, child: const BottomSheetCustom());
            }
          },
        ));
  }
}

class LoadedStateCart extends StatelessWidget {
  LoadedStateCart({
    Key? key,
    required ScrollController controller,
    required this.cartProducts,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;
  final List<dynamic> cartProducts;
  final SizeConfig sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return GridView.builder(
      clipBehavior: Clip.none,
      controller: _controller,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.96 / 1,
          mainAxisSpacing: bodyHeight * 0.04,
          crossAxisCount: 1),
      itemBuilder: (((context, index) {
        return ProductCartItem(
          product: cartProducts[index]['product'],
          quantity: cartProducts[index]['quantity'],
        );
      })),
      itemCount: cartProducts.length,
      padding: EdgeInsets.only(
        left: bodyWidth * 0.03,
        top: bodyHeight * 0.01,
        right: bodyWidth * 0.03,
        bottom: bodyHeight * 0.02,
      ),
    );
  }
}

class LoadingStateCart extends StatelessWidget {
  const LoadingStateCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
        backgroundColor: Color(0xFFFFFFFF),
      ),
    );
  }
}

class ErrorStateCart extends StatelessWidget {
  const ErrorStateCart({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(
      child: Text(
        message,
        style: const TextStyle(backgroundColor: Colors.red, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    ));
  }
}
