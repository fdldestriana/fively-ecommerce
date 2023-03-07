// import package
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';

class LoadingStateSliverAppBar extends StatelessWidget {
  const LoadingStateSliverAppBar({
    Key? key,
  }) : super(key: key);

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
      expandedHeight: bodyHeight * 0.91,
      flexibleSpace: Align(
        alignment: Alignment.bottomLeft,
        child: FlexibleSpaceBar(
          background: Container(
            color: Colors.black.withOpacity(0.04),
          ),
        ),
      ),
    );
  }
}
