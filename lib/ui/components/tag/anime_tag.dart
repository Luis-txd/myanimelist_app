import 'package:flutter/material.dart';

import '../../../../resources/app_colours.dart';
import '../../theme/app_text_theme.dart';

class AnimeTag extends StatelessWidget {
  const AnimeTag({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        title,
        style:
            AppTextTheme().bodyXSmall.copyWith(height: 1, color: Colors.white),
      ),
      backgroundColor: AppColors().tagPrimaryColor01,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      padding: EdgeInsets.zero, // Removes internal padding
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 4,
      ), // Reduces space around text
    );
  }
}
