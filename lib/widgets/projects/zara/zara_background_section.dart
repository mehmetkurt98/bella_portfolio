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
            if (wide)
              const _StaggeredCards()
            else
              const _StackedCards(),
          ],
        ),
      ),
    );
  }
}

class _StaggeredCards extends StatelessWidget {
  const _StaggeredCards();

  static const _originLeft = 165.0;
  static const _originTop = 376.0;
  static const _frameWidth = 674.0;
  static const _frameHeight = 645.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale =
            (constraints.maxWidth / _frameWidth).clamp(0.85, 1.35);
        final cards = ZaraProjectData.backgroundCards;

        return Center(
          child: SizedBox(
            width: _frameWidth * scale,
            height: _frameHeight * scale,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                for (final card in cards)
                  Positioned(
                    left: (card.left - _originLeft) * scale,
                    top: (card.top - _originTop) * scale,
                    width: card.width * scale,
                    height: card.height * scale,
                    child: _BackgroundCard(card: card, scale: scale),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StackedCards extends StatelessWidget {
  const _StackedCards();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < ZaraProjectData.backgroundCards.length; i++) ...[
          SizedBox(
            height: ZaraProjectData.backgroundCards[i].height,
            child: _BackgroundCard(
              card: ZaraProjectData.backgroundCards[i],
              scale: 1,
              expandWidth: true,
            ),
          ),
          if (i < ZaraProjectData.backgroundCards.length - 1)
            const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class _BackgroundCard extends StatelessWidget {
  const _BackgroundCard({
    required this.card,
    required this.scale,
    this.expandWidth = false,
  });

  final ZaraBackgroundCard card;
  final double scale;
  final bool expandWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expandWidth ? double.infinity : card.width * scale,
      height: card.height * scale,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5 * scale),
        border: Border.all(
          color: card.borderColor,
          width: 1 * scale,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6F84A3).withValues(alpha: 0.5),
            blurRadius: 20 * scale,
            spreadRadius: 1,
            offset: Offset(2 * scale, 8 * scale),
          ),
          BoxShadow(
            color: const Color(0xFFACBBD4).withValues(alpha: 0.65),
            blurRadius: 6 * scale,
            offset: Offset(0, 3 * scale),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 74,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  20 * scale,
                  20 * scale,
                  20 * scale,
                  12 * scale,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.title,
                      style: AppTheme.sans.copyWith(
                        fontSize: 16 * scale,
                        fontWeight: FontWeight.w700,
                        color: AppColors.foreground,
                      ),
                    ),
                    SizedBox(height: 12 * scale),
                    Expanded(
                      child: Text(
                        card.body,
                        style: AppTheme.sans.copyWith(
                          fontSize: 13 * scale,
                          fontWeight: FontWeight.w400,
                          height: 1.55,
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
            flex: 26,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: card.gradientColors.length >= 2
                      ? [
                          card.gradientColors[card.gradientColors.length - 2],
                          card.gradientColors.last,
                          const Color(0xFF6F84A3),
                        ]
                      : const [
                          Color(0xFFD5DAE3),
                          Color(0xFFACBBD4),
                          Color(0xFF6F84A3),
                        ],
                  stops: const [0.0, 0.45, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
