import 'package:flutter/material.dart';

import '../../theme/app_text_theme.dart';

class AnimeGridError extends StatelessWidget {
  const AnimeGridError(
      {super.key, required this.error, required this.stacktrace});

  final Object? error;
  final StackTrace? stacktrace;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.error_outline_outlined,
            size: 40,
            color: Colors.white,
          ),
          Text(
            error.toString(),
            style: AppTextTheme()
                .bodyLarge
                .copyWith(height: 1, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
