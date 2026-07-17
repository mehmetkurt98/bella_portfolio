import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraSwotSection extends StatelessWidget {
  const ZaraSwotSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 800;
    final cards = ZaraProjectData.swotCards;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'SWOT',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 28 : 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: wide ? 48 : 32),
            if (wide)
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _SwotCard(card: cards[0])),
                      const SizedBox(width: 24),
                      Expanded(child: _SwotCard(card: cards[1])),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _SwotCard(card: cards[2])),
                      const SizedBox(width: 24),
                      Expanded(child: _SwotCard(card: cards[3])),
                    ],
                  ),
                ],
              )
            else
              Column(
                children: [
                  for (var i = 0; i < cards.length; i++) ...[
                    _SwotCard(card: cards[i]),
                    if (i < cards.length - 1) const SizedBox(height: 16),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _SwotCard extends StatelessWidget {
  const _SwotCard({required this.card});

  final ZaraSwotCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 220),
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: card.borderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.title,
            style: AppTheme.sans.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 14),
          for (final point in card.points) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: AppColors.foreground,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    point,
                    style: AppTheme.sans.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.55,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
