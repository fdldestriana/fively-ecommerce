// import package
import 'package:fively_ecommerce/model/product.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/module/bag/widget/add_remove_cart_button.dart';
import 'package:fively_ecommerce/module/bag/widget/pop_up_menu_button_custom.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCartItem extends StatefulWidget {
  ProductCartItem({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  int quantity;

  @override
  State<ProductCartItem> createState() => _ProductCartItemState();
}

class _ProductCartItemState extends State<ProductCartItem> {
  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(bodyWidth * 0.03)),
        color: const Color(0xFFFFFFFF),
      ),
      height: bodyHeight * 0.14,
      width: bodyWidth * 0.91,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    widget.product.images,
                    alignment: Alignment.centerLeft,
                    width: constraints.maxWidth * 0.30,
                    height: constraints.maxHeight * 1.00,
                    fit: BoxFit.fill,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.03,
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * 0.14,
                            ),
                            Text(
                              widget.product.title,
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 11,
                                  color: Color(0xFF9B9B9B)),
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.03,
                            ),
                            Text(
                              widget.product.title,
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 15,
                                  color: Color(0xFF222222)),
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.06,
                            ),
                            Row(
                              children: [
                                const Text('Color: '),
                                SizedBox(
                                  width: constraints.maxWidth * 0.07,
                                ),
                                const Text('Size: ')
                              ],
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.08,
                            ),
                            Row(children: [
                              AddRemoveCartButton(
                                function: (widget.quantity == 1)
                                    ? null
                                    : () {
                                        setState(() {
                                          widget.quantity--;
                                        });
                                      },
                                parentHeight: constraints.maxHeight,
                                parentWidth: constraints.maxWidth,
                                title: 'Remove',
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.03,
                              ),
                              Text(widget.quantity.toString()),
                              SizedBox(
                                width: constraints.maxWidth * 0.03,
                              ),
                              AddRemoveCartButton(
                                function: () {
                                  setState(() {
                                    widget.quantity++;
                                  });
                                },
                                parentHeight: constraints.maxHeight,
                                parentWidth: constraints.maxWidth,
                                title: 'Add',
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.12,
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  '${(widget.product.price * widget.quantity).toStringAsFixed(1)}\$',
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF222222)),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PopUpMenuButtonCustom(
                  parentHeight: constraints.maxHeight,
                  parentWidth: constraints.maxWidth,
                  product: widget.product,
                )
              ]);
        },
      ),
    );
  }
}
