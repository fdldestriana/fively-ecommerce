// import package
import 'package:fively_ecommerce/module/checkout/widget/card_address.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/shared/widget/custom_button.dart';
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
          CardAddress(bodyWidth: bodyWidth, bodyHeight: bodyHeight),
          SizedBox(
            height: bodyHeight * 0.07,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: bodyWidth * 0.04, right: bodyWidth * 0.10),
            child: SizedBox(
              height: bodyHeight * 0.18,
              width: bodyWidth * 0.85,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: bodyWidth * 0.5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Change',
                            style: TextStyle(color: Color(0xFFDB3022)),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/cards/mastercard.png',
                        height: bodyHeight * 0.10,
                        width: bodyWidth * 0.34,
                      ),
                      const Text('**** **** **** 3947')
                    ],
                  )
                ],
              ),
            ),
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
