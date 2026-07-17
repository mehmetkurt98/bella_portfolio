import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraBlueprintSection extends StatelessWidget {
  const ZaraBlueprintSection({super.key});

  static const _borderColor = Color(0xFF6B8FBF);
  static const _headerBg = Color(0xFFF3F6FA);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFE8EEF5),
          ],
        ),
      ),
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'BLUEPRINT',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 28 : 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: wide ? 36 : 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final tableWidth = constraints.maxWidth < 1100
                    ? 1100.0
                    : constraints.maxWidth;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: tableWidth,
                    child: _BlueprintTable(
                      borderColor: _borderColor,
                      headerBg: _headerBg,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BlueprintTable extends StatelessWidget {
  const _BlueprintTable({
    required this.borderColor,
    required this.headerBg,
  });

  final Color borderColor;
  final Color headerBg;

  @override
  Widget build(BuildContext context) {
    final columns = ZaraProjectData.blueprintColumns;
    final rows = ZaraProjectData.blueprintRows;

    return Table(
      border: TableBorder.all(color: borderColor, width: 1),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: const FlexColumnWidth(1.1),
        for (var i = 1; i < columns.length; i++) i: const FlexColumnWidth(1.35),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: headerBg),
          children: [
            for (final header in columns)
              _Cell(
                text: header,
                bold: true,
                minHeight: 72,
              ),
          ],
        ),
        for (final row in rows)
          TableRow(
            children: [
              _Cell(
                text: row.label,
                bold: true,
                background: headerBg,
                minHeight: 88,
              ),
              for (final cell in row.cells)
                _Cell(
                  text: cell,
                  minHeight: 88,
                ),
            ],
          ),
      ],
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    required this.text,
    this.bold = false,
    this.background,
    this.minHeight = 72,
  });

  final String text;
  final bool bold;
  final Color? background;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      constraints: BoxConstraints(minHeight: minHeight),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTheme.sans.copyWith(
          fontSize: 11,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          height: 1.4,
          color: AppColors.foreground,
        ),
      ),
    );
  }
}
