import 'package:flutter/material.dart';

import '../data/about_data.dart';
import '../theme/app_colors.dart';
import 'shared.dart';

/// About section as a full Figma board image.
class AboutBoardSection extends StatelessWidget {
  const AboutBoardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: 56,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            AboutData.boardAsset,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            filterQuality: FilterQuality.high,
            isAntiAlias: true,
          ),
        ),
      ),
    );
  }
}
