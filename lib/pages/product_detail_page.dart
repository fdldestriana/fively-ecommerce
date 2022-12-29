// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/controller/product_controller.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widgets/buttons/custom_button.dart';
import 'package:fively_ecommerce/widgets/buttons/favorite_button.dart';
import 'package:fively_ecommerce/widgets/outlined_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});
  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final List<Product> products =
        Provider.of<ProductController>(context, listen: false).products;
    final Product product = products.firstWhere(
      (element) => element.id == id,
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          centerTitle: true,
          title: Text(
            product.title,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: product.title,
                child: Image.network(
                  product.images,
                  width: bodyWidth * 1.00,
                  height: bodyHeight * 0.57,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: bodyHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const OutlinedButtonCustom(
                    title: 'Size',
                  ),
                  const OutlinedButtonCustom(
                    title: 'Color',
                  ),
                  SizedBox(
                    width: bodyWidth * 0.11,
                    height: bodyHeight * 0.06,
                    child: LayoutBuilder(
                      builder: (_, constraint) => FavoriteButton(
                        parentWidth: constraint.maxWidth,
                        parentHeight: constraint.maxHeight,
                        product: product,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: bodyHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: bodyWidth * 0.03, right: bodyWidth * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: product.category,
                        style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                              text: '\n${product.title}',
                              style: const TextStyle(
                                  fontSize: 11, color: Color(0xFF9B9B9B))),
                        ],
                      ),
                    ),
                    Text('\$${product.price}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              SizedBox(
                height: bodyHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: bodyWidth * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
              ),
              SizedBox(
                height: bodyHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: bodyWidth * 0.03, right: bodyWidth * 0.03),
                child: Text(
                  product.description,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: bodyHeight * 0.03,
              ),
              CustomButton(
                  title: 'ADD TO CART',
                  widthSize: bodyWidth * 0.91,
                  heightSize: bodyHeight * 0.07),
              SizedBox(
                height: bodyHeight * 0.01,
              ),
            ],
          ),
        ));
  }
}
