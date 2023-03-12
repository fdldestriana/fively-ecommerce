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
      backgroundColor: const Color(0xFFEBEBF4),
      automaticallyImplyLeading: false,
      pinned: false,
      expandedHeight: bodyHeight * 0.71,
      flexibleSpace: Align(
        alignment: Alignment.bottomLeft,
        child: FlexibleSpaceBar(
          background: Animate(
            child: Container(
              color: Colors.black.withOpacity(0.04),
            ).animate().shimmer(
                blendMode: BlendMode.srcATop,
                colors: const [
                  Color(0xFFEBEBF4),
                  Color(0xFFF4F4F4),
                  Color(0xFFEBEBF4),
                ],
                duration: 2.seconds),
          ),
        ),
      ),
    );
  }
}
