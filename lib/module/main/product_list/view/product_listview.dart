// import package
import 'package:fively_ecommerce/module/main/product_list/controller/product_list_controller.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/error_state/errorstate_slivertoboxadapter.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/loaded/loadedstate_slivergrid.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/loaded/loadedstate_sliverappbar.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/loading/loadingstate_sliverappbar.dart';
import 'package:fively_ecommerce/module/main/product_list/widget/loading/loadingstate_slivergrid.dart';
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
          List<Widget> loading = const [
            LoadingStateSliverAppBar(),
            LoadingStateSliverGrid()
          ];
          List<Widget> loaded = [
            const LoadedStateSliverAppBar(),
            LoadedStateSliverGrid(
              products: value.products,
            ),
          ];
          List<Widget> error = [
            ErrorStateSliverToBoxAdapter(message: value.failure.message)
          ];
          List<Widget> slivers;
          if (value.state == DataState.initial ||
              value.state == DataState.loading) {
            slivers = loading;
          } else if (value.state == DataState.loaded) {
            slivers = loaded;
          } else {
            slivers = error;
          }
          return CustomScrollView(slivers: slivers);
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: index,
      ),
    );
  }
}
