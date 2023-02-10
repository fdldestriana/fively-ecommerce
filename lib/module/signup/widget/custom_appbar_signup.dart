import 'package:flutter/material.dart';

class CustomAppBarSignup extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarSignup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFF9F9F9),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
