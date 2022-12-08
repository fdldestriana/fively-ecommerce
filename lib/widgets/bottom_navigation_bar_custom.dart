import 'package:fively_ecommerce/pages/bag_page.dart';
import 'package:fively_ecommerce/pages/favorites_page.dart';
import 'package:fively_ecommerce/pages/main_page/main_page.dart';
import 'package:fively_ecommerce/pages/profile_page.dart';
import 'package:fively_ecommerce/pages/shop_page.dart';
import 'package:fively_ecommerce/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigationBarCustom extends StatefulWidget {
  BottomNavigationBarCustom({Key? key, required this.currentIndex})
      : super(key: key);
  int currentIndex = 0;

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  void _onTap(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).popAndPushNamed(MainPage.routeName);
        setState(() {
          widget.currentIndex = index;
        });
        break;
      case 1:
        Navigator.of(context).popAndPushNamed(ShopPage.routeName);
        setState(() {
          widget.currentIndex = index;
        });
        break;
      case 2:
        Navigator.of(context).popAndPushNamed(BagPage.routeName);
        setState(() {
          widget.currentIndex = index;
        });
        break;
      case 3:
        Navigator.of(context).popAndPushNamed(FavoritesPage.routeName);
        setState(() {
          widget.currentIndex = index;
        });
        break;
      case 4:
        Navigator.of(context).popAndPushNamed(ProfilePage.routeName);
        setState(() {
          widget.currentIndex = index;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: BottomNavigationBar(
          // using BottomNavigationBarType.fixed is to prevent the icon shift while selected
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFFFFF),
          items: bottomNavigationBarItem,
          currentIndex: widget.currentIndex,
          selectedLabelStyle: const TextStyle(color: Color(0xFFDB3022)),
          onTap: _onTap,
        ));
  }
}
