import 'package:fively_ecommerce/module/main/product_list/widget/loadingstate_slivergrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingStateProductListView extends StatelessWidget {
  const LoadingStateProductListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(((context, index) {
          return const LoadingStateSliverGrid()
              .animate()
              .fade(duration: 850.ms);
        }), childCount: 6),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.73,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2),
      ),
    );
  }
}
