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
    final cards = ZaraProjectData.valueCards;

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
            EqualHeightGrid(
              itemCount: cards.length,
              columns: columns,
              spacing: 20,
              runSpacing: 20,
              itemBuilder: (context, index) => _ValueCard(card: cards[index]),
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              fontSize: 13,
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
