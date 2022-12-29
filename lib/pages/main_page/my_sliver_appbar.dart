// import package
import 'package:fively_ecommerce/shared/utils/size.dart';
// import 'package:fively_ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return SliverAppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bodyHeight * 0.11),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: RichText(
            text: const TextSpan(
              text: 'New',
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 34,
                  fontWeight: FontWeight.w700),
              children: <TextSpan>[
                TextSpan(
                    text: '\nYou\'ve never seen it before',
                    style: TextStyle(fontSize: 11, color: Color(0xFF9B9B9B))),
              ],
            ),
          ),
          backgroundColor: const Color(0xFFF9F9F9),
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ))
          ],
        ),
      ),
      pinned: false,
      expandedHeight: bodyHeight * 0.80,
      flexibleSpace: Align(
        alignment: Alignment.bottomLeft,
        child: FlexibleSpaceBar(
          titlePadding: EdgeInsetsDirectional.only(
              start: bodyWidth * 0.03, bottom: bodyHeight * 0.10),
          background: Image.asset(
            'assets/images/banner/watch_banner.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
