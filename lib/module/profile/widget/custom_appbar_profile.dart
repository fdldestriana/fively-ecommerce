import 'package:fively_ecommerce/shared/utils/size.dart';
import 'package:flutter/material.dart';

class CustomAppBarProfile extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyHeight = sizeConfig.screenHeight;
    // final bodyWidth = sizeConfig.screenWidth;

    return PreferredSize(
        preferredSize: Size.fromHeight(bodyHeight * 0.71),
        child: AppBar(
          backgroundColor: const Color(0xFFF9F9F9),
          elevation: 0,
          title: Column(
            children: [
              const Text(
                'My Profile',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Metropolis-Bold'),
              ),
              SizedBox(
                height: bodyHeight * 0.03,
              ),
              ListTile(
                leading: CircleAvatar(
                  minRadius: bodyHeight * 0.08,
                  maxRadius: bodyHeight * 0.08,
                ),
                title: const Text('Matilda Brown'),
                subtitle: const Text('matildabrown@gmail.com'),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ));

    //   AppBar(
    //     actions: [
    //       IconButton(
    //         icon: const Icon(Icons.search),
    //         onPressed: () {},
    //       )
    //     ],
    //     backgroundColor: const Color(0xFFF9F9F9),
    //     flexibleSpace: Column(
    //       children: [
    //         const Text(
    //           'My Profile',
    //           style: TextStyle(
    //               fontSize: 34,
    //               fontWeight: FontWeight.w500,
    //               fontFamily: 'Metropolis-Bold'),
    //         ),
    //         SizedBox(
    //           height: bodyHeight * 0.03,
    //         ),
    //         ListTile(
    //           leading: CircleAvatar(
    //             minRadius: bodyHeight * 0.08,
    //             maxRadius: bodyHeight * 0.08,
    //           ),
    //           title: const Text('Matilda Brown'),
    //           subtitle: const Text('matildabrown@gmail.com'),
    //         ),
    //       ],
    //     ),
    //     elevation: 0,
    //   );
    // }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
