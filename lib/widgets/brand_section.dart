import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key});

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
            EqualHeightGrid(
              itemCount: HomeData.brandCases.length,
              columns: columns,
              spacing: 22,
              runSpacing: 14,
              itemBuilder: (context, index) =>
                  _BrandCard(item: HomeData.brandCases[index]),
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

class _BrandCard extends StatefulWidget {
  const _BrandCard({required this.item});

  final BrandCase item;

  @override
  State<_BrandCard> createState() => _BrandCardState();
}

class _BrandCardState extends State<_BrandCard> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.mustard.withValues(alpha: _open ? 1 : 0.78),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.foreground.withValues(alpha: 0.08),
            blurRadius: 55,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () => setState(() => _open = !_open),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
            child: SizedBox(
              height: 360,
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 44, 28, 70),
                      child: Image.asset(
                        widget.item.logo,
                        fit: BoxFit.contain,
                        height: 250,
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
                        _open ? '×' : '+',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Container(
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
                children: [
                  Text(
                    widget.item.label,
                    style: AppTheme.sans.copyWith(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.3,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    widget.item.title,
                    style: AppTheme.serif.copyWith(
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                      height: 0.95,
                      letterSpacing: -1.5,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.item.intro,
                    style: AppTheme.sans.copyWith(
                      fontSize: 18,
                      height: 1.45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.item.body,
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
                      border: Border(top: BorderSide(color: AppColors.border)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _Meta(
                            label: widget.item.ideaLabel,
                            value: widget.item.idea,
                          ),
                        ),
                        Expanded(
                          child: _Meta(
                            label: widget.item.principleLabel,
                            value: widget.item.principle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            crossFadeState:
                _open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 280),
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
