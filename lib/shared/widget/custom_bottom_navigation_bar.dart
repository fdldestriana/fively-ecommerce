// import package
import 'package:fively_ecommerce/shared/widget/bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFFFFFFFF),
          currentIndex: currentIndex,
          items: bottomNavigationBarItem,
          onTap: (int index) {
            /*
            This code below is used to prevent the user to navigate to the 
            already opened view/page
            */
            if (index != currentIndex) {
              Navigator.pushReplacementNamed(context, '/', arguments: index);
            }
          },
          selectedLabelStyle: const TextStyle(color: Color(0xFFDB3022)),
          // Using BottomNavigationBarType.fixed is to prevent the icon shift while selected
          type: BottomNavigationBarType.fixed,
        ));
  }
}
