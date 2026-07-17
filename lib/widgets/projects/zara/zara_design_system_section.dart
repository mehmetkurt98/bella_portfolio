import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraDesignSystemSection extends StatelessWidget {
  const ZaraDesignSystemSection({super.key});

  static const _sampleColor = Color(0xFF2C3E50);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF7F7F7),
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'DESIGN SYSTEM',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 28 : 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 28),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  ZaraProjectData.designSystemIntro,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.7,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ),
            SizedBox(height: wide ? 48 : 32),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth > 1000
                    ? 6
                    : constraints.maxWidth > 700
                        ? 3
                        : 2;
                final spacing = 16.0;
                final itemWidth =
                    (constraints.maxWidth - spacing * (columns - 1)) / columns;

                return Wrap(
                  spacing: spacing,
                  runSpacing: 28,
                  children: [
                    for (final spec in ZaraProjectData.typographySpecs)
                      SizedBox(
                        width: itemWidth,
                        child: _TypeSpecBlock(spec: spec),
                      ),
                  ],
                );
              },
            ),
            SizedBox(height: wide ? 56 : 40),
            Text(
              'INTER CONDENSED',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                final count = ZaraProjectData.interSamples.length;
                final spacing = 12.0;
                final itemWidth =
                    (constraints.maxWidth - spacing * (count - 1)) / count;
                final size = itemWidth.clamp(56.0, 92.0);

                return Wrap(
                  spacing: spacing,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final sample in ZaraProjectData.interSamples)
                      SizedBox(
                        width: size,
                        child: _InterSample(sample: sample, size: size),
                      ),
                  ],
                );
              },
            ),
            SizedBox(height: wide ? 64 : 40),
            Text(
              'COLOR SYSTEM',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 28 : 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  ZaraProjectData.colorSystemIntro,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.7,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ),
            SizedBox(height: wide ? 40 : 28),
            Text(
              'PRIMARY COLORS',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 20),
            const _ColorSwatchRow(colors: ZaraProjectData.primaryColors),
            SizedBox(height: wide ? 40 : 28),
            Text(
              'SECONDERY COLORS',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 20),
            const _ColorSwatchRow(colors: ZaraProjectData.secondaryColors),
          ],
        ),
      ),
    );
  }
}

class _ColorSwatchRow extends StatelessWidget {
  const _ColorSwatchRow({required this.colors});

  final List<ZaraColorSwatch> colors;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 16.0;
        final itemWidth =
            ((constraints.maxWidth - spacing * (colors.length - 1)) /
                    colors.length)
                .clamp(70.0, 140.0);

        return Wrap(
          spacing: spacing,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            for (final swatch in colors)
              SizedBox(
                width: itemWidth,
                child: _ColorSwatch(swatch: swatch, size: itemWidth),
              ),
          ],
        );
      },
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.swatch,
    required this.size,
  });

  final ZaraColorSwatch swatch;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: swatch.displayColor ?? swatch.color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE0E0E0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          decoration: BoxDecoration(
            color: swatch.labelColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '${swatch.name}\n${swatch.hexLabel}',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              height: 1.35,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _TypeSpecBlock extends StatelessWidget {
  const _TypeSpecBlock({required this.spec});

  final ZaraTypeSpec spec;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          spec.label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Family: Inter',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.muted,
          ),
        ),
        Text(
          'Weight: ${spec.weightLabel}',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.muted,
          ),
        ),
        Text(
          'Size: ${spec.size.toInt()}px',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Aa',
          style: GoogleFonts.inter(
            fontSize: spec.size,
            fontWeight: spec.weight,
            color: AppColors.foreground,
          ),
        ),
      ],
    );
  }
}

class _InterSample extends StatelessWidget {
  const _InterSample({
    required this.sample,
    required this.size,
  });

  final ZaraInterSample sample;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ZaraDesignSystemSection._sampleColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Aa',
            style: GoogleFonts.inter(
              fontSize: size * 0.34,
              fontWeight: sample.weight,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          sample.label,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
      ],
    );
  }
}
