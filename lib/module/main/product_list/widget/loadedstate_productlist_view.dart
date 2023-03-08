import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/product_item.dart';
import 'package:flutter/material.dart';

class LoadedStateProductListView extends StatelessWidget {
  const LoadedStateProductListView({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(((context, index) {
          return ProductItem(product: products[index]);
        }), childCount: products.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.73,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2),
      ),
    );
  }
}
