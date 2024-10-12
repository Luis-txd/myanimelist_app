import 'package:flutter/material.dart';
import 'font_size.dart';

class AppTextTheme {
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
      bodyNormal: TextStyle(
        fontSize: FontSize.pt18,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      bodyNormalBold: TextStyle(
        fontSize: FontSize.pt18,
        letterSpacing: 0,
        fontWeight: FontWeight.bold,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      bodyLarge: TextStyle(
        fontSize: FontSize.pt20,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      bodyLargeBold: TextStyle(
        fontSize: FontSize.pt20,
        letterSpacing: 0,
        fontWeight: FontWeight.bold,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      label: TextStyle(
        fontSize: FontSize.pt12,
        letterSpacing: 0,
        fontWeight: FontWeight.w900,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      highlight: TextStyle(
        fontSize: FontSize.pt24,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
        height: 1,
      ),
      btnMain: TextStyle(
        fontSize: FontSize.pt16,
        letterSpacing: 0,
        fontWeight: FontWeight.bold,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      btnSmall: TextStyle(
        fontSize: FontSize.pt12,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      menuItem: TextStyle(
        fontSize: FontSize.pt12,
        letterSpacing: 0,
        fontWeight: FontWeight.bold,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      mobileNavbar: TextStyle(
        fontSize: FontSize.pt20,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      mobileNavbarTitle: TextStyle(
        fontSize: FontSize.pt22,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
    );
  }

  const AppTextTheme._({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.bottomNavBar,
    required this.bodyNormal,
    required this.label,
    required this.highlight,
    required this.btnMain,
    required this.btnSmall,
    required this.menuItem,
    required this.mobileNavbar,
    required this.mobileNavbarTitle,
    required this.bodyNormalBold,
    required this.bodyLarge,
    required this.bodyLargeBold,
  });
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle bottomNavBar;
  final TextStyle bodyNormal;
  final TextStyle label;
  final TextStyle highlight;
  final TextStyle btnMain;
  final TextStyle btnSmall;
  final TextStyle menuItem;
  final TextStyle mobileNavbar;
  final TextStyle mobileNavbarTitle;
  final TextStyle bodyNormalBold;
  final TextStyle bodyLarge;
  final TextStyle bodyLargeBold;
}
