import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_theme.dart';

const _textColor = Color(0xFF1E1E1E);

class ZaraHeroSection extends StatelessWidget {
  const ZaraHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    if (!wide) {
      return const _MobileHero();
    }

    final horizontal = width > 1200 ? 48.0 : 32.0;

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(horizontal, 24, horizontal * 0.4, 48),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, right: 24),
                child: const _HeroCopy(),
              ),
            ),
            Expanded(
              flex: 6,
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  ZaraProjectData.heroImage,
                  height: width > 1200 ? 620 : 520,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final scale = (width / 1305).clamp(0.7, 1.0);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 673),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ZaraProjectData.title,
            style: AppTheme.sans.copyWith(
              fontSize: 48 * scale,
              fontWeight: FontWeight.w500,
              height: 1.4,
              color: _textColor,
            ),
          ),
          SizedBox(height: 4 * scale),
          Text(
            ZaraProjectData.subtitle,
            style: AppTheme.sans.copyWith(
              fontSize: 26 * scale,
              fontWeight: FontWeight.w500,
              height: 1.4,
              color: _textColor,
            ),
          ),
          SizedBox(height: 16 * scale),
          Text(
            ZaraProjectData.description,
            style: AppTheme.sans.copyWith(
              fontSize: 15 * scale,
              fontWeight: FontWeight.w500,
              height: 1.4,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileHero extends StatelessWidget {
  const _MobileHero();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              ZaraProjectData.heroImage,
              height: 320,
              fit: BoxFit.contain,
              alignment: Alignment.centerRight,
            ),
            const SizedBox(height: 32),
            Text(
              ZaraProjectData.title,
              style: AppTheme.sans.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              ZaraProjectData.subtitle,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              ZaraProjectData.description,
              style: AppTheme.sans.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
