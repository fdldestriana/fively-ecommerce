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
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(parentWidth * 0.02))),
      height: parentHeight * 0.20,
      width: parentWidth * 0.91,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Enter your promo code',
            suffixIcon: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF222222),
                    shape: const CircleBorder()),
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFFFFFFFF),
                ))),
      ),
    );
  }
}
