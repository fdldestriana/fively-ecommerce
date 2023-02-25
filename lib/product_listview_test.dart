import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/product_item.dart';
import 'package:flutter/material.dart';

class ProductListViewTest extends StatelessWidget {
  ProductListViewTest({super.key});

  final List<Product> products = [
    Product(
        id: 1,
        title: 'iPhone 9',
        price: 549,
        images: 'https://i.dummyjson.com/data/products/1/1.jpg'),
    Product(
        id: 2,
        title: 'iPhone 10',
        price: 459,
        images: 'https://i.dummyjson.com/data/products/1/2.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.73,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2),
          children: [
            ...List.generate(
              products.length,
              (index) => ProductItem(product: products[index]),
            )
          ],
        ),
      ),
    );
  }
}
