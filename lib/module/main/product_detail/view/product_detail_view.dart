// import package
import 'package:fively_ecommerce/module/bag/controller/cart_controller.dart';
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/module/main/product_detail/widget/favorite_button.dart';
import 'package:fively_ecommerce/widget/custom_button.dart';
import 'package:fively_ecommerce/widget/outlined_button_custom.dart';
import 'package:fively_ecommerce/widget/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});
  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final List<Product> products =
        Provider.of<ProductListController>(context, listen: false).products;

    final Product product = products.firstWhere(
      (element) => element.id == id,
    );

    final CartController cartController =
        Provider.of<CartController>(context, listen: false);

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
              tag: product.id,
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
                    maxLines: 1,
                    text: TextSpan(
                      text: product.category,
                      style: const TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                            text: '\n${product.title}',
                            style: const TextStyle(
                                fontSize: 11, color: Color(0xFF9B9B9B))),
                      ],
                    ),
                  ),
                  Text('\$${product.price.ceilToDouble()}',
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700))
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
                product.description as String,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.03,
            ),
            SizedBox(
              height: bodyHeight * 0.01,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: bodyWidth * 0.04, vertical: bodyHeight * 0.03),
        child: CustomButton(
            function: () {
              cartController.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(snackBarMessage);
            },
            title: 'ADD TO CART',
            widthSize: bodyWidth * 0.91,
            heightSize: bodyHeight * 0.07),
      ),
    );
  }
}
