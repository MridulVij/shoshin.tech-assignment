import 'package:flutter/material.dart';

class CustomColors {
  Color generateLighterShade(Color color) {
    return Color.fromRGBO(
      (color.red * 0).round(),
      (color.green * .9).round(),
      (color.blue * 3).round(),
      1,
    );
  }
}
