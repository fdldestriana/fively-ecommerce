// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/product_item.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';

class CustomSliverGrid extends StatefulWidget {
  const CustomSliverGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSliverGrid> createState() => _CustomSliverGridState();
}

class _CustomSliverGridState extends State<CustomSliverGrid> {
  @override
  void initState() {
    Provider.of<ProductListController>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListController>(
      builder: (BuildContext _, value, Widget? __) {
        List<Product> products = value.products;
        if (value.state == NotifierState.loading) {
          return const LoadingStateProductList();
        } else if (value.failure.message.isNotEmpty &&
            value.failure.message != 'message') {
          return ErrorStateProductList(
            message: value.failure.message,
          );
        } else {
          return LoadedStateProductList(products: products);
        }
      },
    );
  }
}

class LoadedStateProductList extends StatelessWidget {
  const LoadedStateProductList({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(((context, index) {
          return ProductItem(product: products[index]);
        }), childCount: products.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.73,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2));
  }
}

class ErrorStateProductList extends StatelessWidget {
  const ErrorStateProductList({Key? key, required this.message})
      : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
          child: Center(
        child: Text(
          message,
          style: const TextStyle(backgroundColor: Colors.red, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}

class LoadingStateProductList extends StatelessWidget {
  const LoadingStateProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return const SliverToBoxAdapter(
        child: Center(
      child: CircularProgressIndicator(
        color: Colors.red,
        backgroundColor: Color(0xFFFFFFFF),
      ),
    ));
  }
}
