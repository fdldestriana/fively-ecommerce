// import package
import 'package:fively_ecommerce/providers/product_provider.dart';
import 'package:fively_ecommerce/utils/size.dart';
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
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    // final bodyHeight = sizeConfig.screenHeight;
    return Consumer<ProductProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(bodyWidth * 0.03)),
                child: Image.network(
                  value.products[index].images,
                  fit: BoxFit.cover,
                ),
              );
            }), childCount: value.products.length ~/ 2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2));
      },
    );
  }
}
