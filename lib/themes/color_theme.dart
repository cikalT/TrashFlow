import 'package:flutter/material.dart';

class ColorTheme {
  // Main
  static const int _colorPrimaryValue = 0xFF6263F2;
  static MaterialColor get primaryMaterialColor => const MaterialColor(
        _colorPrimaryValue,
        <int, Color>{
          50: Color(0xFFecebff),
          100: Color(0xFFcdcfff),
          200: Color(0xFF9a9aef),
          300: Color(0xFF7375e5),
          400: Color(0xFF505bef),
          500: Color(0xFF6263F2),
          600: Color(0xFF3535e5),
          700: Color(0xFF372fd3),
          800: Color(0xFF2835c6),
          900: Color(0xFF1c1cb7),
        },
      );
  static Color get primaryColor => HexColor('214E4B');
  static Color get accentColor => HexColor('A4DA22');
  static Color get whiteColor => Colors.white;
  static Color get blackColor => Colors.black;
  static Color get boxColor => HexColor('EFF0F6');
  static Color get lightGreyColor => HexColor('F4F5FA');
  static Color get headerFontColor => HexColor('6E7191');
  static Color get darkGreyColor => HexColor('414141');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
