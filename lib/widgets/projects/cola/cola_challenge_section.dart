import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaChallengeSection extends StatelessWidget {
  const ColaChallengeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 56 : 40,
        child: wide
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: _ChallengeVisual()),
                  SizedBox(width: 28),
                  Expanded(flex: 5, child: _ChallengeCopy()),
                ],
              )
            : const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ChallengeVisual(),
                  SizedBox(height: 28),
                  _ChallengeCopy(),
                ],
              ),
      ),
    );
  }
}

class _ChallengeVisual extends StatelessWidget {
  const _ChallengeVisual();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.asset(
        ColaProjectData.challengeImage,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _ChallengeCopy extends StatelessWidget {
  const _ChallengeCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.auto_awesome,
              size: 18,
              color: ColaProjectData.limeDark,
            ),
            const SizedBox(width: 10),
            Text(
              'THE CHALLENGE',
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
        const SizedBox(height: 24),
        for (final item in ColaProjectData.challengeItems) ...[
          Text(
            item.title,
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.body,
            style: AppTheme.sans.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.55,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 16),
        ],
        const SizedBox(height: 8),
        Text(
          ColaProjectData.challengeClosing,
          style: AppTheme.sans.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.65,
            color: AppColors.foreground,
          ),
        ),
      ],
    );
  }
}
