// import package
import 'package:fively_ecommerce/module/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppbarProfile extends StatelessWidget implements PreferredSize {
  const CustomAppbarProfile(
      {super.key, required this.bodyHeight, required this.bodyWidth});

  final double bodyHeight;
  final double bodyWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      backgroundColor: const Color(0xFFF9F9F9),
      centerTitle: false,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size(bodyWidth * 1.00, bodyHeight * 0.1),
        child: Padding(
          padding: EdgeInsets.only(left: bodyWidth * 0.05),
          child: Consumer<ProfileController>(
            builder: (context, value, child) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      minRadius: bodyHeight * 0.05,
                      maxRadius: bodyHeight * 0.05,
                      child: ClipRRect(
                        child: Image.network(
                          '${value.userCredential?.user?.photoURL}',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: bodyWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${value.userCredential?.user?.displayName}'),
                        const SizedBox(height: 10),
                        Text('${value.userCredential?.user?.email}'),
                      ],
                    ),
                  ]);
            },
          ),
        ),
      ),
      title: const Text(
        'My Profile',
        style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w500,
            fontFamily: 'Metropolis-Bold'),
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(bodyHeight * 0.21);
}
