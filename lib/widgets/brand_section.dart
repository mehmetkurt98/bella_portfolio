import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class BrandSection extends StatefulWidget {
  const BrandSection({super.key});

  @override
  State<BrandSection> createState() => _BrandSectionState();
}

class _BrandSectionState extends State<BrandSection> {
  int? _openIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final titleSize = (width * 0.044).clamp(40.0, 66.0);
    final columns = width > 900 ? 3 : width > 680 ? 2 : 1;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: width < 680 ? 78 : 118,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            width > 900
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(flex: 12, child: _Heading(titleSize: titleSize)),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Identity, storytelling, and product expression built '
                          'as one coherent experience.',
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
                        'Identity, storytelling, and product expression built '
                        'as one coherent experience.',
                        style: AppTheme.sans.copyWith(
                          fontSize: 13,
                          height: 1.72,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 48),
            _BrandGrid(
              columns: columns,
              openIndex: _openIndex,
              onToggle: (index) {
                setState(() {
                  _openIndex = _openIndex == index ? null : index;
                });
              },
            ),
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
          'SELECTED BRAND WORK',
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
              TextSpan(text: 'Products are used.\n'),
              TextSpan(
                text: 'Brands are remembered.',
                style: TextStyle(color: AppColors.mutedSoft),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BrandGrid extends StatelessWidget {
  const _BrandGrid({
    required this.columns,
    required this.openIndex,
    required this.onToggle,
  });

  final int columns;
  final int? openIndex;
  final ValueChanged<int> onToggle;

  @override
  Widget build(BuildContext context) {
    final items = HomeData.brandCases;
    final rows = <Widget>[];

    for (var i = 0; i < items.length; i += columns) {
      final count = (items.length - i).clamp(0, columns);
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var j = 0; j < columns; j++) ...[
              if (j > 0) const SizedBox(width: 22),
              Expanded(
                child: j < count
                    ? _BrandCard(
                        item: items[i + j],
                        open: openIndex == i + j,
                        onToggle: () => onToggle(i + j),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      );
      if (i + columns < items.length) {
        rows.add(const SizedBox(height: 14));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }
}

class _BrandCard extends StatelessWidget {
  const _BrandCard({
    required this.item,
    required this.open,
    required this.onToggle,
  });

  final BrandCase item;
  final bool open;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.mustard.withValues(alpha: open ? 1 : 0.78),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.foreground.withValues(alpha: 0.08),
            blurRadius: 55,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onToggle,
            child: SizedBox(
              height: 340,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 44, 28, 70),
                      child: Image.asset(
                        item.logo,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.mustard),
                        color: AppColors.mustard.withValues(alpha: 0.16),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        open ? '×' : '+',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: open
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(30, 38, 30, 42),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.mustard.withValues(alpha: 0.78),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.label,
                          style: AppTheme.sans.copyWith(
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.3,
                            color: AppColors.muted,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          item.title,
                          style: AppTheme.serif.copyWith(
                            fontSize: 42,
                            fontWeight: FontWeight.w500,
                            height: 0.95,
                            letterSpacing: -1.5,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          item.intro,
                          style: AppTheme.sans.copyWith(
                            fontSize: 16,
                            height: 1.45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          item.body,
                          style: AppTheme.sans.copyWith(
                            fontSize: 13,
                            height: 1.75,
                            color: AppColors.muted,
                          ),
                        ),
                        const SizedBox(height: 38),
                        Container(
                          padding: const EdgeInsets.only(top: 24),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppColors.border),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _Meta(
                                  label: item.ideaLabel,
                                  value: item.idea,
                                ),
                              ),
                              Expanded(
                                child: _Meta(
                                  label: item.principleLabel,
                                  value: item.principle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTheme.sans.copyWith(
            fontSize: 7,
            letterSpacing: 1.3,
            height: 1.8,
            color: AppColors.muted,
          ),
        ),
        Text(
          value,
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
