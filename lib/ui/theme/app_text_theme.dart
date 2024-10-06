import 'package:flutter/material.dart';

import 'package:myanimelist_app/ui/theme/font_size.dart';

class AppTextTheme {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle bottomNavBar;

  const AppTextTheme._({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.bottomNavBar,
  });

  /*TextStyle fontAppNormal(double size) {
    return TextStyle(
        fontSize: size,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro');
  }*/

  factory AppTextTheme() {
    return const AppTextTheme._(
      h1: TextStyle(
          fontSize: FontSize.pt60,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'SourceSansPro'),
      h2: TextStyle(
          fontSize: FontSize.pt54,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          leadingDistribution: TextLeadingDistribution.even,
          height: 1.2,
          fontFamily: 'SourceSansPro'),
      h3: TextStyle(
          fontSize: FontSize.pt32,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1.2,
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'SourceSansPro'),
      h4: TextStyle(
          fontSize: FontSize.pt60,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1.2,
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'SourceSansPro'),
      bottomNavBar: TextStyle(
          fontSize: FontSize.pt10,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'SourceSansPro'),
    );
  }
}
