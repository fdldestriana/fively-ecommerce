import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.widthSize,
      required this.heightSize,
      required this.function});
  final String title;
  final double widthSize;
  final double heightSize;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize,
      height: heightSize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: const Color(0xFFDB3022)),
        onPressed: (function != null) ? function : null,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
