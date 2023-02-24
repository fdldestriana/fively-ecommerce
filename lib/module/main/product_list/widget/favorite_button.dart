// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/favorites/controller/product_favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    Key? key,
    required this.parentWidth,
    required this.parentHeight,
    required this.product,
  }) : super(key: key);
  final double parentWidth;
  final double parentHeight;
  final Product product;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    ProductFavoriteController provider =
        Provider.of<ProductFavoriteController>(context, listen: false);

    var boxShadow = BoxShadow(
      color: const Color(0xFF9B9B9B),
      blurRadius: widget.parentWidth * 0.001,
      spreadRadius: widget.parentWidth * 0.001,
      offset: Offset(0, widget.parentWidth * 0.005),
    );

    return Container(
      width: widget.parentWidth * 0.24,
      height: widget.parentHeight * 0.14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          boxShadow,
        ],
      ),
      child: IconButton(
        color: (isFavorite) ? const Color(0xFFDB3022) : const Color(0xFF9B9B9B),
        icon: (isFavorite)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        onPressed: () {
          (!isFavorite)
              ? provider.addToWishlist(widget.product)
              : provider.removeFromWishlist(widget.product);
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
