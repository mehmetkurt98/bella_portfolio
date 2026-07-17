import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraProjectDetailsSection extends StatelessWidget {
  const ZaraProjectDetailsSection({super.key});

  static const _cardGradient = [
    Color(0xFFFFFFFF),
    Color(0xFFD5DAE3),
    Color(0xFFE4E9F1),
    Color(0xFFACBBD4),
  ];

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
              'PROJECT DETAILS',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 22 : 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: AppColors.foreground,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: wide ? 48 : 32),
            for (final group in ZaraProjectData.projectDetailGroups) ...[
              Text(
                group.label,
                textAlign: TextAlign.center,
                style: AppTheme.sans.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),
              _DetailCardsRow(cards: group.cards),
              SizedBox(height: wide ? 36 : 28),
            ],
          ],
        ),
      ),
    );
  }
}

class _DetailCardsRow extends StatelessWidget {
  const _DetailCardsRow({required this.cards});

  final List<ZaraProjectDetailCard> cards;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final stacked = width < 700;

    if (stacked) {
      return Column(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            SizedBox(
              width: double.infinity,
              height: 180,
              child: _DetailCard(card: cards[i]),
            ),
            if (i < cards.length - 1) const SizedBox(height: 12),
          ],
        ],
      );
    }

    return SizedBox(
      height: 200,
      child: Row(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            Expanded(child: _DetailCard(card: cards[i])),
            if (i < cards.length - 1) const SizedBox(width: 16),
          ],
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.card});

  final ZaraProjectDetailCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFB1BFD7), width: 1),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ZaraProjectDetailsSection._cardGradient,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: _RichBody(card: card),
      ),
    );
  }
}

class _RichBody extends StatelessWidget {
  const _RichBody({required this.card});

  final ZaraProjectDetailCard card;

  @override
  Widget build(BuildContext context) {
    if (card.boldParts.isEmpty) {
      return Text(
        card.body,
        textAlign: TextAlign.center,
        style: AppTheme.sans.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.55,
          color: AppColors.foreground,
        ),
      );
    }

    final spans = <TextSpan>[];
    var remaining = card.body;
    for (final part in card.boldParts) {
      final index = remaining.indexOf(part);
      if (index < 0) continue;
      if (index > 0) {
        spans.add(TextSpan(text: remaining.substring(0, index)));
      }
      spans.add(
        TextSpan(
          text: part,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      );
      remaining = remaining.substring(index + part.length);
    }
    if (remaining.isNotEmpty) {
      spans.add(TextSpan(text: remaining));
    }

    return Text.rich(
      TextSpan(
        style: AppTheme.sans.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.55,
          color: AppColors.foreground,
        ),
        children: spans,
      ),
      textAlign: TextAlign.center,
    );
  }
}
