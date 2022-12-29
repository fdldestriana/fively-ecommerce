// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.parentHeight,
    required this.parentWidth,
    required this.product,
    required this.function,
  }) : super(key: key);

  final double parentHeight;
  final double parentWidth;
  final Product product;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: parentHeight * 0.35,
        width: parentWidth * 0.10,
        decoration: const BoxDecoration(
          color: Color(0xFFDB3022),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Image.asset('assets/images/buttons/add_to_bag.png'),
          iconSize: parentWidth * 0.07,
          onPressed: function,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
