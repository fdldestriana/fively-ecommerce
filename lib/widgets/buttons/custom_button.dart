import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.widthSize,
      required this.heightSize});
  final String title;
  final double widthSize;
  final double heightSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize,
      height: heightSize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: const Color(0xFFDB3022)),
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
