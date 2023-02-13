import 'package:flutter/material.dart';

class CustomAppBarLogin extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFF9F9F9),
      leading: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.transparent),
            backgroundColor: const Color(0xFFF9F9F9)),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
