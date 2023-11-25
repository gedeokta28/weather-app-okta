import 'package:flutter/material.dart';

import '../static/colors.dart';

TextStyle appBarStyle(Color? textColor) => TextStyle(
    fontSize: 20, color: textColor ?? whiteColor, fontWeight: FontWeight.bold);

TextStyle textWhite = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor);
TextStyle textWhiteBold = const TextStyle(
    fontSize: 15, fontWeight: FontWeight.bold, color: whiteColor);
TextStyle textTemp = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: whiteColor);
