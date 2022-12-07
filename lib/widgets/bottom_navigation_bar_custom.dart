import 'package:fively_ecommerce/pages/bag_page.dart';
import 'package:fively_ecommerce/pages/favorites_page.dart';
import 'package:fively_ecommerce/pages/main_page/main_page.dart';
import 'package:fively_ecommerce/pages/profile_page.dart';
import 'package:fively_ecommerce/pages/shop_page.dart';
import 'package:fively_ecommerce/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: BottomNavigationBar(
          // using BottomNavigationBarType.fixed is to prevent the icon shift while selected
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFFFFF),
          items: bottomNavigationBarItem,
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(color: Color(0xFFDB3022)),
          onTap: (currentIndex) {
            switch (currentIndex) {
              case 0:
                Navigator.of(context).popAndPushNamed(MainPage.routeName);
                setState(() {
                  currentIndex = currentIndex;
                });
                break;
              case 1:
                Navigator.of(context).popAndPushNamed(ShopPage.routeName);
                setState(() {
                  currentIndex = currentIndex;
                });
                break;
              case 2:
                Navigator.of(context).popAndPushNamed(BagPage.routeName);
                setState(() {
                  currentIndex = currentIndex;
                });
                break;
              case 3:
                Navigator.of(context).popAndPushNamed(FavoritesPage.routeName);
                setState(() {
                  currentIndex = currentIndex;
                });
                break;
              case 4:
                Navigator.of(context).popAndPushNamed(ProfilePage.routeName);
                setState(() {
                  currentIndex = currentIndex;
                });
                break;
            }
          },
        ));
  }
}
