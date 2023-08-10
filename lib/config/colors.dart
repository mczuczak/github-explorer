import 'package:flutter/material.dart';

class ConfigColors {
  ConfigColors._();

  static const Color main = Color(0xFF24292F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFFF2F4F7);

  static const Color paleSky = Color(0xFF667085);
  static const Color mischka = Color(0xFFD0D5DD);

  static const Color azure = Color(0xFF008AFF);
  static const Color caribbeanGreen = Color(0xFF0EBB91);
  static const Color slateBlue = Color(0xFF7155D3);
  static const Color pastelRed = Color(0xFFFF5F66);

  //SWATCHES

  static const Map<int, Color> mainSwatch = <int, Color>{
    50: Color.fromRGBO(36, 41, 47, .1),
    100: Color.fromRGBO(36, 41, 47, .2),
    200: Color.fromRGBO(36, 41, 47, .3),
    300: Color.fromRGBO(36, 41, 47, .4),
    400: Color.fromRGBO(36, 41, 47, .5),
    500: Color.fromRGBO(36, 41, 47, .6),
    600: Color.fromRGBO(36, 41, 47, .7),
    700: Color.fromRGBO(36, 41, 47, .8),
    800: Color.fromRGBO(36, 41, 47, .9),
    900: Color.fromRGBO(36, 41, 47, 1),
  };
}
