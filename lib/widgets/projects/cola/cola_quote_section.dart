import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';

class ColaQuoteSection extends StatelessWidget {
  const ColaQuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;

    return ColoredBox(
      color: ColaProjectData.quoteBg,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wide ? 72 : 24,
          vertical: wide ? 88 : 56,
        ),
        child: Column(
          children: [
            Text(
              '"${ColaProjectData.quote}"',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 22 : 16,
                fontWeight: FontWeight.w500,
                height: 1.55,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              ColaProjectData.quoteAuthor,
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
