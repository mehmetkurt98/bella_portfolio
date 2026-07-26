import 'package:flutter/material.dart';

import '../../data/fitlab_project_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shared.dart';

class FitlabScreen extends StatelessWidget {
  const FitlabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 980;

    return Scaffold(
      backgroundColor: FitlabProjectData.softBg,
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
            PagePadding(
              vertical: 8,
              child: wide ? const _WideHero() : const _CompactHero(),
            ),
            const SizedBox(height: 40),
            PagePadding(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  FitlabProjectData.coverAsset,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 320,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 56),
            const PagePadding(child: _ProcessSection()),
            const SizedBox(height: 48),
            const PagePadding(child: _FooterStrip()),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}

class _WideHero extends StatelessWidget {
  const _WideHero();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: _HeroCopy()),
        SizedBox(width: 48),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: _ProjectMeta(),
          ),
        ),
      ],
    );
  }
}

class _ProjectMeta extends StatelessWidget {
  const _ProjectMeta();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${FitlabProjectData.category}  ·  ${FitlabProjectData.year}',
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: FitlabProjectData.muted,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          FitlabProjectData.title,
          style: AppTheme.serif.copyWith(
            fontSize: 42,
            fontWeight: FontWeight.w600,
            height: 1.1,
            color: FitlabProjectData.ink,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Mobile product design for nutrition habits, personal goals, and daily tracking — from strategy to a live Android release.',
          style: AppTheme.sans.copyWith(
            fontSize: 14,
            height: 1.7,
            color: FitlabProjectData.muted,
          ),
        ),
      ],
    );
  }
}

class _CompactHero extends StatelessWidget {
  const _CompactHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${FitlabProjectData.category}  ·  ${FitlabProjectData.year}',
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: FitlabProjectData.muted,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          FitlabProjectData.title,
          style: AppTheme.serif.copyWith(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            height: 1.1,
            color: FitlabProjectData.ink,
          ),
        ),
        const SizedBox(height: 20),
        const _HeroCopy(),
      ],
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: FitlabProjectData.brandYellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.favorite_rounded, size: 22, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: FitlabProjectData.logoPrimary,
                        style: AppTheme.sans.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: FitlabProjectData.ink,
                        ),
                      ),
                      TextSpan(
                        text: ' ${FitlabProjectData.logoAccent}',
                        style: AppTheme.serif.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: FitlabProjectData.brandYellowDeep,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 28),
        Text.rich(
          TextSpan(
            style: AppTheme.sans.copyWith(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              height: 1.15,
              color: FitlabProjectData.ink,
            ),
            children: [
              TextSpan(text: FitlabProjectData.headlineLead),
              TextSpan(
                text: FitlabProjectData.headlineAccent,
                style: const TextStyle(color: FitlabProjectData.brandYellowDeep),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          FitlabProjectData.description,
          style: AppTheme.sans.copyWith(
            fontSize: 14,
            height: 1.7,
            color: FitlabProjectData.muted,
          ),
        ),
        const SizedBox(height: 28),
        for (final feature in FitlabProjectData.features) ...[
          _FeatureRow(feature: feature),
          const SizedBox(height: 14),
        ],
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: FitlabProjectData.brandYellow,
            foregroundColor: FitlabProjectData.ink,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 0,
          ),
          icon: const Icon(Icons.android_rounded, size: 18),
          label: Text(
            FitlabProjectData.ctaLabel,
            style: AppTheme.sans.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({required this.feature});

  final FitlabFeature feature;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: FitlabProjectData.brandYellow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(feature.icon, size: 18, color: FitlabProjectData.ink),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feature.title,
                style: AppTheme.sans.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: FitlabProjectData.ink,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                feature.subtitle,
                style: AppTheme.sans.copyWith(
                  fontSize: 12.5,
                  height: 1.45,
                  color: FitlabProjectData.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProcessSection extends StatelessWidget {
  const _ProcessSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width > 1100
        ? 4
        : width > 800
            ? 3
            : width > 560
                ? 2
                : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PROCESS',
          style: AppTheme.sans.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.4,
            color: FitlabProjectData.muted,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'From strategy to shipped Android product',
          style: AppTheme.sans.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: FitlabProjectData.ink,
          ),
        ),
        const SizedBox(height: 28),
        EqualHeightGrid(
          itemCount: FitlabProjectData.processSteps.length,
          columns: columns,
          spacing: 16,
          runSpacing: 16,
          itemBuilder: (context, index) {
            final step = FitlabProjectData.processSteps[index];
            return _ProcessCard(step: step, index: index + 1);
          },
        ),
      ],
    );
  }
}

class _ProcessCard extends StatelessWidget {
  const _ProcessCard({
    required this.step,
    required this.index,
  });

  final FitlabProcessStep step;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E8E4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(step.icon, size: 20, color: FitlabProjectData.brandYellowDeep),
              const Spacer(),
              Text(
                index.toString().padLeft(2, '0'),
                style: AppTheme.sans.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: FitlabProjectData.muted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            step.title,
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: FitlabProjectData.ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            step.body,
            style: AppTheme.sans.copyWith(
              fontSize: 12.5,
              height: 1.5,
              color: FitlabProjectData.muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterStrip extends StatelessWidget {
  const _FooterStrip();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
        color: FitlabProjectData.brandYellow,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(Icons.favorite_rounded, size: 18, color: FitlabProjectData.ink),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              FitlabProjectData.footerQuote,
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.45,
                color: FitlabProjectData.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
