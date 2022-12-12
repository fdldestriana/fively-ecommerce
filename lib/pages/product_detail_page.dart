// import package
import 'package:fively_ecommerce/models/product.dart';
import 'package:fively_ecommerce/providers/product_provider.dart';
import 'package:fively_ecommerce/utils/size.dart';
import 'package:fively_ecommerce/widgets/custom_button.dart';
import 'package:fively_ecommerce/widgets/favorite_button.dart';
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
        Provider.of<ProductProvider>(context, listen: false).products;
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
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(bodyWidth * 0.02)),
                          fixedSize: Size(bodyWidth * 0.37, bodyHeight * 0.06)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            'Size',
                          ),
                          Icon(Icons.arrow_drop_down_sharp,
                              color: Color(0xFF222222))
                        ],
                      )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(bodyWidth * 0.02)),
                          fixedSize: Size(bodyWidth * 0.37, bodyHeight * 0.06)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            'Color',
                          ),
                          Icon(Icons.arrow_drop_down_sharp,
                              color: Color(0xFF222222))
                        ],
                      )),
                  SizedBox(
                    width: bodyWidth * 0.11,
                    height: bodyHeight * 0.06,
                    child: LayoutBuilder(
                      builder: (_, constraint) => FavoriteButton(
                        parentWidth: constraint.maxWidth,
                        parentHeight: constraint.maxHeight,
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
                            fontSize: 24, fontWeight: FontWeight.w700),
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
