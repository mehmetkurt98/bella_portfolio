import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaOverviewSection extends StatelessWidget {
  const ColaOverviewSection({super.key});

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
              'PROJECT OVERVIEW',
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
            const SizedBox(height: 14),
            Icon(
              Icons.interests_outlined,
              size: 22,
              color: AppColors.foreground,
            ),
            SizedBox(height: wide ? 24 : 18),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  ColaProjectData.overviewBody,
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.7,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ),
            SizedBox(height: wide ? 64 : 40),
            if (wide)
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: _TimeframeVisual()),
                  SizedBox(width: 32),
                  Expanded(flex: 5, child: _TimeframeCopy()),
                ],
              )
            else
              const Column(
                children: [
                  _TimeframeVisual(),
                  SizedBox(height: 28),
                  _TimeframeCopy(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _TimeframeVisual extends StatelessWidget {
  const _TimeframeVisual();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ColaProjectData.timeframeImage,
      fit: BoxFit.contain,
      width: double.infinity,
    );
  }
}

class _TimeframeCopy extends StatelessWidget {
  const _TimeframeCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TIMEFRAME',
          style: AppTheme.sans.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.6,
            color: AppColors.foreground,
            decoration: TextDecoration.underline,
            decorationThickness: 2,
          ),
        ),
        const SizedBox(height: 12),
        const Icon(Icons.schedule, size: 20),
        const SizedBox(height: 12),
        Text(
          ColaProjectData.timeframeNote,
          style: AppTheme.sans.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 24),
        for (final day in ColaProjectData.timeframeDays) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.wb_sunny_outlined,
                size: 16,
                color: ColaProjectData.limeDark,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppTheme.sans.copyWith(
                      fontSize: 13,
                      height: 1.55,
                      color: AppColors.foreground,
                    ),
                    children: [
                      TextSpan(
                        text: '${day.title}: ',
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(text: day.body),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
        ],
      ],
    );
  }
}
