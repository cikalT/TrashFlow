import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_theme.dart';

class StyleTheme {
  static double get contentPadding => 16;
  static EdgeInsets get insetAll => EdgeInsets.all(contentPadding);
  static TextStyle get bigHeaderTs =>
      const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, height: 1.2);
  static TextStyle get headerTs =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.2);
  static TextStyle get subHeaderBiggerTs =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.2);
  static TextStyle get subHeaderTs =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.2);
  static TextStyle get textTs => const TextStyle(fontSize: 14, height: 1.2);
  static TextStyle get textBoldTs =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, height: 1.2);
  static TextStyle get textLinkTs => TextStyle(
      fontSize: 14,
      color: ColorTheme.primaryColor,
      fontWeight: FontWeight.w700,
      height: 1.2);
  static TextStyle get textSmallTs =>
      const TextStyle(fontSize: 12, height: 1.2);
  static TextStyle get textSmallBoldTs =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, height: 1.2);
  static TextStyle get textSmallerTs =>
      const TextStyle(fontSize: 10, height: 1.2);
  static TextStyle get textSmallerBoldTs =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, height: 1.2);

  static TextStyle get textNew13SemiBoldTs =>
      const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.2);
  static TextStyle get textTsGotham =>
      const TextStyle(fontFamily: 'Roboto', fontSize: 14, height: 1.2);
  static TextStyle get textBoldTsGotham => const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      fontSize: 14,
      height: 1.2);

  static TextStyle get bigHeaderTs2 => bigHeaderTs.copyWith(letterSpacing: .75);
  static TextStyle get headerTs2 => headerTs.copyWith(letterSpacing: .75);
  static TextStyle get subHeaderBiggerTs2 =>
      subHeaderBiggerTs.copyWith(letterSpacing: .75);
  static TextStyle get subHeaderTs2 => subHeaderTs.copyWith(letterSpacing: .75);
  static TextStyle get textTs2 => textTs.copyWith(letterSpacing: .75);
  static TextStyle get textBoldTs2 => textBoldTs.copyWith(letterSpacing: .75);
  static TextStyle get textSmallTs2 => textSmallTs.copyWith(letterSpacing: .75);
  static TextStyle get textSmallBoldTs2 =>
      textSmallBoldTs.copyWith(letterSpacing: .75);
  static TextStyle get textSmallerTs2 =>
      textSmallerTs.copyWith(letterSpacing: .75);
  static TextStyle get textSmallerBoldTs2 =>
      textSmallerBoldTs.copyWith(letterSpacing: .75);

  //UI Elements
  static TextStyle get textAppBarTs => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 1.2,
      letterSpacing: .75);
}
