import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.subtitle,
    this.centered = true,
  });

  final String title;
  final String? subtitle;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final alignment = centered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          textAlign: alignment,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              subtitle!,
              textAlign: alignment,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ],
    );
  }
}

class LuxuryTextButton extends StatelessWidget {
  const LuxuryTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.light = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final color = light ? Colors.white : AppColors.foreground;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTheme.sans.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 2.4,
          color: color,
          decoration: TextDecoration.underline,
          decorationColor: color,
        ),
      ),
    );
  }
}

class PagePadding extends StatelessWidget {
  const PagePadding({
    super.key,
    required this.child,
    this.vertical = 0,
  });

  final Widget child;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width > 1200
        ? 72.0
        : width > 800
            ? 48.0
            : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: child,
    );
  }
}

/// Lays out items in rows where every card in a row shares the same height.
class EqualHeightGrid extends StatelessWidget {
  const EqualHeightGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.columns,
    this.spacing = 20,
    this.runSpacing = 20,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final int columns;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    final safeColumns = columns.clamp(1, 12);
    final rows = <Widget>[];

    for (var i = 0; i < itemCount; i += safeColumns) {
      final count = (itemCount - i).clamp(0, safeColumns);
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = 0; j < safeColumns; j++) ...[
                if (j > 0) SizedBox(width: spacing),
                Expanded(
                  child: j < count
                      ? itemBuilder(context, i + j)
                      : const SizedBox.shrink(),
                ),
              ],
            ],
          ),
        ),
      );
      if (i + safeColumns < itemCount) {
        rows.add(SizedBox(height: runSpacing));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }
}
