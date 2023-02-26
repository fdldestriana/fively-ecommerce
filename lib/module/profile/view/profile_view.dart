// import package
import 'package:fively_ecommerce/module/profile/widget/custom_appbar_profile.dart';
import 'package:fively_ecommerce/module/profile/widget/custom_body_profile.dart';
import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:fively_ecommerce/shared/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  final int index = 4;
  static const routeName = 'profile';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProfileView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyHeight = sizeConfig.screenHeight;
    final bodyWidth = sizeConfig.screenWidth;
    return Scaffold(
      appBar: CustomAppbarProfile(
        bodyHeight: bodyHeight,
        bodyWidth: bodyWidth,
      ),
      body: const CustomBodyProfile(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: index,
      ),
    );
  }
}
