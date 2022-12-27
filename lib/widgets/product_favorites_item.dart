// import package
import 'package:fively_ecommerce/models/product.dart';
import 'package:fively_ecommerce/providers/product_favorite_provider.dart';
import 'package:fively_ecommerce/utils/size.dart';
import 'package:fively_ecommerce/widgets/buttons/add_to_bag_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductFavoritesItem extends StatelessWidget {
  const ProductFavoritesItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    ProductFavoriteProvider favoriteProvider =
        Provider.of<ProductFavoriteProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(bodyWidth * 0.03)),
        color: const Color(0xFFFFFFFF),
      ),
      height: bodyHeight * 0.14,
      width: bodyWidth * 0.91,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Stack(clipBehavior: Clip.none, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      product.images,
                      width: constraints.maxWidth * 0.30,
                      height: constraints.maxHeight * 1.00,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.14,
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF9B9B9B)),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.03,
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15,
                          color: Color(0xFF222222)),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.06,
                    ),
                    Row(
                      children: [
                        const Text('Color: '),
                        SizedBox(
                          width: constraints.maxWidth * 0.07,
                        ),
                        const Text('Size: ')
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.12,
                    ),
                    Row(children: [
                      Text(
                        '${product.price}\$',
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF222222)),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.12,
                      ),
                      const Icon(
                        Icons.star_border_rounded,
                        color: Color(0xFF9B9B9B),
                      ),
                      const Icon(
                        Icons.star_border_rounded,
                        color: Color(0xFF9B9B9B),
                      ),
                      const Icon(
                        Icons.star_border_rounded,
                        color: Color(0xFF9B9B9B),
                      ),
                      const Icon(
                        Icons.star_border_rounded,
                        color: Color(0xFF9B9B9B),
                      ),
                      const Icon(
                        Icons.star_border_rounded,
                        color: Color(0xFF9B9B9B),
                      ),
                    ])
                  ],
                ),
                IconButton(
                    onPressed: () {
                      favoriteProvider.removeFromWishlist(product);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF9B9B9B),
                    )),
              ],
            ),
            Positioned(
                bottom: -(constraints.maxHeight * 0.14),
                right: 0,
                child: AddToBagButton(
                  parentHeight: constraints.maxHeight,
                  parentWidth: constraints.maxWidth,
                  product: product,
                ))
          ]);
        },
      ),
    );
  }
}
