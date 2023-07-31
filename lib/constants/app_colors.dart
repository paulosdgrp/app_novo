import 'package:flutter/material.dart';

class AppColors {
  static const Primary = Color.fromRGBO(5, 72, 147, 1);
  static const PrimaryDark = Color.fromRGBO(7, 57, 114, 1);
  static const Secondary = Color.fromRGBO(77, 129, 186, 1);
  static const SecondaryDark = Color.fromRGBO(75, 94, 116, 1);
  static const Tertiary = Color.fromRGBO(235, 161, 34, 1);
  static const TetiraryDark = Color.fromRGBO(203, 125, 9, 1);

  static const White = Color.fromRGBO(255, 255, 255, 1);
  static const Black = Color.fromRGBO(0, 0, 0, 1);
  static const Grey = Color.fromRGBO(166, 160, 160, 1);
  static const Smoke = Color.fromRGBO(186, 182, 182, 1);
  static const GreyBlue = Color.fromRGBO(38, 50, 56, 1);
  static const UltramarineBlue = Color.fromRGBO(21, 61, 105, 1);
  static const PearlNightBlue = Color.fromRGBO(18, 45, 74, 1);

  static final BackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [PrimaryDark.withOpacity(0.92), Black.withOpacity(1)],
  );
}
