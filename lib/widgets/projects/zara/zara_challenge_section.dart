import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraChallengeSection extends StatelessWidget {
  const ZaraChallengeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;
    final columns = width > 900 ? 2 : 1;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'THE CHALLENGE',
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
                color: AppColors.foreground,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: wide ? 32 : 24),
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 5, child: _ChallengeCopy()),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 7,
                    child: _ChallengeCardsGrid(columns: columns),
                  ),
                ],
              )
            else ...[
              const _ChallengeCopy(),
              const SizedBox(height: 28),
              _ChallengeCardsGrid(columns: columns),
            ],
          ],
        ),
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
        Text(
          'Challenge',
          style: AppTheme.sans.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 16),
        for (final bullet in ZaraProjectData.challengeBullets) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.foreground,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  bullet,
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
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class _ChallengeCardsGrid extends StatelessWidget {
  const _ChallengeCardsGrid({required this.columns});

  final int columns;

  @override
  Widget build(BuildContext context) {
    final cards = ZaraProjectData.challengeCards;

    return EqualHeightGrid(
      itemCount: cards.length,
      columns: columns,
      spacing: 16,
      runSpacing: 16,
      itemBuilder: (context, index) => _ChallengeCard(card: cards[index]),
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard({required this.card});

  final ZaraChallengeCard card;

  @override
  Widget build(BuildContext context) {
    final title = card.title.replaceAll(':', '');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: AppTheme.sans.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            card.body,
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.6,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}
