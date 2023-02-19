import 'package:fively_ecommerce/module/bag/controller/cart_controller.dart';
import 'package:fively_ecommerce/module/bag/widget/promo_text_field.dart';
import 'package:fively_ecommerce/module/checkout/view/checkout_view.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/shared/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetCustom extends StatelessWidget {
  const BottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return Container(
      color: const Color(0xFFF9F9F9),
      height: bodyHeight * 0.23,
      width: bodyWidth * 1.00,
      child: Column(
        children: [
          PromoTextField(
            parentHeight: (bodyHeight * 0.23),
            parentWidth: bodyWidth * 1.00,
          ),
          SizedBox(
            height: bodyHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: bodyWidth * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total amount:'),
                Consumer<CartController>(
                  builder: (_, value, __) {
                    return Text(value.totalAmount.toStringAsFixed(1));
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: bodyHeight * 0.01,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(bodyWidth * 0.04, bodyHeight * 0.03,
                bodyWidth * 0.04, bodyHeight * 0.04),
            child: CustomButton(
                function: () {
                  Navigator.pushNamed(context, CheckoutView.routeName);
                },
                title: 'CHECK OUT',
                widthSize: bodyWidth * 0.91,
                heightSize: bodyHeight * 0.06),
          ),
        ],
      ),
    );
  }
}
