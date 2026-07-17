import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaDeliverSection extends StatelessWidget {
  const ColaDeliverSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;
    final images = ColaProjectData.deliverImages;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 72 : 48,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'DELIVER',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: wide ? 24 : 18),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  ColaProjectData.deliverIntro,
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(fontSize: 14, height: 1.7),
                ),
              ),
            ),
            SizedBox(height: wide ? 40 : 28),
            for (var i = 0; i < images.length; i++) ...[
              Image.asset(
                images[i],
                fit: BoxFit.contain,
                width: double.infinity,
              ),
              if (i < images.length - 1) SizedBox(height: wide ? 36 : 24),
            ],
            SizedBox(height: wide ? 48 : 32),
          ],
        ),
      ),
    );
  }
}
