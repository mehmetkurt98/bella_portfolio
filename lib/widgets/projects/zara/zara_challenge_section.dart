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

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
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
            ),
            SizedBox(height: wide ? 28 : 24),
            if (wide)
              const _WideChallengeLayout()
            else
              const _CompactChallengeLayout(),
          ],
        ),
      ),
    );
  }
}

class _WideChallengeLayout extends StatelessWidget {
  const _WideChallengeLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 5,
          child: _ChallengeCopy(),
        ),
        const SizedBox(width: 20),
        const Expanded(
          flex: 7,
          child: _ChallengeCardsStack(),
        ),
      ],
    );
  }
}

class _CompactChallengeLayout extends StatelessWidget {
  const _CompactChallengeLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _ChallengeCopy(),
        const SizedBox(height: 28),
        for (var i = 0; i < ZaraProjectData.challengeCards.length; i++) ...[
          SizedBox(
            height: ZaraProjectData.challengeCards[i].height,
            child: _ChallengeCard(
              card: ZaraProjectData.challengeCards[i],
              scale: 1,
            ),
          ),
          if (i < ZaraProjectData.challengeCards.length - 1)
            const SizedBox(height: 14),
        ],
      ],
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
          'Challenge:',
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
          const SizedBox(height: 18),
        ],
      ],
    );
  }
}

class _ChallengeCardsStack extends StatelessWidget {
  const _ChallengeCardsStack();

  static const _frameWidth = 570.0;
  static const _frameHeight = 560.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale =
            (constraints.maxWidth / _frameWidth).clamp(0.75, 1.15);
        final cards = ZaraProjectData.challengeCards;

        return SizedBox(
          width: _frameWidth * scale,
          height: _frameHeight * scale,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              for (final card in cards)
                Positioned(
                  left: card.left * scale,
                  top: card.top * scale,
                  width: card.width * scale,
                  height: card.height * scale,
                  child: _ChallengeCard(card: card, scale: scale),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard({
    required this.card,
    required this.scale,
  });

  final ZaraChallengeCard card;
  final double scale;

  bool get _isFocus => card.title == 'Focus';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5 * scale),
        border: Border.all(
          color: _isFocus ? const Color(0xFF7B9BC7) : const Color(0xFFB1BFD7),
          width: (_isFocus ? 2 : 1) * scale,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6F84A3).withValues(alpha: 0.55),
            blurRadius: 22 * scale,
            spreadRadius: 1,
            offset: Offset(3 * scale, 10 * scale),
          ),
          BoxShadow(
            color: const Color(0xFFACBBD4).withValues(alpha: 0.7),
            blurRadius: 8 * scale,
            offset: Offset(0, 4 * scale),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 72,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  16 * scale,
                  16 * scale,
                  16 * scale,
                  12 * scale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.title,
                      style: AppTheme.sans.copyWith(
                        fontSize: 14 * scale,
                        fontWeight: FontWeight.w700,
                        color: AppColors.foreground,
                      ),
                    ),
                    SizedBox(height: 10 * scale),
                    Expanded(
                      child: Text(
                        card.body,
                        style: AppTheme.sans.copyWith(
                          fontSize: 12 * scale,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: AppColors.foreground,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 28,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFD5DAE3),
                    Color(0xFFB4C2D8),
                    Color(0xFF8FA3C4),
                    Color(0xFF6F84A3),
                  ],
                  stops: [0.0, 0.35, 0.7, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
