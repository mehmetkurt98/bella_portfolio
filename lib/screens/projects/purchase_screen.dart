import 'package:flutter/material.dart';

import '../../data/purchase_project_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shared.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final sectionGap = width < 680 ? 72.0 : 96.0;

    return Scaffold(
      backgroundColor: PurchaseProjectData.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PagePadding(
              vertical: 24,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LuxuryTextButton(
                  label: 'Back',
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ),
            ),
            const _HeroSection(),
            SizedBox(height: sectionGap),
            const _ChallengeSection(),
            SizedBox(height: sectionGap),
            const _DirectionSection(),
            SizedBox(height: sectionGap),
            const _FlowSection(),
            SizedBox(height: sectionGap),
            const _KeyMomentsSection(),
            SizedBox(height: sectionGap),
            const _SystemSection(),
            SizedBox(height: sectionGap),
            const _OutcomeSection(),
            SizedBox(height: width < 680 ? 64 : 88),
          ],
        ),
      ),
    );
  }
}

// ─── Shared bits ─────────────────────────────────────────────────────────────

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTheme.sans.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.4,
        color: PurchaseProjectData.textSecondary,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Text(
      text,
      style: AppTheme.sans.copyWith(
        fontSize: (width * 0.036).clamp(28.0, 44.0),
        fontWeight: FontWeight.w700,
        height: 1.12,
        letterSpacing: -0.8,
        color: PurchaseProjectData.textPrimary,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTheme.sans.copyWith(
        fontSize: 15,
        height: 1.65,
        color: PurchaseProjectData.textSecondary,
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({
    required this.asset,
    this.maxHeight = 560,
  });

  final String asset;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : 320.0;
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxW,
            maxHeight: maxHeight,
          ),
          child: Image.asset(
            asset,
            fit: BoxFit.contain,
            width: maxW,
            filterQuality: FilterQuality.high,
          ),
        );
      },
    );
  }
}

// ─── 01 Hero ─────────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    if (!wide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ColoredBox(
            color: PurchaseProjectData.accentYellow,
            child: PagePadding(
              vertical: 56,
              child: _HeroCopy(compact: true),
            ),
          ),
          ColoredBox(
            color: PurchaseProjectData.backgroundWarm,
            child: PagePadding(
              vertical: 36,
              child: Center(
                child: _PhoneFrame(
                  asset: PurchaseProjectData.heroAsset,
                  maxHeight: 420,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      height: (width * 0.42).clamp(520.0, 680.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 42,
            child: ColoredBox(
              color: PurchaseProjectData.accentYellow,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(56, 64, 40, 48),
                child: _HeroCopy(compact: false),
              ),
            ),
          ),
          Expanded(
            flex: 58,
            child: ColoredBox(
              color: PurchaseProjectData.backgroundWarm,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 48, 56, 48),
                child: Center(
                  child: Image.asset(
                    PurchaseProjectData.heroAsset,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PurchaseProjectData.category,
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
            color: PurchaseProjectData.textPrimary,
          ),
        ),
        SizedBox(height: compact ? 28 : 40),
        Text(
          PurchaseProjectData.title,
          style: AppTheme.sans.copyWith(
            fontSize: compact ? 40 : 56,
            fontWeight: FontWeight.w700,
            height: 1.02,
            letterSpacing: -1.4,
            color: PurchaseProjectData.textPrimary,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          PurchaseProjectData.subtitle,
          style: AppTheme.sans.copyWith(
            fontSize: 16,
            height: 1.5,
            color: PurchaseProjectData.textPrimary.withValues(alpha: 0.78),
          ),
        ),
        if (!compact) const Spacer(),
        if (compact) const SizedBox(height: 36),
        Text(
          PurchaseProjectData.conceptLabel,
          style: AppTheme.sans.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: PurchaseProjectData.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          PurchaseProjectData.designer,
          style: AppTheme.sans.copyWith(
            fontSize: 12,
            color: PurchaseProjectData.textPrimary.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}

// ─── 02 Challenge ────────────────────────────────────────────────────────────

class _ChallengeSection extends StatelessWidget {
  const _ChallengeSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return PagePadding(
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 11, child: _ChallengeCopy()),
                const SizedBox(width: 48),
                Expanded(
                  flex: 9,
                  child: Center(
                    child: _PhoneFrame(
                      asset: PurchaseProjectData.shippingAsset,
                      maxHeight: 580,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ChallengeCopy(),
                const SizedBox(height: 36),
                Center(
                  child: _PhoneFrame(
                    asset: PurchaseProjectData.shippingAsset,
                    maxHeight: 480,
                  ),
                ),
              ],
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
        const _Eyebrow(PurchaseProjectData.challengeEyebrow),
        const SizedBox(height: 18),
        const _SectionTitle(PurchaseProjectData.challengeTitle),
        const SizedBox(height: 16),
        const _Body(PurchaseProjectData.challengeLead),
        const SizedBox(height: 36),
        for (var i = 0; i < PurchaseProjectData.frictionPoints.length; i++) ...[
          if (i > 0) const SizedBox(height: 22),
          _FrictionRow(item: PurchaseProjectData.frictionPoints[i]),
        ],
      ],
    );
  }
}

class _FrictionRow extends StatelessWidget {
  const _FrictionRow({required this.item});

  final PurchaseFriction item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 44,
          margin: const EdgeInsets.only(top: 2),
          color: PurchaseProjectData.accentYellow,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: AppTheme.sans.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: PurchaseProjectData.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              _Body(item.body),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── 03 Design direction ─────────────────────────────────────────────────────

class _DirectionSection extends StatelessWidget {
  const _DirectionSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width > 900 ? 2 : 1;
    final items = PurchaseProjectData.decisions;

    return ColoredBox(
      color: PurchaseProjectData.backgroundWarm,
      child: PagePadding(
        vertical: width < 680 ? 64 : 88,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Eyebrow(PurchaseProjectData.directionEyebrow),
            const SizedBox(height: 18),
            const _SectionTitle(PurchaseProjectData.directionTitle),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: const _Body(PurchaseProjectData.directionLead),
            ),
            const SizedBox(height: 40),
            if (columns == 1)
              Column(
                children: [
                  for (var i = 0; i < items.length; i++) ...[
                    if (i > 0) const SizedBox(height: 14),
                    _DecisionCard(item: items[i]),
                  ],
                ],
              )
            else
              Column(
                children: [
                  for (var row = 0; row < 2; row++) ...[
                    if (row > 0) const SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var col = 0; col < 2; col++) ...[
                          if (col > 0) const SizedBox(width: 14),
                          Expanded(
                            child: _DecisionCard(
                              item: items[row * 2 + col],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _DecisionCard extends StatelessWidget {
  const _DecisionCard({required this.item});

  final PurchaseDecision item;

  @override
  Widget build(BuildContext context) {
    final bg = item.highlight
        ? PurchaseProjectData.accentYellow
        : Colors.white;
    final bodyColor = item.highlight
        ? PurchaseProjectData.textPrimary.withValues(alpha: 0.78)
        : PurchaseProjectData.textSecondary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 28, 28, 30),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: item.highlight
            ? null
            : Border.all(color: PurchaseProjectData.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                item.number,
                style: AppTheme.sans.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: PurchaseProjectData.textPrimary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.title,
                  style: AppTheme.sans.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                    color: PurchaseProjectData.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            item.body,
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              height: 1.55,
              color: bodyColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 04 Experience flow ──────────────────────────────────────────────────────

class _FlowSection extends StatelessWidget {
  const _FlowSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final steps = PurchaseProjectData.flowSteps;

    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Eyebrow(PurchaseProjectData.flowEyebrow),
          const SizedBox(height: 18),
          const _SectionTitle(PurchaseProjectData.flowTitle),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: const _Body(PurchaseProjectData.flowLead),
          ),
          const SizedBox(height: 40),
          if (width > 1100)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < steps.length; i++) ...[
                  if (i > 0) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 28),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: PurchaseProjectData.accentYellow,
                        size: 28,
                      ),
                    ),
                  ],
                  Expanded(child: _FlowStepCard(step: steps[i])),
                ],
              ],
            )
          else if (width < 680)
            Column(
              children: [
                for (var i = 0; i < steps.length; i++) ...[
                  if (i > 0) const SizedBox(height: 12),
                  _FlowStepCard(step: steps[i]),
                ],
              ],
            )
          else
            LayoutBuilder(
              builder: (context, constraints) {
                final cardW = (constraints.maxWidth - 12) / 2;
                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (final step in steps)
                      SizedBox(
                        width: cardW,
                        child: _FlowStepCard(step: step),
                      ),
                  ],
                );
              },
            ),
          const SizedBox(height: 28),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
            decoration: BoxDecoration(
              color: PurchaseProjectData.accentSoft,
              borderRadius: BorderRadius.circular(16),
            ),
            child: width > 700
                ? Row(
                    children: [
                      Text(
                        PurchaseProjectData.flowWhyLabel,
                        style: AppTheme.sans.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                          color: PurchaseProjectData.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 28),
                      Expanded(
                        child: Text(
                          PurchaseProjectData.flowWhy,
                          style: AppTheme.sans.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            height: 1.45,
                            color: PurchaseProjectData.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        PurchaseProjectData.flowWhyLabel,
                        style: AppTheme.sans.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        PurchaseProjectData.flowWhy,
                        style: AppTheme.sans.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _FlowStepCard extends StatelessWidget {
  const _FlowStepCard({required this.step});

  final PurchaseFlowStep step;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 22),
      decoration: BoxDecoration(
        color: step.highlight
            ? PurchaseProjectData.accentYellow
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: step.highlight
            ? null
            : Border.all(color: PurchaseProjectData.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step.number,
            style: AppTheme.sans.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: PurchaseProjectData.textSecondary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            step.label,
            style: AppTheme.sans.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: PurchaseProjectData.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            step.question,
            style: AppTheme.sans.copyWith(
              fontSize: 13,
              height: 1.45,
              color: PurchaseProjectData.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 05 Key moments ──────────────────────────────────────────────────────────

class _KeyMomentsSection extends StatelessWidget {
  const _KeyMomentsSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width > 1100 ? 3 : width > 700 ? 2 : 1;
    final items = PurchaseProjectData.keyMoments;

    return ColoredBox(
      color: PurchaseProjectData.backgroundWarm,
      child: PagePadding(
        vertical: width < 680 ? 64 : 88,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Eyebrow(PurchaseProjectData.momentsEyebrow),
            const SizedBox(height: 18),
            const _SectionTitle(PurchaseProjectData.momentsTitle),
            const SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                final gap = 20.0;
                final cardW = columns == 1
                    ? constraints.maxWidth
                    : (constraints.maxWidth - gap * (columns - 1)) / columns;

                return Wrap(
                  spacing: gap,
                  runSpacing: gap,
                  children: [
                    for (final item in items)
                      SizedBox(
                        width: cardW,
                        child: _MomentCard(item: item),
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

class _MomentCard extends StatelessWidget {
  const _MomentCard({required this.item});

  final PurchaseKeyMoment item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: PurchaseProjectData.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.number}  ${item.title}',
            style: AppTheme.sans.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: PurchaseProjectData.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item.body,
            style: AppTheme.sans.copyWith(
              fontSize: 13,
              height: 1.55,
              color: PurchaseProjectData.textSecondary,
            ),
          ),
          const SizedBox(height: 22),
          Center(
            child: _PhoneFrame(asset: item.asset, maxHeight: 420),
          ),
        ],
      ),
    );
  }
}

// ─── 06 System thinking ──────────────────────────────────────────────────────

class _SystemSection extends StatelessWidget {
  const _SystemSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;
    final cards = PurchaseProjectData.systemCards;

    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Eyebrow(PurchaseProjectData.systemEyebrow),
          const SizedBox(height: 18),
          const _SectionTitle(PurchaseProjectData.systemTitle),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: const _Body(PurchaseProjectData.systemLead),
          ),
          const SizedBox(height: 40),
          if (wide)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < cards.length; i++) ...[
                  if (i > 0) const SizedBox(width: 20),
                  Expanded(child: _SystemCard(card: cards[i])),
                ],
              ],
            )
          else
            Column(
              children: [
                for (var i = 0; i < cards.length; i++) ...[
                  if (i > 0) const SizedBox(height: 16),
                  _SystemCard(card: cards[i]),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

class _SystemCard extends StatelessWidget {
  const _SystemCard({required this.card});

  final PurchaseSystemCard card;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final split = width > 1100;

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: card.yellow
            ? PurchaseProjectData.accentYellow
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: card.yellow
            ? null
            : Border.all(color: PurchaseProjectData.border),
      ),
      child: split
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _systemCopy()),
                const SizedBox(width: 20),
                Expanded(
                  child: Center(
                    child: _PhoneFrame(asset: card.asset, maxHeight: 380),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _systemCopy(),
                const SizedBox(height: 24),
                Center(
                  child: _PhoneFrame(asset: card.asset, maxHeight: 380),
                ),
              ],
            ),
    );
  }

  Widget _systemCopy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          card.label,
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
            color: card.yellow
                ? PurchaseProjectData.textPrimary
                : PurchaseProjectData.accentYellow,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          card.title,
          style: AppTheme.sans.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.15,
            letterSpacing: -0.6,
            color: PurchaseProjectData.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          card.body,
          style: AppTheme.sans.copyWith(
            fontSize: 14,
            height: 1.55,
            color: PurchaseProjectData.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ─── 07 Outcome ──────────────────────────────────────────────────────────────

class _OutcomeSection extends StatelessWidget {
  const _OutcomeSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return ColoredBox(
      color: PurchaseProjectData.backgroundWarm,
      child: PagePadding(
        vertical: width < 680 ? 64 : 88,
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 12, child: _OutcomeCopy()),
                  const SizedBox(width: 36),
                  const Expanded(flex: 9, child: _NextStepsCard()),
                ],
              )
            : const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _OutcomeCopy(),
                  SizedBox(height: 28),
                  _NextStepsCard(),
                ],
              ),
      ),
    );
  }
}

class _OutcomeCopy extends StatelessWidget {
  const _OutcomeCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow(PurchaseProjectData.outcomeEyebrow),
        const SizedBox(height: 18),
        const _SectionTitle(PurchaseProjectData.outcomeTitle),
        const SizedBox(height: 16),
        const _Body(PurchaseProjectData.outcomeLead),
        const SizedBox(height: 36),
        LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 520;
            final pillars = PurchaseProjectData.outcomePillars;
            if (!wide) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < pillars.length; i++) ...[
                    if (i > 0) const SizedBox(height: 18),
                    _Pillar(item: pillars[i]),
                  ],
                ],
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < pillars.length; i++) ...[
                  if (i > 0) const SizedBox(width: 24),
                  Expanded(child: _Pillar(item: pillars[i])),
                ],
              ],
            );
          },
        ),
        const SizedBox(height: 48),
        Text(
          PurchaseProjectData.role,
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            letterSpacing: 0.8,
            color: PurchaseProjectData.textSecondary,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          PurchaseProjectData.thankYou,
          style: AppTheme.sans.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.8,
            color: PurchaseProjectData.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          PurchaseProjectData.designer,
          style: AppTheme.sans.copyWith(
            fontSize: 12,
            color: PurchaseProjectData.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _Pillar extends StatelessWidget {
  const _Pillar({required this.item});

  final PurchasePillar item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.label,
          style: AppTheme.sans.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: PurchaseProjectData.accentYellow,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.body,
          style: AppTheme.sans.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: PurchaseProjectData.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _NextStepsCard extends StatelessWidget {
  const _NextStepsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 36),
      decoration: BoxDecoration(
        color: PurchaseProjectData.accentYellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PurchaseProjectData.nextStepLabel,
            style: AppTheme.sans.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
              color: PurchaseProjectData.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            PurchaseProjectData.nextStepTitle,
            style: AppTheme.sans.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: -0.5,
              color: PurchaseProjectData.textPrimary,
            ),
          ),
          const SizedBox(height: 28),
          for (var i = 0;
              i < PurchaseProjectData.nextSteps.length;
              i++) ...[
            if (i > 0) const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                  child: Text(
                    '${i + 1}',
                    style: AppTheme.sans.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: PurchaseProjectData.textPrimary,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    PurchaseProjectData.nextSteps[i],
                    style: AppTheme.sans.copyWith(
                      fontSize: 15,
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                      color: PurchaseProjectData.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
