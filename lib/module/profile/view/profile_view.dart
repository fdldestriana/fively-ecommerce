// import package
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(bodyHeight * 0.21),
        child: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          backgroundColor: const Color(0xFFF9F9F9),
          centerTitle: false,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            title: ListTile(
              leading: CircleAvatar(
                minRadius: bodyHeight * 0.08,
                maxRadius: bodyHeight * 0.08,
              ),
              title: const Text('Matilda Brown'),
              subtitle: const Text('matildabrown@gmail.com'),
            ),
          ),
          title: const Text(
            'My Profile',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                fontFamily: 'Metropolis-Bold'),
          ),
        ),
      ),
      body: const CustomBodyProfile(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: index,
      ),
    );
  }
}
