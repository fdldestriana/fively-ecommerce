// import package
import 'package:fively_ecommerce/module/main/product_list/widget/loading_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

class LoadingStateSliverGrid extends StatefulWidget {
  const LoadingStateSliverGrid({Key? key}) : super(key: key);

  @override
  State<LoadingStateSliverGrid> createState() => _LoadingStateSliverGridState();
}

class _LoadingStateSliverGridState extends State<LoadingStateSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(((context, index) {
          return Animate(
              child: const LoadingWidget().animate().shimmer(
                  blendMode: BlendMode.srcATop,
                  colors: const [
                    Color(0xFFEBEBF4),
                    Color(0xFFF4F4F4),
                    Color(0xFFEBEBF4),
                  ],
                  // color: Colors.grey[100],
                  duration: 2.seconds));
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
