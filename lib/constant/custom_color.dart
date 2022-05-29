import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._(); // this basically makes it so you can instantiate this class

  static const _bluePrimaryValue = 0xff303FAC;

  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE8EAF6),
      100: Color(0xFFC5CAE9),
      200: Color(0xFF9FA8DA),
      300: Color(0xFF7986CB),
      400: Color(0xFF5C6BC0),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF3F51B5),
      700: Color(0xFF3949AB),
      800: Color(0xFF303F9F),
      900: Color(0xFF283593),
    },
  );
}
