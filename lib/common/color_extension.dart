import 'package:flutter/material.dart';

class TColor {
  static Color get primaryColor1 => const Color(0xffF38181);
  static Color get primaryColor2 => const Color(0xffFCE38A);

  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);
                             

  static List<Color> get primaryG => [primaryColor2, primaryColor1];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => const Color(0xff1C1C1E);
  static Color get white => Colors.white;
  static Color get gray => const Color(0xff7b6F72);
  static Color get midGray => const Color(0xffADA4A5);
  static Color get lightGray => const Color(0xffDDDADA);
  static Color get lightenGray => const Color(0xffF7F8F8);
}