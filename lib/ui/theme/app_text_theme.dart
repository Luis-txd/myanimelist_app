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
      h4: TextStyle(
          fontSize: FontSize.pt24,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          height: 1.2,
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'SourceSansPro'),
      h5: TextStyle(
          fontSize: FontSize.pt20,
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
      bodySmall: TextStyle(
        fontSize: FontSize.pt14,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        fontFamily: 'SourceSansPro',
      ),
      bodySmallBold: TextStyle(
        fontSize: FontSize.pt14,
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
    );
  }

  const AppTextTheme._({
    required this.h1,
    required this.h4,
    required this.h5,
    required this.bottomNavBar,
    required this.bodyNormal,
    required this.label,
    required this.btnMain,
    required this.btnSmall,
    required this.bodyNormalBold,
    required this.bodyLarge,
    required this.bodyLargeBold,
    required this.bodySmall,
    required this.bodySmallBold,
  });
  final TextStyle h1;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle bottomNavBar;
  final TextStyle label;
  final TextStyle btnMain;
  final TextStyle btnSmall;
  final TextStyle bodyNormal;
  final TextStyle bodyNormalBold;
  final TextStyle bodyLarge;
  final TextStyle bodyLargeBold;
  final TextStyle bodySmall;
  final TextStyle bodySmallBold;

  // titles, subtitles, labels, naviBar, bodyNormal, bodyLarge
}
