// import package
import 'package:fively_ecommerce/module/main/product_list/widget/error_state/errorstate_slivertoboxadapter.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/loading/loadingstate_sliverappbar.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/loaded/loadedstate_sliverappbar.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/loading/loadingstate_slivergrid.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/loaded/loadedstate_slivergrid.dart';
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/shared/widget/custom_bottom_navigation_bar.dart';
import 'package:fively_ecommerce/shared/utils/state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});
  static const routeName = 'product-list';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProductListView());
  }

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final int index = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => Provider.of<ProductListController>(context, listen: false)
            .getProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductListController>(
        builder: (_, value, __) {
          if (value.state == NotifierState.initial) {
            return const CustomScrollView(
              slivers: [LoadingStateSliverAppBar(), LoadingStateSliverGrid()],
            );
          }
          if (value.state == NotifierState.loading) {
            return const CustomScrollView(
              slivers: [LoadingStateSliverAppBar(), LoadingStateSliverGrid()],
            );
          } else {
            return value.data.fold(
              (failure) => CustomScrollView(
                slivers: [
                  ErrorStateSliverToBoxAdapter(message: failure.message)
                ],
              ),
              (products) => CustomScrollView(
                slivers: [
                  const LoadedStateSliverAppBar(),
                  LoadedStateSliverGrid(
                    products: products,
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: index,
      ),
    );
  }
}
