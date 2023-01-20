// import package
import 'package:fively_ecommerce/model/cart/product_cart.dart';
import 'package:fively_ecommerce/module/bag/controller/cart_controller.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/module/bag/widget/add_remove_cart_button.dart';
import 'package:fively_ecommerce/module/bag/widget/pop_up_menu_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCartItem extends StatefulWidget {
  const ProductCartItem({
    Key? key,
    required this.productCart,
  }) : super(key: key);

  final ProductCart productCart;

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
                    // TO BE EDITED IN THE FUTURE
                    "https://api.lorem.space/image/watch?w=640&h=480&r=10",
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
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                height: constraints.maxHeight * 0.14,
                              ),
                            ),
                            Text(
                              widget.productCart.title,
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
                              widget.productCart.title,
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
                              Consumer<CartController>(
                                builder: (_, value, __) {
                                  return AddRemoveCartButton(
                                    function: (widget.productCart.quantity == 1)
                                        ? null
                                        : () {
                                            setState(() {
                                              value.removeQuantity(
                                                  widget.productCart.id);
                                            });
                                          },
                                    parentHeight: constraints.maxHeight,
                                    parentWidth: constraints.maxWidth,
                                    title: 'Remove',
                                  );
                                },
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.03,
                              ),
                              Text(widget.productCart.quantity.toString()),
                              SizedBox(
                                width: constraints.maxWidth * 0.03,
                              ),
                              Consumer<CartController>(
                                builder: (_, value, __) {
                                  return AddRemoveCartButton(
                                    function: () {
                                      setState(() {
                                        value
                                            .addQuantity(widget.productCart.id);
                                      });
                                    },
                                    parentHeight: constraints.maxHeight,
                                    parentWidth: constraints.maxWidth,
                                    title: 'Add',
                                  );
                                },
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.11,
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  '${(widget.productCart.price * widget.productCart.quantity).toStringAsFixed(1)}\$',
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // PopUpMenuButtonCustom(
                //   parentHeight: constraints.maxHeight,
                //   parentWidth: constraints.maxWidth,
                //   product: widget.productCart['product'],
                // )
              ]);
        },
      ),
    );
  }
}
