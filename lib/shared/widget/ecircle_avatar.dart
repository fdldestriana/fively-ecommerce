import 'package:flutter/material.dart';

class ECircleAvatar extends StatelessWidget {
  const ECircleAvatar(
      {super.key,
      required this.avatarRadius,
      required this.iconSize,
      required this.bgCircleAvatar,
      required this.bgIcon,
      required this.icon});
  final double avatarRadius;
  final double iconSize;
  final Color bgCircleAvatar;
  final Color bgIcon;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: avatarRadius,
      backgroundColor: bgCircleAvatar,
      child: Icon(
        size: iconSize,
        icon,
        color: bgIcon,
      ),
    );
  }
}
