// import package
import 'package:flutter/material.dart';

class AddRemoveCartButton extends StatelessWidget {
  const AddRemoveCartButton({
    Key? key,
    required this.parentWidth,
    required this.parentHeight,
    required this.title,
    required this.function,
  }) : super(key: key);
  final double parentWidth;
  final double parentHeight;
  final String title;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: parentWidth * 0.10,
      height: parentHeight * 0.35,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF9B9B9B),
                blurRadius: parentWidth * 0.001,
                spreadRadius: parentWidth * 0.001,
                offset: Offset(0, parentWidth * 0.005))
          ]),
      child: IconButton(
        color: const Color(0xFFFFFFFF),
        icon: (title == 'Add')
            ? const Icon(
                Icons.add,
                color: Color(0xFF9B9B9B),
              )
            : const Icon(Icons.remove, color: Color(0xFF9B9B9B)),
        onPressed: function,
      ),
    );
  }
}
