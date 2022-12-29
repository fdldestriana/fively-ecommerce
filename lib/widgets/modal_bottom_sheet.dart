import 'package:fively_ecommerce/model/product_color.dart';
import 'package:fively_ecommerce/model/product_size.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
// import 'package:fively_ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
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

    List<String?> sizeValue = [];
    for (var size in ProductSize.values) {
      sizeValue.add(size.toString().split('.').elementAt(1));
    }

    List<String?> colorValue = [];
    for (var color in ProductColor.values) {
      colorValue.add(color.toString().split('.').elementAt(1));
    }
    final choosen = (title == 'Size') ? sizeValue : colorValue;
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bodyWidth * 0.09),
              topRight: Radius.circular(bodyWidth * 0.09))),
      width: bodyWidth * 1.00,
      height: bodyHeight * 0.48,
      child: LayoutBuilder(
          builder: (context, constraint) => Column(
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
                  SizedBox(
                    height: constraint.maxHeight * 0.04,
                  ),
                  Text(
                    'Select ${title.toLowerCase()}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: constraint.maxHeight * 0.06,
                  ),
                  SizedBox(
                    height: constraint.maxHeight * 0.27,
                    width: constraint.maxWidth * 1.00,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: constraint.maxWidth * 0.04,
                          right: constraint.maxWidth * 0.04),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2.5,
                          crossAxisCount: 3,
                          mainAxisSpacing: constraint.minHeight * 0.04,
                          crossAxisSpacing: constraint.maxWidth * 0.06,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context, choosen[index]);
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      constraint.maxWidth * 0.02)),
                            ),
                            child: Text('${choosen[index]?.toUpperCase()}'),
                          );
                        },
                        itemCount: choosen.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraint.maxHeight * 0.07,
                  ),
                  const Divider(
                    color: Color(0xFF9B9B9B),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Size info'),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: constraint.maxWidth * 0.04,
                            )
                          ])),
                  const Divider(
                    color: Color(0xFF9B9B9B),
                  ),
                  SizedBox(
                    height: constraint.maxHeight * 0.08,
                  ),
                  // CustomButton(
                  //     title: 'ADD TO CART',
                  //     widthSize: constraint.maxWidth * 0.91,
                  //     heightSize: constraint.maxHeight * 0.13)
                ],
              )),
    );
  }
}
