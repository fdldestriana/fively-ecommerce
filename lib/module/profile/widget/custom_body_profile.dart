import 'package:fively_ecommerce/module/profile/util/profile_map.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';

class CustomBodyProfile extends StatelessWidget {
  const CustomBodyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return ListView.builder(
        itemCount: profileMap.length,
        itemBuilder: (BuildContext _, int index) {
          return InkWell(
            onTap: () {},
            child: SizedBox(
              height: bodyHeight * 0.09,
              width: bodyWidth * 1.00,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: bodyWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '${profileMap.keys.elementAt(index)}\n',
                          style: const TextStyle(color: Colors.black)),
                      TextSpan(
                          text: profileMap.values.elementAt(index),
                          style: const TextStyle(color: Color(0xFF9B9B9B)))
                    ])),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF9B9B9B),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
