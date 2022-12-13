import 'package:fively_ecommerce/utils/size.dart';
import 'package:flutter/material.dart';

class OutlinedButtonCustom extends StatelessWidget {
  const OutlinedButtonCustom({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bodyWidth * 0.02)),
            fixedSize: Size(bodyWidth * 0.37, bodyHeight * 0.06)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
            ),
            const Icon(
              Icons.arrow_drop_down_sharp,
            )
          ],
        ));
  }
}
