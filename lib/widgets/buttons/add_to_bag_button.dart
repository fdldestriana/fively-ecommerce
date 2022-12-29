// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/controller/product_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToBagButton extends StatelessWidget {
  const AddToBagButton({
    Key? key,
    required this.parentHeight,
    required this.parentWidth,
    required this.product,
  }) : super(key: key);

  final double parentHeight;
  final double parentWidth;
  final Product product;

  @override
  Widget build(BuildContext context) {
    ProductCartController cartProvider =
        Provider.of<ProductCartController>(context, listen: false);

    const snackBar = SnackBar(
      content: Text('1 item has successfully added to the cart'),
    );

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
          onPressed: () {
            cartProvider.addToCart(product);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
