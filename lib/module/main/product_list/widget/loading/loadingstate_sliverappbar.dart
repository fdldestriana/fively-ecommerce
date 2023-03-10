// import package
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

class LoadingStateSliverAppBar extends StatefulWidget {
  const LoadingStateSliverAppBar({Key? key}) : super(key: key);

  @override
  State<LoadingStateSliverAppBar> createState() =>
      _LoadingStateSliverAppBarState();
}

class _LoadingStateSliverAppBarState extends State<LoadingStateSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyHeight = sizeConfig.screenHeight;
    return SliverAppBar(
      backgroundColor: Colors.black.withOpacity(0.04),
      foregroundColor: Colors.black.withOpacity(0.04),
      automaticallyImplyLeading: false,
      pinned: false,
      expandedHeight: bodyHeight * 0.71,
      flexibleSpace: Align(
        alignment: Alignment.bottomLeft,
        child: FlexibleSpaceBar(
          background: Animate(
            child: Container(
              color: Colors.black.withOpacity(0.04),
            ).animate().shimmer(color: Colors.white, duration: 20.seconds),
          ),
        ),
      ),
    );
  }
}
