import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class StrategySection extends StatelessWidget {
  const StrategySection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;
    final titleSize =
        (MediaQuery.sizeOf(context).width * 0.044).clamp(40.0, 66.0);

    return ColoredBox(
      color: AppColors.inkSoft,
      child: PagePadding(
        vertical: MediaQuery.sizeOf(context).width < 680 ? 78 : 118,
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 78,
                    child: _Intro(titleSize: titleSize),
                  ),
                  const SizedBox(width: 48),
                  const Expanded(flex: 122, child: _Questions()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Intro(titleSize: titleSize),
                  const SizedBox(height: 36),
                  const _Questions(),
                ],
              ),
      ),
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro({required this.titleSize});

  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UX STRATEGY · HOW I THINK',
          style: AppTheme.sans.copyWith(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Good UX begins\nbefore the first screen.',
          style: AppTheme.serif.copyWith(
            fontSize: titleSize,
            fontWeight: FontWeight.w500,
            height: 1.02,
            letterSpacing: -1.2,
            color: AppColors.mustard,
          ),
        ),
        const SizedBox(height: 32),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(
            'My process creates alignment before it creates polish. I move from '
            'evidence to structure, from structure to a testable solution, and '
            'from a solution to a system that can grow.',
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              height: 1.8,
              color: const Color(0xFFAAAAAA),
            ),
          ),
        ),
      ],
    );
  }
}

class _Questions extends StatelessWidget {
  const _Questions();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF555555))),
      ),
      child: Column(
        children: [
          for (var i = 0; i < HomeData.strategyQuestions.length; i++)
            _FaqRow(
              index: i,
              item: HomeData.strategyQuestions[i],
              dark: true,
            ),
        ],
      ),
    );
  }
}

class FaqAccordion extends StatelessWidget {
  const FaqAccordion({
    super.key,
    required this.items,
    this.dark = false,
  });

  final List<FaqItem> items;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < items.length; i++)
          _FaqRow(index: i, item: items[i], dark: dark),
      ],
    );
  }
}

class _FaqRow extends StatefulWidget {
  const _FaqRow({
    required this.index,
    required this.item,
    required this.dark,
  });

  final int index;
  final FaqItem item;
  final bool dark;

  @override
  State<_FaqRow> createState() => _FaqRowState();
}

class _FaqRowState extends State<_FaqRow> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final ink = widget.dark ? Colors.white : AppColors.foreground;
    final muted = widget.dark ? const Color(0xFFB8B8B8) : AppColors.muted;
    final line = widget.dark ? const Color(0xFF555555) : AppColors.border;

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: line)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _open = !_open),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: Row(
                children: [
                  SizedBox(
                    width: 42,
                    child: Text(
                      '${widget.index + 1}'.padLeft(2, '0'),
                      style: AppTheme.sans.copyWith(
                        fontSize: 8,
                        letterSpacing: 1.5,
                        color: muted,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.item.question,
                      style: AppTheme.sans.copyWith(
                        fontSize: widget.dark ? 22 : 18,
                        height: 1.25,
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w500,
                        color: ink,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _open ? 0.125 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 26,
                        color: widget.dark ? AppColors.mustard : ink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 24, 34),
              child: Text(
                widget.item.answer,
                style: AppTheme.sans.copyWith(
                  fontSize: 14,
                  height: 1.8,
                  color: muted,
                ),
              ),
            ),
            crossFadeState:
                _open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }
}
