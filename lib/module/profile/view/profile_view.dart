// import package
import 'package:fively_ecommerce/module/profile/widget/custom_appbar_profile.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/widget/bottom_navigation_bar_custom.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  final int index = 4;
  static const routeName = 'profile';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProfileView());
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return Scaffold(
      appBar: const CustomAppBarProfile(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: bodyWidth * 0.04),
            child: const Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Metropolis-Bold'),
            ),
          ),
          SizedBox(
            height: bodyHeight * 0.03,
          ),
          Padding(padding: EdgeInsets.only(left: bodyWidth * 0.04))
        ],
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        initialIndex: index,
      ),
    );
  }
}
