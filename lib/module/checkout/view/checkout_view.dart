// import package
import 'package:fively_ecommerce/module/checkout/widget/card_address.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = 'checkout';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutView());
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
          ),
          CardAddress(bodyWidth: bodyWidth, bodyHeight: bodyHeight)
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
