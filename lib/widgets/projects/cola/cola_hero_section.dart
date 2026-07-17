import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaHeroSection extends StatelessWidget {
  const ColaHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 48 : 32,
        child: Column(
          children: [
            Text(
              ColaProjectData.title,
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 28 : 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                height: 1.25,
                color: AppColors.foreground,
                decoration: TextDecoration.underline,
                decorationThickness: 1.5,
              ),
            ),
            SizedBox(height: wide ? 28 : 20),
            Image.asset(
              ColaProjectData.logoIcon,
              width: wide ? 72 : 56,
              height: wide ? 72 : 56,
              fit: BoxFit.contain,
            ),
            SizedBox(height: wide ? 24 : 18),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Text(
                ColaProjectData.subtitle,
                textAlign: TextAlign.center,
                style: AppTheme.sans.copyWith(
                  fontSize: wide ? 15 : 13,
                  fontWeight: FontWeight.w700,
                  height: 1.6,
                  color: AppColors.foreground,
                ),
              ),
            ),
            SizedBox(height: wide ? 48 : 32),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: wide ? 960 : 640),
              child: Image.asset(
                ColaProjectData.heroImage,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
