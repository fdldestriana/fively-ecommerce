// import package
import 'package:fively_ecommerce/module/main/product_list/view/product_list_view.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});
  static const routeName = 'success';

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: bodyHeight * 0.25,
          ),
          Center(
            child: Image.asset(
              'assets/images/transactions/success.png',
              height: bodyHeight * 0.27,
              width: bodyWidth * 0.58,
            ),
          ),
          SizedBox(
            height: bodyHeight * 0.06,
          ),
          const Center(
            child: Text(
                'Your order will be delivered soon.\nThank you for choosing our app!'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: bodyWidth * 0.05,
            right: bodyWidth * 0.05,
            bottom: bodyHeight * 0.08),
        child: CustomButton(
            title: 'CONTINUE SHOPPING',
            widthSize: bodyWidth * 0.91,
            heightSize: bodyHeight * 0.06,
            function: (() {
              Navigator.pushReplacementNamed(
                  context, ProductListView.routeName);
            })),
      ),
    );
  }
}
