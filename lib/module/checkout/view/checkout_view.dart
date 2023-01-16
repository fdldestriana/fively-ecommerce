// import package
import 'package:fively_ecommerce/controller/categories_controller.dart';
import 'package:fively_ecommerce/module/shop/view/shop_product_view.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/bottom_navigation_bar_custom.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});
  static const routeName = 'checkout';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutView());
  }

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
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
        backgroundColor: const Color(0xFFF9F9F9),
        centerTitle: true,
        elevation: 1,
        shadowColor: const Color(0xFFF9F9F9),
        title: const Text('Checkout'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: bodyHeight * 0.04,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: bodyWidth * 0.04, vertical: bodyHeight * 0.03),
        child: CustomButton(
            function: () {},
            title: 'SUBMIT ORDER',
            widthSize: bodyWidth * 0.91,
            heightSize: bodyHeight * 0.07),
      ),
    );
  }
}
