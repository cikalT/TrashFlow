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
  static Color get greyColor => HexColor('828282');
  static Color get lightGreyColor => HexColor('F4F5FA');
  static Color get redColor => HexColor('C30052');
  static Color get redPinkyColor => HexColor('ED2E7E');
  static Color get greenColor => HexColor('00966D');
  static Color get oceanGreenColor => HexColor('00BA88');
  static Color get cyanColor => HexColor('499FCB');
  static Color get yellowColor => HexColor('FFA300');
  static Color get darkYellowColor => HexColor('FFAA00');
  static Color get blueColor => HexColor('1F96F3');
  static Color get whiteColor => Colors.white;
  static Color get blackColor => Colors.black;
  static Color get darkGreyColor => HexColor('414141');
  static Color get orangeColor => HexColor('FF6E00');
  static Color get purpleColor => HexColor('B98FE6');
  static Color get darkPurpleColor => HexColor('5D46A1');
  static Color get brownColor => HexColor('946200');
  static Color get darkBrownColor => HexColor('5C3D00');
  static Color get pinkColor => HexColor('FF0E73');
  static Color get headerGreyColor => HexColor('DCE3E5');
  static Color get tealColor => HexColor('00bcd4');
  static Color get greyPlaceholderColor => HexColor('A0A3BD');
  static Color get greyBodyColor => HexColor('4E4B66');
  static Color get newLightGreyColor => HexColor('F4F5FA');
  static Color get newBlackButton => HexColor('2B2A35');
  static Color get newBackgroundColor => HexColor('FCFCFC');
  static Color get newSeparatorColor => HexColor('D9DBE9');
  static Color get newFontHeaderColor => HexColor('6E7191');
  static Color get newFontColor => HexColor('4E4B66');
  static Color get newSmallHeaderFontColor => HexColor('6E7191');
  static Color get newGothamFontColor => HexColor('8EA1B0');
  static Color get newButtonColor => HexColor('334AC0');
  static Color get newBoxColor => HexColor('EFF0F6');
  static Color get newBlackColor => HexColor('14142B');
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
