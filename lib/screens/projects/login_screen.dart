import 'package:flutter/material.dart';

import '../../data/login_project_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shared.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: LoginProjectData.cream,
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
            _SectionGap(width: width),
            const _ProblemSection(),
            _SectionGap(width: width),
            const _UserNeedSection(),
            _SectionGap(width: width),
            const _FlowSection(),
            _SectionGap(width: width),
            const _TrustSection(),
            _SectionGap(width: width),
            const _TestingSection(),
            _SectionGap(width: width),
            const _ReflectionSection(),
            _SectionGap(width: width),
            const _OutcomeSection(),
          ],
        ),
      ),
    );
  }
}

class _SectionGap extends StatelessWidget {
  const _SectionGap({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: width < 680 ? 64 : 92);
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.eyebrow, required this.title});

  final String eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: AppTheme.sans.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: LoginProjectData.muted,
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: Text(
            title,
            style: AppTheme.sans.copyWith(
              fontSize: (width * 0.034).clamp(29.0, 46.0),
              fontWeight: FontWeight.w700,
              height: 1.1,
              letterSpacing: -1,
              color: LoginProjectData.ink,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Container(height: 2, color: LoginProjectData.yellow),
      ],
    );
  }
}

class _PhoneImage extends StatelessWidget {
  const _PhoneImage({required this.asset, this.height = 480});

  final String asset;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(
        asset,
        fit: BoxFit.contain,
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  const _BodyText(this.text, {this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTheme.sans.copyWith(
        fontSize: 16,
        height: 1.6,
        color: color ?? LoginProjectData.muted,
      ),
    );
  }
}

class _NumberedItem extends StatelessWidget {
  const _NumberedItem({required this.item, this.compact = false});

  final LoginContentItem item;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: compact ? 32 : 36,
          height: compact ? 32 : 36,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: LoginProjectData.yellow,
            shape: BoxShape.circle,
          ),
          child: Text(
            item.number,
            style: AppTheme.sans.copyWith(
              fontSize: compact ? 11 : 12,
              fontWeight: FontWeight.w700,
              color: LoginProjectData.ink,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: AppTheme.sans.copyWith(
                  fontSize: compact ? 17 : 20,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                  color: LoginProjectData.ink,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                item.body,
                style: AppTheme.sans.copyWith(
                  fontSize: compact ? 14 : 15,
                  height: 1.55,
                  color: LoginProjectData.muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
            color: LoginProjectData.yellow,
            child: PagePadding(vertical: 56, child: const _HeroCopy()),
          ),
          ColoredBox(
            color: LoginProjectData.cream,
            child: PagePadding(
              vertical: 36,
              child: const _PhoneGallery(height: 340),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      height: (width * 0.43).clamp(540.0, 680.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 41,
            child: ColoredBox(
              color: LoginProjectData.yellow,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(56, 68, 44, 52),
                child: const _HeroCopy(withSpacer: true),
              ),
            ),
          ),
          const Expanded(
            flex: 59,
            child: ColoredBox(
              color: LoginProjectData.cream,
              child: Padding(
                padding: EdgeInsets.fromLTRB(26, 44, 48, 38),
                child: _PhoneGallery(height: 540),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({this.withSpacer = false});

  final bool withSpacer;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LOGIN &\nREGISTRATION',
          style: AppTheme.sans.copyWith(
            fontSize: (width * 0.043).clamp(40.0, 58.0),
            fontWeight: FontWeight.w800,
            height: 1.02,
            letterSpacing: -1.4,
            color: LoginProjectData.ink,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          LoginProjectData.subtitle,
          style: AppTheme.sans.copyWith(
            fontSize: 20,
            height: 1.45,
            color: LoginProjectData.ink,
          ),
        ),
        if (withSpacer) const Spacer() else const SizedBox(height: 42),
        Text(
          LoginProjectData.category,
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: LoginProjectData.ink,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          LoginProjectData.scope,
          style: AppTheme.sans.copyWith(
            fontSize: 14,
            height: 1.5,
            color: LoginProjectData.muted,
          ),
        ),
      ],
    );
  }
}

class _PhoneGallery extends StatelessWidget {
  const _PhoneGallery({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final phoneHeight = height.clamp(240.0, constraints.maxHeight);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final asset in const [
              LoginProjectData.registerAsset,
              LoginProjectData.loginAsset,
              LoginProjectData.verifyAsset,
            ])
              Expanded(
                child: _PhoneImage(asset: asset, height: phoneHeight),
              ),
          ],
        );
      },
    );
  }
}

class _ProblemSection extends StatelessWidget {
  const _ProblemSection();

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;
    final content = Column(
      children: [
        for (var i = 0; i < LoginProjectData.frictionPoints.length; i++) ...[
          if (i > 0) const SizedBox(height: 28),
          _NumberedItem(item: LoginProjectData.frictionPoints[i]),
        ],
      ],
    );

    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'The problem',
            title: 'Account access asked for too much, too soon',
          ),
          const SizedBox(height: 40),
          if (wide)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: _PhoneImage(
                    asset: LoginProjectData.registerAsset,
                    height: 500,
                  ),
                ),
                const SizedBox(width: 54),
                Expanded(flex: 6, child: content),
              ],
            )
          else ...[
            const Center(
              child: _PhoneImage(
                asset: LoginProjectData.registerAsset,
                height: 440,
              ),
            ),
            const SizedBox(height: 36),
            content,
          ],
        ],
      ),
    );
  }
}

class _UserNeedSection extends StatelessWidget {
  const _UserNeedSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return ColoredBox(
      color: LoginProjectData.warm,
      child: PagePadding(
        vertical: width < 680 ? 64 : 84,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              eyebrow: 'User need',
              title: 'Give people a fast route—and a reason to return',
            ),
            const SizedBox(height: 40),
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(flex: 6, child: _UserNeedCopy()),
                  const SizedBox(width: 54),
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      LoginProjectData.handLoginAsset,
                      height: 500,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _UserNeedCopy(),
                  const SizedBox(height: 32),
                  Center(
                    child: Image.asset(
                      LoginProjectData.handLoginAsset,
                      height: 440,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _UserNeedCopy extends StatelessWidget {
  const _UserNeedCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Users should be able to choose the path that matches their intent.',
          style: AppTheme.sans.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: LoginProjectData.ink,
          ),
        ),
        const SizedBox(height: 18),
        const _BodyText(
          'Returning users need speed. New users need confidence. Hesitant users need a low-commitment option.',
        ),
        const SizedBox(height: 34),
        Container(
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: LoginProjectData.yellow,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DESIGN RESPONSE',
                style: AppTheme.sans.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.4,
                  color: LoginProjectData.ink,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Email login, Apple/Google sign-in, password recovery and guest access in one clear hierarchy.',
                style: AppTheme.sans.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  height: 1.45,
                  color: LoginProjectData.ink,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FlowSection extends StatelessWidget {
  const _FlowSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 720;

    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'Flow strategy',
            title: 'One decision per screen keeps the journey moving',
          ),
          const SizedBox(height: 42),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = compact ? 1 : 4;
              const gap = 18.0;
              final itemWidth =
                  (constraints.maxWidth - gap * (columns - 1)) / columns;
              return Wrap(
                spacing: gap,
                runSpacing: 18,
                children: [
                  for (final item in LoginProjectData.flowSteps)
                    SizedBox(
                      width: itemWidth,
                      child: _FlowCard(item: item),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 34),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: LoginProjectData.line),
            ),
            child: Text(
              'The flow reduces cognitive load by separating identity, verification and success into distinct moments.',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                height: 1.5,
                color: LoginProjectData.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FlowCard extends StatelessWidget {
  const _FlowCard({required this.item});

  final LoginContentItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 26),
      decoration: BoxDecoration(
        color: LoginProjectData.cream,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: LoginProjectData.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.number,
            style: AppTheme.sans.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: LoginProjectData.yellow,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            item.title,
            style: AppTheme.sans.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: LoginProjectData.ink,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item.body,
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              height: 1.5,
              color: LoginProjectData.muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrustSection extends StatelessWidget {
  const _TrustSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 980;

    return ColoredBox(
      color: LoginProjectData.warm,
      child: PagePadding(
        vertical: width < 680 ? 64 : 84,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              eyebrow: 'Trust & feedback',
              title: 'Verification makes security visible—not intimidating',
            ),
            const SizedBox(height: 40),
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      LoginProjectData.handVerifyAsset,
                      height: 470,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: _PhoneImage(
                      asset: LoginProjectData.successAsset,
                      height: 470,
                    ),
                  ),
                  const SizedBox(width: 46),
                  const Expanded(child: _TrustCopy()),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          LoginProjectData.handVerifyAsset,
                          height: 400,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      const Expanded(
                        child: _PhoneImage(
                          asset: LoginProjectData.successAsset,
                          height: 400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 34),
                  const _TrustCopy(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _TrustCopy extends StatelessWidget {
  const _TrustCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why it matters',
          style: AppTheme.sans.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: LoginProjectData.ink,
          ),
        ),
        const SizedBox(height: 20),
        const _BodyText(
          'A clear verification state reassures users that their account is protected.',
        ),
        const SizedBox(height: 22),
        const _BodyText(
          'Immediate success feedback closes uncertainty and explains what the account unlocks next.',
        ),
        const SizedBox(height: 28),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: LoginProjectData.yellow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'Security + clarity = confidence',
            textAlign: TextAlign.center,
            style: AppTheme.sans.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: LoginProjectData.ink,
            ),
          ),
        ),
      ],
    );
  }
}

class _TestingSection extends StatelessWidget {
  const _TestingSection();

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(
            eyebrow: 'Testing plan',
            title: 'Test the moments where hesitation can stop conversion',
          ),
          const SizedBox(height: 40),
          for (var i = 0; i < LoginProjectData.testingPoints.length; i++) ...[
            if (i > 0) const Divider(height: 38, color: LoginProjectData.line),
            _TestingRow(item: LoginProjectData.testingPoints[i]),
          ],
          const SizedBox(height: 34),
          Text(
            'Success signals: fewer abandoned forms, fewer repeated errors, faster completion and stronger confidence.',
            style: AppTheme.sans.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              height: 1.5,
              color: LoginProjectData.ink,
            ),
          ),
        ],
      ),
    );
  }
}

class _TestingRow extends StatelessWidget {
  const _TestingRow({required this.item});

  final LoginContentItem item;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 680;
    if (compact) {
      return _NumberedItem(item: item, compact: true);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          child: Text(
            item.number,
            style: AppTheme.sans.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: LoginProjectData.yellow,
            ),
          ),
        ),
        SizedBox(
          width: 285,
          child: Text(
            item.title,
            style: AppTheme.sans.copyWith(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: LoginProjectData.ink,
            ),
          ),
        ),
        const SizedBox(width: 28),
        Expanded(child: _BodyText(item.body)),
      ],
    );
  }
}

class _ReflectionSection extends StatelessWidget {
  const _ReflectionSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 820;

    return ColoredBox(
      color: LoginProjectData.warm,
      child: PagePadding(
        vertical: width < 680 ? 64 : 84,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              eyebrow: 'Design reflection',
              title: 'The hardest work was deciding what not to ask',
            ),
            const SizedBox(height: 40),
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: _ReflectionList(
                      label: 'WHAT CHALLENGED THE DESIGN',
                      items: LoginProjectData.challenges,
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 290,
                    margin: const EdgeInsets.symmetric(horizontal: 48),
                    color: LoginProjectData.yellow,
                  ),
                  const Expanded(
                    child: _ReflectionList(
                      label: 'WHAT MOVED FASTER',
                      items: LoginProjectData.accelerators,
                    ),
                  ),
                ],
              )
            else
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ReflectionList(
                    label: 'WHAT CHALLENGED THE DESIGN',
                    items: LoginProjectData.challenges,
                  ),
                  SizedBox(height: 40),
                  _ReflectionList(
                    label: 'WHAT MOVED FASTER',
                    items: LoginProjectData.accelerators,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _ReflectionList extends StatelessWidget {
  const _ReflectionList({required this.label, required this.items});

  final String label;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.sans.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
            color: LoginProjectData.muted,
          ),
        ),
        const SizedBox(height: 24),
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(height: 22),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 8),
                color: LoginProjectData.yellow,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  items[i],
                  style: AppTheme.sans.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.45,
                    color: LoginProjectData.ink,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _OutcomeSection extends StatelessWidget {
  const _OutcomeSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    final left = ColoredBox(
      color: LoginProjectData.yellow,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          wide ? 56 : 28,
          wide ? 64 : 48,
          wide ? 44 : 28,
          wide ? 64 : 48,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'THE OUTCOME',
              style: AppTheme.sans.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: LoginProjectData.ink,
              ),
            ),
            const SizedBox(height: 34),
            Text(
              'Access feels\nsimple,\nclear and\nworthwhile.',
              style: AppTheme.sans.copyWith(
                fontSize: (width * 0.037).clamp(34.0, 50.0),
                fontWeight: FontWeight.w800,
                height: 1.08,
                letterSpacing: -1,
                color: LoginProjectData.ink,
              ),
            ),
            const SizedBox(height: 42),
            const _BodyText(
              'A focused flow supports conversion without sacrificing trust.',
              color: LoginProjectData.ink,
            ),
          ],
        ),
      ),
    );

    final right = Padding(
      padding: EdgeInsets.fromLTRB(
        wide ? 56 : 28,
        wide ? 64 : 48,
        wide ? 56 : 28,
        wide ? 64 : 56,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What this case study demonstrates',
            style: AppTheme.sans.copyWith(
              fontSize: 29,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: LoginProjectData.ink,
            ),
          ),
          const SizedBox(height: 36),
          for (var i = 0; i < LoginProjectData.outcomes.length; i++) ...[
            if (i > 0) const SizedBox(height: 28),
            _NumberedItem(item: LoginProjectData.outcomes[i]),
          ],
          const SizedBox(height: 42),
          Text(
            'LOGIN & REGISTRATION · UX/UI CASE STUDY',
            style: AppTheme.sans.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
              color: LoginProjectData.muted,
            ),
          ),
        ],
      ),
    );

    if (!wide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [left, right],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 42, child: left),
        Expanded(flex: 58, child: right),
      ],
    );
  }
}
