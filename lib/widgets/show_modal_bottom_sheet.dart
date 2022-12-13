import 'package:fively_ecommerce/utils/size.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bodyWidth * 0.09),
              topRight: Radius.circular(bodyWidth * 0.09))),
      width: bodyWidth * 1.00,
      height: bodyHeight * 0.48,
      child: LayoutBuilder(
          builder: (_, constraint) => Column(
                children: [
                  SizedBox(
                    height: constraint.maxHeight * 0.04,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF979797),
                        borderRadius: BorderRadius.all(
                            Radius.circular(constraint.maxHeight * 0.01))),
                    height: constraint.maxHeight * 0.02,
                    width: constraint.maxWidth * 0.16,
                  ),
                ],
              )),
    );
  }
}
