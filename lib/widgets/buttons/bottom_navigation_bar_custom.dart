// import package
import 'package:fively_ecommerce/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigationBarCustom extends StatelessWidget {
  const BottomNavigationBarCustom({Key? key, required this.initialIndex})
      : super(key: key);

  final int initialIndex;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: BottomNavigationBar(
          // using BottomNavigationBarType.fixed is to prevent the icon shift while selected
          currentIndex: initialIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFFFFF),
          items: bottomNavigationBarItem,
          selectedLabelStyle: const TextStyle(color: Color(0xFFDB3022)),
          onTap: (int index) {
            Navigator.pushNamed(context, '/', arguments: index);
          },
        ));
  }
}
