// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/view/errorstate_productlist_view.dart';
import 'package:fively_ecommerce/module/main/product_list/view/loadedstate_productlist_view.dart';
import 'package:fively_ecommerce/module/main/product_list/view/loadingstate_productlist_view.dart';
import 'package:fively_ecommerce/shared/utils/state.dart';
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
  void initState() {
    Provider.of<ProductListController>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListController>(
      builder: (BuildContext _, value, Widget? __) {
        List<Product> products = value.products;
        if (value.state == DataState.loading) {
          return const LoadingStateProductListView();
        } else if (value.state == DataState.notLoaded) {
          return ErrorStateProductListView(
            message: value.failure.message,
          );
        } else {
          return LoadedStateProductListView(products: products);
        }
      },
    );
  }
}
