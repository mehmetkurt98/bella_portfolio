import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraProjectDetailsSection extends StatelessWidget {
  const ZaraProjectDetailsSection({super.key});

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
              EqualHeightGrid(
                itemCount: group.cards.length,
                columns: width < 700 ? 1 : group.cards.length.clamp(1, 3),
                spacing: 16,
                runSpacing: 12,
                itemBuilder: (context, index) =>
                    _DetailCard(card: group.cards[index]),
              ),
              SizedBox(height: wide ? 36 : 28),
            ],
          ],
        ),
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.border),
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
