// import package
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingStateSliverGrid extends StatefulWidget {
  const LoadingStateSliverGrid({Key? key}) : super(key: key);

  @override
  State<LoadingStateSliverGrid> createState() => _LoadingStateSliverGridState();
}

class _LoadingStateSliverGridState extends State<LoadingStateSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 5),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(((context, index) {
          return Animate(
              child: const LoadingWidget().animate().shimmer(duration: 3.ms));
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

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return SizedBox(
      width: bodyWidth * 0.40,
      height: bodyHeight * 0.34,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.04),
                        ),
                        width: constraints.maxWidth * 1.00,
                        height: constraints.maxHeight * 0.71,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                    4,
                    (index) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: constraints.maxHeight * 0.01,
                          bottom: constraints.maxHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black.withOpacity(0.04),
                        ),
                        width: constraints.maxWidth * 1.00,
                        height: constraints.maxHeight * 0.05,
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}