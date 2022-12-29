import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static Orientation? orientation;

  init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    orientation = _mediaQueryData!.orientation;
  }

  double get screenHeight =>
      _mediaQueryData!.size.height - _mediaQueryData!.padding.top;

  double get screenWidth => _mediaQueryData!.size.width;
}
