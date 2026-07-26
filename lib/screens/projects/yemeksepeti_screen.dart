import 'package:flutter/material.dart';

import '../../data/yemeksepeti_project_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shared.dart';

class YemeksepetiScreen extends StatelessWidget {
  const YemeksepetiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YemeksepetiProjectData.softBg,
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
            const _BoardImagesSection(),
            const SizedBox(height: 48),
            const _ClosingStrip(),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}

class _BoardImagesSection extends StatelessWidget {
  const _BoardImagesSection();

  @override
  Widget build(BuildContext context) {
    final assets = YemeksepetiProjectData.boardAssets;

    return ColoredBox(
      color: YemeksepetiProjectData.softBg,
      child: PagePadding(
        vertical: 24,
        child: Column(
          children: [
            for (var i = 0; i < assets.length; i++) ...[
              if (i > 0) const SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  assets[i],
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ClosingStrip extends StatelessWidget {
  const _ClosingStrip();

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
        decoration: BoxDecoration(
          color: YemeksepetiProjectData.ink,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          YemeksepetiProjectData.closing,
          textAlign: TextAlign.center,
          style: AppTheme.sans.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
