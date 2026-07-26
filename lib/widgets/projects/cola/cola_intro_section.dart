import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaIntroSection extends StatelessWidget {
  const ColaIntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 72 : 48,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ColaProjectData.introTitle,
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 36 : 26,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 16),
            Icon(
              Icons.eco,
              size: wide ? 28 : 22,
              color: ColaProjectData.limeDark,
            ),
            SizedBox(height: wide ? 28 : 20),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  ColaProjectData.introBody,
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(
                    fontSize: wide ? 15 : 14,
                    fontWeight: FontWeight.w400,
                    height: 1.75,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ),
            SizedBox(height: wide ? 40 : 28),
            Text(
              'OBJECTIVES',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 16),
            for (final item in ColaProjectData.objectives)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '•  $item',
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Text(
                  ColaProjectData.objectivesClosing,
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.65,
                    color: AppColors.muted,
                  ),
                ),
              ),
            ),
            SizedBox(height: wide ? 72 : 48),
            Row(
              children: [
                Text(
                  'BACKGROUND',
                  style: AppTheme.sans.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.4,
                    color: AppColors.foreground,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: wide ? 32 : 24),
            for (final item in ColaProjectData.backgroundItems) ...[
              Text(
                item.title,
                style: AppTheme.sans.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.body,
                style: AppTheme.sans.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.7,
                  color: AppColors.foreground,
                ),
              ),
              SizedBox(height: wide ? 28 : 22),
            ],
          ],
        ),
      ),
    );
  }
}
