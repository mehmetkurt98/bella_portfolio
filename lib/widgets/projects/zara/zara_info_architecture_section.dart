import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraInfoArchitectureSection extends StatelessWidget {
  const ZaraInfoArchitectureSection({super.key});

  static const _diagramAsset = 'assets/projects/zara/zara_table.webp';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'INFORMATION ARCHITECTURE',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 26 : 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: wide ? 40 : 28),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Image.asset(
                  _diagramAsset,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: wide ? 64 : 40),
            Text(
              ZaraProjectData.itemTitle,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 36 : 28,
                fontWeight: FontWeight.w800,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(
                ZaraProjectData.itemDescription,
                style: AppTheme.sans.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.7,
                  color: AppColors.foreground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
