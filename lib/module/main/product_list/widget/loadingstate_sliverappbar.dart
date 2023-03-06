import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingStateSliverAppBar extends StatelessWidget {
  const LoadingStateSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyHeight = sizeConfig.screenHeight;
    return SliverAppBar(
      key: UniqueKey(),
      backgroundColor: Colors.black.withOpacity(0.04),
      automaticallyImplyLeading: false,
      expandedHeight: bodyHeight * 0.91,
    ).animate().fade(duration: 850.ms);
  }
}
