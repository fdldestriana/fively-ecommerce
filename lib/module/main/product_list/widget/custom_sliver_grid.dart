// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSliverGrid extends StatefulWidget {
  const CustomSliverGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSliverGrid> createState() => _CustomSliverGridState();
}

class _CustomSliverGridState extends State<CustomSliverGrid> {
  @override
  void didChangeDependencies() {
    Provider.of<ProductListController>(context, listen: false).getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListController>(
      builder: (BuildContext context, value, Widget? child) {
        List<Product> products = value.products;
        return SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              (index == 0) ? index = 11 : index;
              return ProductItem(product: products[index]);
            }), childCount: products.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.73,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2));
      },
    );
  }
}
