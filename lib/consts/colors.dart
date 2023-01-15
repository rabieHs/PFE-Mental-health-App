import 'package:flutter/material.dart';

Map<int, Color> primarySwatch() {
  return {
    50: Color.fromRGBO(30, 186, 220, .1),
    100: Color.fromRGBO(30, 186, 220, .2),
    200: Color.fromRGBO(30, 186, 220, .3),
    300: Color.fromRGBO(30, 186, 220, .4),
    400: Color.fromRGBO(30, 186, 220, .5),
    500: Color.fromRGBO(30, 186, 220, .6),
    600: Color.fromRGBO(30, 186, 220, .7),
    700: Color.fromRGBO(30, 186, 220, .8),
    800: Color.fromRGBO(30, 186, 220, .9),
    900: Color.fromRGBO(30, 186, 220, 1),
  };
}

MaterialColor primaryswatch = MaterialColor(50, primarySwatch());

List<Color> homeListviewColors = [];
const primaryColor = Color.fromRGBO(30, 186, 220, 1);
const secondaryColor = Color.fromRGBO(225, 211, 109, 1);
const greenColor = Color.fromRGBO(92, 205, 131, 1);
const lightgreenColor = Color.fromRGBO(104, 204, 196, 1);
const greyColor = Color.fromRGBO(191, 193, 207, 1);
const nightBlue1 = Color.fromRGBO(45, 89, 207, 1);
const nightBlue2 = Color.fromRGBO(15, 22, 97, 1);
const nightBlueGradienColor = LinearGradient(
  colors: [
    Color.fromRGBO(45, 89, 207, 1),
    Color.fromRGBO(15, 22, 97, 1),
  ],
);
