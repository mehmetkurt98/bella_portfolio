import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraBackgroundSection extends StatelessWidget {
  const ZaraBackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;
    final columns = width > 900 ? 2 : 1;
    final cards = ZaraProjectData.backgroundCards;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 96 : 64,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ZaraProjectData.overviewTitle,
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 42 : 30,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                height: 1.1,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 920),
                child: Text(
                  ZaraProjectData.overviewIntro,
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
            SizedBox(height: wide ? 72 : 48),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'BACKGROUND',
                style: AppTheme.sans.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                  color: AppColors.foreground,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
            SizedBox(height: wide ? 40 : 28),
            EqualHeightGrid(
              itemCount: cards.length,
              columns: columns,
              spacing: 20,
              runSpacing: 20,
              itemBuilder: (context, index) =>
                  _BackgroundCard(card: cards[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundCard extends StatelessWidget {
  const _BackgroundCard({required this.card});

  final ZaraBackgroundCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.title.toUpperCase(),
            style: AppTheme.sans.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            card.body,
            style: AppTheme.sans.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.65,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}
