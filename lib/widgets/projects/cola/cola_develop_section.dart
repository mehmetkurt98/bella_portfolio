import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaDevelopSection extends StatelessWidget {
  const ColaDevelopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 72 : 48,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'DEVELOP',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: wide ? 32 : 24),
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0;
                      i < ColaProjectData.developImages.length;
                      i++) ...[
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          ColaProjectData.developImages[i],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    if (i == 0) const SizedBox(width: 16),
                  ],
                ],
              )
            else
              Column(
                children: [
                  for (final asset in ColaProjectData.developImages) ...[
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        asset,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            SizedBox(height: wide ? 28 : 20),
            Text(
              ColaProjectData.developIntro,
              textAlign: TextAlign.left,
              style: AppTheme.sans.copyWith(fontSize: 14, height: 1.7),
            ),
            const SizedBox(height: 20),
            for (final item in ColaProjectData.developItems) ...[
              Text(
                '•  ${item.title}',
                style: AppTheme.sans.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  item.body,
                  style: AppTheme.sans.copyWith(
                    fontSize: 13,
                    height: 1.6,
                    color: AppColors.muted,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }
}
