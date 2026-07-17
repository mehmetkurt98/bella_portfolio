import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaDesignSystemSection extends StatelessWidget {
  const ColaDesignSystemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 72 : 48,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'DESIGN SYSTEM',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: wide ? 28 : 20),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 780),
                child: Text(
                  ColaProjectData.designSystemIntro,
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(
                    fontSize: 14,
                    height: 1.7,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ),
            SizedBox(height: wide ? 48 : 32),
            Text(
              'GILROY CONDENSED',
              style: AppTheme.sans.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              ColaProjectData.gilroyBody,
              style: AppTheme.sans.copyWith(fontSize: 13, height: 1.6),
            ),
            const SizedBox(height: 20),
            _FontRow(
              assets: const [
                ColaProjectData.gilroyWeights,
                ColaProjectData.gilroyMark,
                ColaProjectData.gilroySpecimen,
              ],
            ),
            SizedBox(height: wide ? 48 : 32),
            Text(
              'OVERLOCK SC CONDENSED',
              style: GoogleFonts.overlockSc(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              ColaProjectData.overlockBody,
              style: AppTheme.sans.copyWith(fontSize: 13, height: 1.6),
            ),
            const SizedBox(height: 20),
            _FontRow(
              assets: const [
                ColaProjectData.overlockWeights,
                ColaProjectData.overlockMark,
                ColaProjectData.overlockSpecimen,
              ],
            ),
            SizedBox(height: wide ? 64 : 40),
            Text(
              'COLOR SYSTEM',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Text(
                  ColaProjectData.colorSystemIntro,
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(fontSize: 14, height: 1.65),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Image.asset(
                  ColaProjectData.colorPalette,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final swatch in ColaProjectData.colorSwatches)
                  _Swatch(swatch: swatch),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              ColaProjectData.colorSystemClosing,
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(fontSize: 13, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}

class _FontRow extends StatelessWidget {
  const _FontRow({required this.assets});

  final List<String> assets;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 800;

    if (!wide) {
      return Column(
        children: [
          for (final asset in assets) ...[
            Image.asset(asset, fit: BoxFit.contain, width: double.infinity),
            const SizedBox(height: 12),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < assets.length; i++) ...[
          Expanded(
            child: Image.asset(assets[i], fit: BoxFit.contain),
          ),
          if (i < assets.length - 1) const SizedBox(width: 16),
        ],
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({required this.swatch});

  final ColaColorSwatch swatch;

  @override
  Widget build(BuildContext context) {
    final isWhite = swatch.color == Colors.white;

    return Column(
      children: [
        Container(
          width: 88,
          height: 56,
          decoration: BoxDecoration(
            color: swatch.color,
            border: Border.all(
              color: isWhite ? AppColors.border : swatch.color,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            swatch.hex,
            style: AppTheme.sans.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isWhite || swatch.color == ColaProjectData.yellow
                  ? AppColors.foreground
                  : Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          swatch.name,
          style: AppTheme.sans.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
