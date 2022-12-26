import 'package:flutter/material.dart';

class AddToBagButton extends StatelessWidget {
  const AddToBagButton({
    Key? key,
    required this.parentHeight,
    required this.parentWidth,
  }) : super(key: key);

  final double parentHeight;
  final double parentWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: parentHeight * 0.35,
        width: parentWidth * 0.10,
        decoration: const BoxDecoration(
          color: Color(0xFFDB3022),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Image.asset('assets/images/buttons/add_to_bag.png'),
          iconSize: parentWidth * 0.07,
          onPressed: () {},
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
