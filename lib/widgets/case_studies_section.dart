import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../screens/projects/cola_screen.dart';
import '../screens/projects/components_screen.dart';
import '../screens/projects/feedback_screen.dart';
import '../screens/projects/fitlab_screen.dart';
import '../screens/projects/login_screen.dart';
import '../screens/projects/purchase_screen.dart';
import '../screens/projects/yemeksepeti_screen.dart';
import '../screens/projects/zara_screen.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class CaseStudiesSection extends StatelessWidget {
  const CaseStudiesSection({super.key, this.onViewAll});

  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;
    final titleSize = (width * 0.044).clamp(40.0, 66.0);
    final columns = width > 1120 ? 3 : width > 680 ? 2 : 1;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: width < 680 ? 78 : 118,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 12,
                        child: _Heading(titleSize: titleSize),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Product concepts and focused case studies across '
                          'interaction, commerce, wearables, conversion, and '
                          'scalable interface systems.',
                          style: AppTheme.sans.copyWith(
                            fontSize: 13,
                            height: 1.72,
                            color: AppColors.muted,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Heading(titleSize: titleSize),
                      const SizedBox(height: 24),
                      Text(
                        'Product concepts and focused case studies across '
                        'interaction, commerce, wearables, conversion, and '
                        'scalable interface systems.',
                        style: AppTheme.sans.copyWith(
                          fontSize: 13,
                          height: 1.72,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: width < 680 ? 42 : 68),
            _CaseGrid(columns: columns),
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({required this.titleSize});

  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SELECTED PRODUCT WORK',
          style: AppTheme.sans.copyWith(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 18),
        Text.rich(
          TextSpan(
            style: AppTheme.serif.copyWith(
              fontSize: titleSize,
              fontWeight: FontWeight.w500,
              height: 1.02,
              letterSpacing: -1.2,
            ),
            children: const [
              TextSpan(text: 'Ideas explored.\n'),
              TextSpan(
                text: 'Experiences resolved.',
                style: TextStyle(color: AppColors.mutedSoft),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CaseGrid extends StatelessWidget {
  const _CaseGrid({required this.columns});

  final int columns;

  @override
  Widget build(BuildContext context) {
    final items = HomeData.caseStudies;
    final rows = <Widget>[];

    for (var i = 0; i < items.length; i += columns) {
      final count = (items.length - i).clamp(0, columns);
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var j = 0; j < columns; j++) ...[
              if (j > 0) const SizedBox(width: 24),
              Expanded(
                child: j < count
                    ? _FeatureCaseCard(item: items[i + j])
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      );
      if (i + columns < items.length) {
        rows.add(const SizedBox(height: 24));
      }
    }

    return Column(children: rows);
  }
}

class _FeatureCaseCard extends StatefulWidget {
  const _FeatureCaseCard({required this.item});

  final HomeCaseStudy item;

  @override
  State<_FeatureCaseCard> createState() => _FeatureCaseCardState();
}

class _FeatureCaseCardState extends State<_FeatureCaseCard> {
  bool _hovered = false;

  void _openProject() {
    final Widget? screen = switch (widget.item.projectId) {
      'zara' => const ZaraScreen(),
      'cola' => const ColaScreen(),
      'fitlab' => const FitlabScreen(),
      'yemeksepeti' => const YemeksepetiScreen(),
      'purchase' => const PurchaseScreen(),
      'login' => const LoginScreen(),
      'feedback' => const FeedbackScreen(),
      'components' => const ComponentsScreen(),
      _ => null,
    };
    if (screen == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 680;
    final canOpen = widget.item.projectId != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: canOpen ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: canOpen ? _openProject : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(compact ? 20 : 25),
            border: Border.all(
              color: AppColors.mustard.withValues(alpha: _hovered ? 1 : 0.8),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.foreground.withValues(
                  alpha: _hovered ? 0.14 : 0.09,
                ),
                blurRadius: _hovered ? 64 : 48,
                offset: Offset(0, _hovered ? 24 : 16),
              ),
              if (_hovered)
                BoxShadow(
                  color: AppColors.mustard.withValues(alpha: 0.1),
                  blurRadius: 0,
                  spreadRadius: 5,
                ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: AspectRatio(
            aspectRatio: compact ? 1.08 : 1.18,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final panelW =
                    constraints.maxWidth * (compact ? 0.56 : 0.53);
                final maxPanelH =
                    constraints.maxHeight * (compact ? 0.78 : 0.72);

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    _CaseVisual(item: widget.item, hovered: _hovered),
                    IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0),
                              Colors.white.withValues(alpha: 0.12),
                              Colors.white.withValues(alpha: 0.35),
                            ],
                            stops: const [0.38, 0.68, 1],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: compact ? 12 : 16,
                      top: compact ? 12 : 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: compact ? 10 : 11,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.88),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: AppColors.mustard.withValues(alpha: 0.9),
                          ),
                        ),
                        child: Text(
                          widget.item.keyword,
                          style: AppTheme.sans.copyWith(
                            fontSize: 7,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.6,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: compact ? 12 : 16,
                      top: 0,
                      bottom: 0,
                      width: panelW,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: panelW,
                            maxHeight: maxPanelH,
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: panelW,
                              child: _CoverCopy(item: widget.item),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CaseVisual extends StatelessWidget {
  const _CaseVisual({required this.item, required this.hovered});

  final HomeCaseStudy item;
  final bool hovered;

  @override
  Widget build(BuildContext context) {
    if (item.secondaryImage != null) {
      return _PurchaseMontage(
        primary: item.image,
        secondary: item.secondaryImage!,
        hovered: hovered,
      );
    }

    return AnimatedScale(
      scale: hovered ? 1.035 : 1,
      duration: const Duration(milliseconds: 650),
      curve: const Cubic(0.2, 0.7, 0.2, 1),
      child: Image.asset(
        item.image,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class _PurchaseMontage extends StatelessWidget {
  const _PurchaseMontage({
    required this.primary,
    required this.secondary,
    required this.hovered,
  });

  final String primary;
  final String secondary;
  final bool hovered;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final phoneW = constraints.maxWidth * 0.43;
        return Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    const Color(0xFFF5F5F3),
                    AppColors.mustard.withValues(alpha: 0.55),
                  ],
                  stops: const [0, 0.65, 1],
                ),
              ),
            ),
            Positioned(
              left: constraints.maxWidth * 0.01,
              top: constraints.maxHeight * 0.09,
              width: phoneW,
              height: constraints.maxHeight * 0.83,
              child: Transform.rotate(
                angle: -0.07,
                child: _MontagePhone(asset: primary, hovered: hovered),
              ),
            ),
            Positioned(
              right: constraints.maxWidth * 0.16,
              top: constraints.maxHeight * 0.11,
              width: constraints.maxWidth * 0.45,
              height: constraints.maxHeight * 0.79,
              child: Transform.rotate(
                angle: 0.07,
                child: _MontagePhone(asset: secondary, hovered: hovered),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _MontagePhone extends StatelessWidget {
  const _MontagePhone({required this.asset, required this.hovered});

  final String asset;
  final bool hovered;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: hovered ? 1.03 : 1,
      duration: const Duration(milliseconds: 450),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.96),
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: AppColors.foreground.withValues(alpha: 0.16),
              blurRadius: 45,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          asset,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

class _CoverCopy extends StatelessWidget {
  const _CoverCopy({required this.item});

  final HomeCaseStudy item;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 680;

    return Container(
      padding: EdgeInsets.fromLTRB(
        compact ? 14 : 18,
        compact ? 16 : 18,
        compact ? 14 : 18,
        compact ? 14 : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.91),
        borderRadius: BorderRadius.circular(compact ? 16 : 19),
        border: Border.all(color: AppColors.mustard.withValues(alpha: 0.88)),
        boxShadow: [
          BoxShadow(
            color: AppColors.foreground.withValues(alpha: 0.13),
            blurRadius: 48,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.type,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.sans.copyWith(
              fontSize: 6,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              height: 1.4,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.serif.copyWith(
              fontSize: compact ? 26 : 30,
              fontWeight: FontWeight.w500,
              height: 0.96,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.headline,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.sans.copyWith(
              fontSize: 8,
              height: 1.45,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            item.subline,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.sans.copyWith(
              fontSize: 8,
              height: 1.45,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.foreground.withValues(alpha: 0.13),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'VIEW PROJECT',
                    style: AppTheme.sans.copyWith(
                      fontSize: 7,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: AppColors.mustard,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '↗',
                    style: TextStyle(fontSize: 13, height: 1),
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
