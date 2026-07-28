import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onViewWorks,
    required this.onAbout,
  });

  final VoidCallback onViewWorks;
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        child: wide
            ? SizedBox(
                height: (width * 0.55).clamp(650.0, 760.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _HeroCopy(
                          onViewWorks: onViewWorks,
                          onAbout: onAbout,
                        ),
                      ),
                    ),
                    Expanded(child: _HeroPortrait(wide: true)),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 54),
                  _HeroCopy(onViewWorks: onViewWorks, onAbout: onAbout),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: width < 390 ? 465 : 520,
                    child: _HeroPortrait(wide: false),
                  ),
                ],
              ),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.onViewWorks,
    required this.onAbout,
  });

  final VoidCallback onViewWorks;
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final headlineSize = width > 900
        ? (width * 0.047).clamp(48.0, 72.0)
        : (width * 0.134).clamp(44.0, 62.0);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 760),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                HomeData.hello,
                style: AppTheme.sans.copyWith(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.8,
                ),
              ),
              const SizedBox(width: 9),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.mustard,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text.rich(
            TextSpan(
              style: AppTheme.serif.copyWith(
                fontSize: headlineSize,
                fontWeight: FontWeight.w500,
                height: 0.92,
                letterSpacing: -1.2,
              ),
              children: [
                TextSpan(text: '${HomeData.heroHeadlineLead}\n'),
                TextSpan(
                  text: '${HomeData.heroHeadlineLine2}\n',
                  style: TextStyle(
                    height: 0.92,
                    letterSpacing: -1.2,
                    fontSize: headlineSize,
                  ),
                ),
                TextSpan(
                  text: '${HomeData.heroHeadlineLine3}\n',
                  style: TextStyle(
                    height: 0.92,
                    letterSpacing: -1.2,
                    fontSize: headlineSize,
                  ),
                ),
                TextSpan(
                  text: HomeData.heroHeadlineAccent,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.mustard,
                    decorationThickness: 4,
                    height: 0.92,
                    letterSpacing: -1.2,
                    fontSize: headlineSize,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 27),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Text(
              HomeData.heroIntro,
              style: AppTheme.sans.copyWith(
                fontSize: 15,
                height: 1.7,
                color: AppColors.muted,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            constraints: const BoxConstraints(maxWidth: 555),
            padding: const EdgeInsets.only(left: 16),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: AppColors.mustard, width: 2),
              ),
            ),
            child: Text(
              HomeData.heroDirection,
              style: AppTheme.sans.copyWith(
                fontSize: 11,
                height: 1.65,
                color: AppColors.foreground,
              ),
            ),
          ),
          const SizedBox(height: 27),
          Wrap(
            spacing: 25,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _PrimaryButton(label: 'View my work', onPressed: onViewWorks),
              TextButton(
                onPressed: onAbout,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'About me',
                      style: AppTheme.sans.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text('↓', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroPortrait extends StatelessWidget {
  const _HeroPortrait({required this.wide});

  final bool wide;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          left: wide ? null : null,
          right: 0,
          top: 0,
          bottom: 0,
          width: MediaQuery.sizeOf(context).width * (wide ? 0.27 : 0.32),
          child: const ColoredBox(color: AppColors.mustard),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              HomeData.heroPortraitAsset,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.foreground,
      child: InkWell(
        onTap: onPressed,
        hoverColor: AppColors.mustard,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTheme.sans.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              const Text(
                '↗',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
