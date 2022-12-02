// import package
import 'package:fively_ecommerce/models/product.dart';
import 'package:fively_ecommerce/providers/product_provider.dart';
import 'package:fively_ecommerce/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySliverGrid extends StatefulWidget {
  const MySliverGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<MySliverGrid> createState() => _MySliverGridState();
}

class _MySliverGridState extends State<MySliverGrid> {
  @override
  void didChangeDependencies() {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, value, Widget? child) {
        List<Product> products = value.products;
        return SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return ProductItem(product: products[index]);
            }), childCount: value.products.length ~/ 2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.73,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2));
      },
    );
  }
}
