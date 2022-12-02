import 'package:fively_ecommerce/models/product.dart';
import 'package:fively_ecommerce/utils/size.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius:
                      BorderRadius.all(Radius.circular(bodyWidth * 0.03)),
                  child: Image.network(
                    product.images,
                    width: constraints.maxWidth * 0.99,
                    height: constraints.maxHeight * 0.71,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Text(
                product.title,
                style: const TextStyle(fontSize: 11, color: Color(0xFF9B9B9B)),
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
                style: const TextStyle(fontSize: 14, color: Color(0xFF222222)),
              )
            ],
          );
        },
      ),
    );
  }
}
