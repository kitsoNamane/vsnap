import 'package:flutter/material.dart';

// View colors at https://material.io/resources/color/#!/?view.left=0&view.right=1&primary.color=358700&secondary.color=FF3D00&secondary.text.color=EFEBE9
final colorScheme = ColorScheme.light(
    primary: Color(0x358700),
    //primaryVariant:Color(0x69b83c),
    primaryVariant: Color(0x005900),
    secondary: Color(0xff3d00),
    secondaryVariant: Color(0xff7539),
    //secondaryDarkColor:Color(0xc30000),
    onSecondary: Color(0xffffff),
    onPrimary: Color(0xefebe9),
    background: Color(0xe0e0e0),
    brightness: Brightness.light);
final colorSchemeDark = ColorScheme.dark();

final abstractClassThemeData = ThemeData.from(colorScheme: colorScheme);
