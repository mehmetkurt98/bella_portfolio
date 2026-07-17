import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaValuesSection extends StatelessWidget {
  const ColaValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 72 : 48,
        child: Column(
          children: [
            Text(
              'PROJECT VALUES',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                color: AppColors.foreground,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            const SizedBox(height: 12),
            const Icon(Icons.back_hand_outlined, size: 22),
            SizedBox(height: wide ? 36 : 28),
            for (final value in ColaProjectData.projectValues) ...[
              Text(
                value.title,
                textAlign: TextAlign.center,
                style: AppTheme.sans.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 6),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Text(
                  value.body,
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.55,
                    color: AppColors.muted,
                  ),
                ),
              ),
              SizedBox(height: wide ? 22 : 18),
            ],
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Text(
                ColaProjectData.valuesClosing,
                textAlign: TextAlign.center,
                style: AppTheme.sans.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 1.65,
                  color: AppColors.foreground,
                ),
              ),
            ),
            SizedBox(height: wide ? 72 : 48),
            Text(
              'SWOT ANALYSIS',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                color: AppColors.foreground,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: wide ? 32 : 24),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: wide ? 720 : 480),
                child: Image.asset(
                  ColaProjectData.swotImage,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
