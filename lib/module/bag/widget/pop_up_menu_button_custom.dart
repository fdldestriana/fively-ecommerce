// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/controller/product_cart_controller.dart';
import 'package:fively_ecommerce/controller/product_favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopUpMenuButtonCustom extends StatelessWidget {
  const PopUpMenuButtonCustom(
      {Key? key,
      required this.parentHeight,
      required this.parentWidth,
      required this.product})
      : super(key: key);

  final double parentHeight;
  final double parentWidth;
  final Product product;

  @override
  Widget build(BuildContext context) {
    ProductCartController cartProvider =
        Provider.of<ProductCartController>(context, listen: false);
    ProductFavoriteController favoriteProvider =
        Provider.of<ProductFavoriteController>(context, listen: false);
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: const Center(child: Text('Add to favorites')),
          onTap: () {
            favoriteProvider.addToWishlist(product);
          },
        ),
        PopupMenuItem(
          child: const Center(child: Text('Delete from the list')),
          onTap: () {
            cartProvider.removeFromCart(product);
          },
        )
      ],
      offset: Offset(-(parentWidth * 0.1), -(parentHeight * 0.24)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(parentWidth * 0.02),
        ),
      ),
    );
  }
}
