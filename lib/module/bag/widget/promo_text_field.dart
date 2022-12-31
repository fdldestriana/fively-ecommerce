// import package
import 'package:flutter/material.dart';

class PromoTextField extends StatelessWidget {
  const PromoTextField(
      {super.key, required this.parentHeight, required this.parentWidth});
  final double parentHeight;
  final double parentWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      height: parentHeight * 0.15,
      width: parentWidth * 0.91,
      child: const TextField(),
    );
  }
}
