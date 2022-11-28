// import package
import 'package:fively_ecommerce/utils/size.dart';
import 'package:fively_ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const routeName = 'main';

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          MySliverAppBar(bodyHeight: bodyHeight, bodyWidth: bodyWidth),
          const SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: MySliverGrid(),
          )
        ],
      ),
    );
  }
}

class MySliverGrid extends StatelessWidget {
  const MySliverGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(((context, index) {
          return Container(
            // margin: const EdgeInsets.all(10),
            color: Colors.amber,
          );
        }), childCount: 100),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2));
  }
}

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    Key? key,
    required this.bodyHeight,
    required this.bodyWidth,
  }) : super(key: key);

  final double bodyHeight;
  final double bodyWidth;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xFFDB3022),
      pinned: false,
      expandedHeight: bodyHeight * 0.61,
      flexibleSpace: Align(
        alignment: Alignment.bottomLeft,
        child: FlexibleSpaceBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fashion sale',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              CustomButton(
                  title: 'Check',
                  widthSize: bodyWidth * 0.33,
                  heightSize: bodyHeight * 0.04)
            ],
          ),
          background: Image.asset(
            'assets/images/banner/big_banner.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
