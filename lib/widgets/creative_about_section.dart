import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';
import 'strategy_section.dart';

class CreativeSection extends StatelessWidget {
  const CreativeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final titleSize = (width * 0.044).clamp(40.0, 66.0);
    final columns = width > 900 ? 3 : 1;

    return ColoredBox(
      color: AppColors.mustard,
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
                          'I connect art direction, digital storytelling, campaigns, '
                          'product expression, and social media into one coherent '
                          'creative system.',
                          style: AppTheme.sans.copyWith(
                            fontSize: 13,
                            height: 1.72,
                            color: AppColors.foreground,
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
                        'I connect art direction, digital storytelling, campaigns, '
                        'product expression, and social media into one coherent '
                        'creative system.',
                        style: AppTheme.sans.copyWith(
                          fontSize: 13,
                          height: 1.72,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 48),
            Builder(
              builder: (context) {
                final items = HomeData.creativeItems;
                final cardTitleSize = (width * 0.03).clamp(32.0, 48.0);
                if (columns == 1) {
                  return Column(
                    children: [
                      for (var i = 0; i < items.length; i++) ...[
                        if (i > 0) const SizedBox(height: 14),
                        _CreativeCard(
                          item: items[i],
                          titleSize: cardTitleSize,
                        ),
                      ],
                    ],
                  );
                }

                // Equal-height without max-height clamping: each card keeps its
                // natural content height; we stretch only the paint via a
                // shared min height that can always grow (never shrink content).
                return _EqualHeightCreativeCards(
                  items: items,
                  titleSize: cardTitleSize,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _EqualHeightCreativeCards extends StatefulWidget {
  const _EqualHeightCreativeCards({
    required this.items,
    required this.titleSize,
  });

  final List<CreativeItem> items;
  final double titleSize;

  @override
  State<_EqualHeightCreativeCards> createState() =>
      _EqualHeightCreativeCardsState();
}

class _EqualHeightCreativeCardsState extends State<_EqualHeightCreativeCards> {
  static const _gap = 22.0;

  final List<double> _heights = [];
  double? _width;

  double get _maxHeight {
    if (_heights.length != widget.items.length) return 0;
    return _heights.fold<double>(0, (m, h) => h > m ? h : m);
  }

  void _reportHeight(int index, double height, double width) {
    if (!mounted) return;
    if (_width != width) {
      _width = width;
      _heights
        ..clear()
        ..addAll(List<double>.filled(widget.items.length, 0));
    }
    if (_heights.length != widget.items.length) {
      _heights
        ..clear()
        ..addAll(List<double>.filled(widget.items.length, 0));
    }
    if ((_heights[index] - height).abs() < 0.5) return;
    setState(() => _heights[index] = height);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final cardWidth =
            (width - _gap * (widget.items.length - 1)) / widget.items.length;
        final targetHeight = _width == width ? _maxHeight : 0.0;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < widget.items.length; i++) ...[
              if (i > 0) const SizedBox(width: _gap),
              SizedBox(
                width: cardWidth,
                child: _HeightReporter(
                  onHeight: (h) => _reportHeight(i, h, width),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: targetHeight > 0 ? targetHeight : 0,
                    ),
                    child: _CreativeCard(
                      item: widget.items[i],
                      titleSize: widget.titleSize,
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

/// Reports the child's natural layout height after each frame.
class _HeightReporter extends SingleChildRenderObjectWidget {
  const _HeightReporter({
    required this.onHeight,
    required super.child,
  });

  final ValueChanged<double> onHeight;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderHeightReporter(onHeight);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderHeightReporter renderObject,
  ) {
    renderObject.onHeight = onHeight;
  }
}

class _RenderHeightReporter extends RenderProxyBox {
  _RenderHeightReporter(this.onHeight);

  ValueChanged<double> onHeight;

  @override
  void performLayout() {
    // Layout child with loose height so content is never clamped.
    final childConstraints = BoxConstraints(
      minWidth: constraints.minWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0,
      maxHeight: double.infinity,
    );
    child!.layout(childConstraints, parentUsesSize: true);
    final childSize = child!.size;
    // Honor minHeight from parent for equal card backgrounds.
    size = constraints.constrain(childSize);
    if (childSize.height != size.height) {
      // Parent asked for a taller card — child stays top-sized; we already
      // have size. Paint offset handled by default (0,0).
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onHeight(childSize.height);
    });
  }
}

class _CreativeCard extends StatelessWidget {
  const _CreativeCard({
    required this.item,
    required this.titleSize,
  });

  final CreativeItem item;
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(34),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.foreground.withValues(alpha: 0.1),
            blurRadius: 55,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.number,
            style: AppTheme.sans.copyWith(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: AppColors.foreground.withValues(alpha: 0.72),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            item.title,
            style: AppTheme.serif.copyWith(
              fontSize: titleSize.clamp(32.0, 48.0),
              fontWeight: FontWeight.w500,
              height: 1.05,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.subtitle,
            style: AppTheme.sans.copyWith(
              fontSize: 12,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            item.body,
            style: AppTheme.sans.copyWith(
              fontSize: 12,
              height: 1.72,
              color: AppColors.foreground.withValues(alpha: 0.82),
            ),
          ),
        ],
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
          'CREATIVE DIRECTION',
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
            children: [
              const TextSpan(text: 'One clear idea.\n'),
              TextSpan(
                text: 'Every touchpoint aligned.',
                style: TextStyle(
                  color: AppColors.foreground.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AboutExperienceSection extends StatelessWidget {
  const AboutExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;
    final titleSize = (width * 0.044).clamp(40.0, 66.0);

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: width < 680 ? 78 : 118,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 104,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ABOUT & EXPERIENCE',
                              style: AppTheme.sans.copyWith(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.8,
                              ),
                            ),
                            const SizedBox(height: 22),
                            Text.rich(
                              TextSpan(
                                style: AppTheme.serif.copyWith(
                                  fontSize: titleSize,
                                  fontWeight: FontWeight.w500,
                                  height: 1.02,
                                  letterSpacing: -1.2,
                                ),
                                children: const [
                                  TextSpan(
                                    text:
                                        'I set the vision, stay close to the craft, and help teams make ',
                                  ),
                                  TextSpan(
                                    text: 'their best work.',
                                    style: TextStyle(color: AppColors.mustard),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 62,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 34),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My best work happens between strategic clarity and exceptional execution.',
                                style: AppTheme.sans.copyWith(
                                  fontSize: 21,
                                  height: 1.45,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                "I've shaped global platforms for UN Women, built scalable design systems, "
                                'and taken founder-led products from a blank page to launch. I lead with '
                                'curiosity, clear standards, and respect for both users and the people making the work.',
                                style: AppTheme.sans.copyWith(
                                  fontSize: 14,
                                  height: 1.8,
                                  color: AppColors.muted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ABOUT & EXPERIENCE',
                        style: AppTheme.sans.copyWith(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.8,
                        ),
                      ),
                      const SizedBox(height: 22),
                      Text.rich(
                        TextSpan(
                          style: AppTheme.serif.copyWith(
                            fontSize: titleSize,
                            fontWeight: FontWeight.w500,
                            height: 1.02,
                          ),
                          children: const [
                            TextSpan(
                              text:
                                  'I set the vision, stay close to the craft, and help teams make ',
                            ),
                            TextSpan(
                              text: 'their best work.',
                              style: TextStyle(color: AppColors.mustard),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'My best work happens between strategic clarity and exceptional execution.',
                        style: AppTheme.sans.copyWith(
                          fontSize: 21,
                          height: 1.45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "I've shaped global platforms for UN Women, built scalable design systems, "
                        'and taken founder-led products from a blank page to launch.',
                        style: AppTheme.sans.copyWith(
                          fontSize: 14,
                          height: 1.8,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 36),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.foreground)),
              ),
              child: Column(
                children: [
                  for (final item in HomeData.experience) _TimelineRow(item: item),
                ],
              ),
            ),
            const SizedBox(height: 36),
            _Facts(),
            const SizedBox(height: 72),
            _Toolkit(),
            const SizedBox(height: 86),
            wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 62,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'A FEW USEFUL ANSWERS',
                              style: AppTheme.sans.copyWith(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.8,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              "What it's like\nto work with me.",
                              style: AppTheme.serif.copyWith(
                                fontSize: (width * 0.03).clamp(31.0, 46.0),
                                fontWeight: FontWeight.w500,
                                height: 1.02,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 138,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppColors.foreground),
                            ),
                          ),
                          child: FaqAccordion(items: HomeData.aboutQuestions),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A FEW USEFUL ANSWERS',
                        style: AppTheme.sans.copyWith(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.8,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "What it's like\nto work with me.",
                        style: AppTheme.serif.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.foreground),
                          ),
                        ),
                        child: FaqAccordion(items: HomeData.aboutQuestions),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.item});

  final ExperienceItem item;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;
    final mid = MediaQuery.sizeOf(context).width > 680;

    final years = Text(
      item.years,
      style: AppTheme.sans.copyWith(
        fontSize: 9,
        letterSpacing: 1.4,
        color: AppColors.muted,
      ),
    );
    final role = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.role,
          style: AppTheme.sans.copyWith(
            fontSize: 21,
            height: 1.2,
            letterSpacing: -0.4,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.company,
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
    final copy = Text(
      item.copy,
      style: AppTheme.sans.copyWith(
        fontSize: 13,
        height: 1.7,
        color: AppColors.muted,
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 34),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: wide || mid
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: wide ? 170 : 130, child: years),
                Expanded(child: role),
                const SizedBox(width: 28),
                Expanded(child: copy),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                years,
                const SizedBox(height: 10),
                role,
                const SizedBox(height: 10),
                copy,
              ],
            ),
    );
  }
}

class _Facts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 680;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        color: AppColors.border,
      ),
      child: wide
          ? IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < HomeData.aboutFacts.length; i++) ...[
                    if (i > 0) Container(width: 1, color: AppColors.border),
                    Expanded(child: _FactCard(item: HomeData.aboutFacts[i])),
                  ],
                ],
              ),
            )
          : Column(
              children: [
                for (var i = 0; i < HomeData.aboutFacts.length; i++) ...[
                  if (i > 0) Container(height: 1, color: AppColors.border),
                  _FactCard(item: HomeData.aboutFacts[i]),
                ],
              ],
            ),
    );
  }
}

class _FactCard extends StatelessWidget {
  const _FactCard({required this.item});

  final AboutFact item;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 175),
      color: Colors.white,
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.label,
            style: AppTheme.sans.copyWith(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 38),
          Text(
            item.title,
            style: AppTheme.sans.copyWith(
              fontSize: 17,
              height: 1.4,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.detail,
            style: AppTheme.sans.copyWith(
              fontSize: 10,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}

class _Toolkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;
    final titleSize =
        (MediaQuery.sizeOf(context).width * 0.03).clamp(31.0, 46.0);

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TOOLS & AI WORKFLOW',
          style: AppTheme.sans.copyWith(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'The tools support the thinking.\nThey never replace it.',
          style: AppTheme.serif.copyWith(
            fontSize: titleSize,
            fontWeight: FontWeight.w500,
            height: 1.02,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I use the right tool for the question—from collaborative discovery '
          'and system design to rapid prototyping, creative exploration, and production.',
          style: AppTheme.sans.copyWith(
            fontSize: 13,
            height: 1.75,
            color: AppColors.muted,
          ),
        ),
      ],
    );

    final tools = Wrap(
      spacing: 9,
      runSpacing: 9,
      children: [
        for (final tool in HomeData.tools)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(999),
              color: Colors.white,
            ),
            child: Text(
              tool,
              style: AppTheme.sans.copyWith(fontSize: 10),
            ),
          ),
      ],
    );

    return Container(
      padding: EdgeInsets.all(wide ? 52 : 28),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mustard, width: 2),
        color: Colors.white,
      ),
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 8, child: left),
                const SizedBox(width: 48),
                Expanded(flex: 12, child: tools),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                left,
                const SizedBox(height: 30),
                tools,
              ],
            ),
    );
  }
}

class LeadershipSummarySection extends StatelessWidget {
  const LeadershipSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final titleSize = (width * 0.047).clamp(42.0, 70.0);
    final wide = width > 680;

    return ColoredBox(
      color: AppColors.foreground,
      child: PagePadding(
        vertical: width < 680 ? 70 : 92,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DESIGN LEADERSHIP, END TO END',
              style: AppTheme.sans.copyWith(
                fontSize: 8,
                letterSpacing: 1.6,
                color: AppColors.mustard,
              ),
            ),
            const SizedBox(height: 25),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Text(
                'I lead the vision—and connect every discipline needed to deliver it.',
                style: AppTheme.serif.copyWith(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w500,
                  height: 0.98,
                  letterSpacing: -1.5,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 62),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFF555555))),
              ),
              child: wide
                  ? IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (var i = 0;
                              i < HomeData.leadershipItems.length;
                              i++) ...[
                            if (i > 0)
                              Container(width: 1, color: const Color(0xFF555555)),
                            Expanded(
                              child: _LeadItem(item: HomeData.leadershipItems[i]),
                            ),
                          ],
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        for (var i = 0;
                            i < HomeData.leadershipItems.length;
                            i++) ...[
                          if (i > 0)
                            Container(height: 1, color: const Color(0xFF555555)),
                          _LeadItem(item: HomeData.leadershipItems[i]),
                        ],
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeadItem extends StatelessWidget {
  const _LeadItem({required this.item});

  final LeadershipItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.label,
            style: AppTheme.sans.copyWith(
              fontSize: 8,
              letterSpacing: 1.4,
              color: AppColors.mustard,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            item.body,
            style: AppTheme.sans.copyWith(
              fontSize: 15,
              height: 1.45,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
