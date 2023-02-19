// This list is gonna use in BottomNavigationBarCustom widget
import 'package:flutter/material.dart';

final List<String> bottomTab = [
  'assets/images/buttons/bottom_navigation_bar/home',
  'assets/images/buttons/bottom_navigation_bar/shop',
  'assets/images/buttons/bottom_navigation_bar/bag',
  'assets/images/buttons/bottom_navigation_bar/favorites',
  'assets/images/buttons/bottom_navigation_bar/profile'
];

final List<BottomNavigationBarItem> bottomNavigationBarItem = [
  // using suffix _inactive.png and activated.png is because the selected
  // icon's color doesnt changing while the button is tapped automatically
  BottomNavigationBarItem(
      activeIcon: Image.asset('${bottomTab[0]}_activated.png'),
      icon: Image.asset('${bottomTab[0]}_inactive.png'),
      label: 'Home'),
  BottomNavigationBarItem(
      activeIcon: Image.asset('${bottomTab[1]}_activated.png'),
      icon: Image.asset('${bottomTab[1]}_inactive.png'),
      label: 'Shop'),
  BottomNavigationBarItem(
      activeIcon: Image.asset('${bottomTab[2]}_activated.png'),
      icon: Image.asset('${bottomTab[2]}_inactive.png'),
      label: 'Bag'),
  BottomNavigationBarItem(
      activeIcon: Image.asset('${bottomTab[3]}_activated.png'),
      icon: Image.asset('${bottomTab[3]}_inactive.png'),
      label: 'Favorites'),
  BottomNavigationBarItem(
      activeIcon: Image.asset('${bottomTab[4]}_activated.png'),
      icon: Image.asset('${bottomTab[4]}_inactive.png'),
      label: 'Profile')
];
