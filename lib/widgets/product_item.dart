import 'package:fively_ecommerce/models/product.dart';
import 'package:fively_ecommerce/pages/product_detail_page.dart';
import 'package:fively_ecommerce/utils/size.dart';
import 'package:fively_ecommerce/widgets/buttons/favorite_button.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
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
    return SizedBox(
      width: bodyWidth * 0.40,
      height: bodyHeight * 0.34,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailPage.routeName,
                  arguments: product.id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(bodyWidth * 0.03)),
                    child: Hero(
                      tag: product.title,
                      child: Image.network(
                        product.images,
                        width: constraints.maxWidth * 1.00,
                        height: constraints.maxHeight * 0.71,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: constraints.maxWidth / 1.32,
                    top: constraints.maxHeight / 1.59,
                    child: FavoriteButton(
                      parentWidth: constraints.maxWidth,
                      parentHeight: constraints.maxHeight,
                      product: product,
                    ),
                  )
                ]),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFF9B9B9B),
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFF9B9B9B),
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFF9B9B9B),
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFF9B9B9B),
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFF9B9B9B),
                    )
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Text(
                  product.title,
                  style:
                      const TextStyle(fontSize: 11, color: Color(0xFF9B9B9B)),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      color: Color(0xFF222222)),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.01,
                ),
                Text(
                  '${product.price}\$',
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xFF222222)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
