import 'package:flutter/material.dart';

extension CustomColorSchema on ColorScheme {
  Color get colorPrimary => brightness == Brightness.light
      ? const Color(0xFF2c3848)
      : const Color(0xFF5ca0d3);

  Color get colorSecondary => brightness == Brightness.light
      ? const Color(0xFF5ca0d3)
      : const Color(0xFF2c3848);

  Color get colorTitles => brightness == Brightness.light
      ? const Color(0xFFfcfcfd)
      : const Color(0xFFfcfcfd);

  Color get colorSubTitles => brightness == Brightness.light
      ? const Color(0xFF626a76)
      : const Color(0xFF000000);

  Color get colorWatchNow => brightness == Brightness.light
      ? const Color(0xFF6b737f)
      : const Color(0xFF000000);

  Color get black45 =>
      brightness == Brightness.light ? Colors.black45 : Colors.black45;
}

// class MovieColors {
//   static const blue = Color(0xFF5ca0d3);
//   static const gray = Color(0xFF2c3848);
// }

// final lightTheme = ThemeData(
//   primaryColor: MovieColors.gray,
  
// );
