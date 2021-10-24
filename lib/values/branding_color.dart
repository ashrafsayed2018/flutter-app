import 'package:flutter/material.dart';

const MaterialColor brandingColor = MaterialColor(
  _brandingPrimaryColor,
  <int, Color>{
    50: Color.fromRGBO(7, 94, 84, .1),
    100: Color.fromRGBO(7, 94, 84, .2),
    200: Color.fromRGBO(7, 94, 84, .3),
    300: Color.fromRGBO(7, 94, 84, .4),
    400: Color.fromRGBO(7, 94, 84, .5),
    500: Color(_brandingPrimaryColor),
    600: Color.fromRGBO(7, 94, 84, .7),
    700: Color.fromRGBO(7, 94, 84, .8),
    800: Color.fromRGBO(7, 94, 84, .9),
    900: Color.fromRGBO(7, 94, 84, 1),
  },
);
const int _brandingPrimaryColor = 0xFF075e54;
