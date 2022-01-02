import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:get/get.dart';

class UtilHelper {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width ?? 0;
    screenHeight = _mediaQueryData?.size.height ?? 0;
    blockSizeHorizontal = screenWidth ?? 0 / 100;
    blockSizeVertical = screenHeight ?? 0 / 100;
  }

  static double getResponsiveHeight(
      {double? min, double? max, double? divider}) {
    double calculated = Get.height * (divider ?? .5);
    return calculated < (min ?? 0)
        ? min!
        : calculated > (max ?? calculated)
            ? max!
            : calculated;
  }

  static bool isLargeFile(File file) {
    final bytes = file.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    if (mb > 5) {
      return true;
    }
    return false;
  }

  static bool checkVal(dynamic val) {
    if (val == null) return false;
    bool result = false;
    if (val is int) {
      result = val != 0;
    }
    if (val is String) {
      result = val != '0';
    }
    if (val is bool) {
      result = val;
    }
    return result;
  }

  static bool isHighest(num? baseNumber, List<num?>? listNumber) {
    if (baseNumber == null || listNumber == null) return false;
    bool result = true;
    for (var element in listNumber) {
      if (element != null && baseNumber < element) {
      result = false;
      }
    }
    return result;
  }

  static List<String> htmlTableConverter(String? source) {
    late List<String> temp;
    if (source == null) return [''];
    temp = source.split('</li>');
    if (temp.isNotEmpty) {
      for (int i = 0; i < temp.length; i++) {
        temp[i] = temp[i].replaceAll('<ul>', '');
        temp[i] = temp[i].replaceAll('<li>', '');
        temp[i] = temp[i].replaceAll('<ol>', '');
        temp[i] = temp[i].replaceAll('</ol>', '');
        temp[i] = temp[i].replaceAll('</ul>', '');
      }
    }
    return temp;
  }

  static String? convertToTitleCase(String? text) {
    if (text == null) {
      return null;
    }

    if (text.length <= 1) {
      return text.toUpperCase();
    }

    final List<String> words = text.split(' ');

    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });
    return capitalizedWords.join(' ');
  }

  static String capitalize(String? val) {
    if (val == null || val.length < 2) return val ?? '';
    return "${val[0].toUpperCase()}${val.substring(1)}";
  }

  static String? humanRead(String? val) {
    if (val == null) return val;
    List<String> listString = val.split('_');
    if (listString.isNotEmpty) {
      for (var element in listString) {
        element = capitalize(element);
      }
    }
    return listString.join(' ');
  }

  static double sizeTo1Dec(double size) {
    return 1.0;
  }

  static double sizeFrom1Dec(double sizeSource, double size) {
    return sizeTo1Dec(sizeSource) -
        getNumber(
            sizeTo1Dec(sizeSource) -
                (((sizeSource / 100) - (size / 100)) * 0.1),
            precision: 2);
  }

  static double getNumber(double input, {int precision = 2}) => double.parse(
      '$input'.substring(0, '$input'.indexOf('.') + precision + 1));

  static String removeUnderscore(String string) {
    return string.replaceAll('_', ' ');
  }

  static String regexUrl(String httpUrl) {
    String url = '';
    final urlRegExp = RegExp(
        r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
    final urlMatches = urlRegExp.allMatches(httpUrl);
    List<String> urls = urlMatches
        .map((urlMatch) => httpUrl.substring(urlMatch.start, urlMatch.end))
        .toList();
    for (var x in urls) {
      url += x;
    }
    return url;
  }

  static String? handleEndSpaces(String? url) {
    if (url == null) return null;
    if (url.substring(url.length - 1, url.length) == ' ') {
      return url.substring(0, url.length - 1);
    }
    if (url.substring(url.length-3, url.length) == '%20') {
      return url.substring(0, url.length - 3);
    }
    return url;
  }
}
