import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraValuesSection extends StatelessWidget {
  const ZaraValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;
    final columns = width > 1100 ? 3 : width > 700 ? 2 : 1;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'STYLE ME ZARA VALUES',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 28 : 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.4,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 28),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  ZaraProjectData.valuesIntro,
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
            SizedBox(height: wide ? 48 : 32),
            LayoutBuilder(
              builder: (context, constraints) {
                final spacing = 20.0;
                final cardWidth =
                    (constraints.maxWidth - spacing * (columns - 1)) / columns;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    for (final card in ZaraProjectData.valueCards)
                      SizedBox(
                        width: cardWidth,
                        height: 269,
                        child: _ValueCard(card: card),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  const _ValueCard({required this.card});

  final ZaraValueCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 287,
      height: 269,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFB1BFD7), width: 1),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFE4E9F1),
            Color(0xFFE4E9F1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            card.title,
            textAlign: TextAlign.center,
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 1.35,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            card.body,
            textAlign: TextAlign.center,
            style: AppTheme.sans.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.55,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}
