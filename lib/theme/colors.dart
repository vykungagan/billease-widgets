import 'package:flutter/material.dart';

class AppColors {
  //Splash Backgrounds, main elements
  static const Color main = Color.fromRGBO(122, 56, 173, 1);

  //For 2nd level elements, text
  static const Color secondary = Color.fromRGBO(46, 48, 142, 1);

  //hint text color
  static const Color hintText = Color.fromRGBO(46, 48, 142, 80);

  //For CTAs abd accent touches, page background
  static const Color accent = Color.fromRGBO(248, 244, 251, 1);

  //For CTAs abd accent touches, page background
  static const Color error = Color.fromRGBO(234, 16, 0, 1);

  //Main Gradient
  static const LinearGradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [secondary, main, secondary],
  );
}
