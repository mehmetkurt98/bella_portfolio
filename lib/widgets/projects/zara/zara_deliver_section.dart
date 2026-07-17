import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraDeliverSection extends StatelessWidget {
  const ZaraDeliverSection({super.key});

  static const _phoneAspect = 278.3 / 571.66;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final wide = size.width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: wide ? 80 : 56),
          Text(
            'DELIVER',
            textAlign: TextAlign.center,
            style: AppTheme.sans.copyWith(
              fontSize: wide ? 28 : 22,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
              color: AppColors.foreground,
            ),
          ),
          SizedBox(height: wide ? 40 : 28),
          SizedBox(
            width: double.infinity,
            height: size.height,
            child: Image.asset(
              ZaraProjectData.deliverHeroImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: size.height,
              alignment: Alignment.center,
            ),
          ),
          PagePadding(
            vertical: wide ? 64 : 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PhonePair(
                  leftAsset: ZaraProjectData.deliverScreens[0],
                  rightAsset: ZaraProjectData.deliverScreens[1],
                  phoneAspect: _phoneAspect,
                ),
                const SizedBox(height: 24),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: Text(
                      '"Use our guide tool: complete a short survey, and we\'ll '
                      'provide personalized style options tailored just for you '
                      'with Style Me Zara."',
                      textAlign: TextAlign.center,
                      style: AppTheme.sans.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.65,
                        fontStyle: FontStyle.italic,
                        color: AppColors.muted,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: wide ? 64 : 40),
                Text(
                  'PURCHASE EXPERIENCE',
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(
                    fontSize: wide ? 18 : 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: AppColors.foreground,
                  ),
                ),
                SizedBox(height: wide ? 32 : 24),
                _PhonePair(
                  leftAsset: ZaraProjectData.deliverScreens[2],
                  rightAsset: ZaraProjectData.deliverScreens[3],
                  phoneAspect: _phoneAspect,
                  emphasizeRight: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PhonePair extends StatelessWidget {
  const _PhonePair({
    required this.leftAsset,
    required this.rightAsset,
    required this.phoneAspect,
    this.emphasizeRight = false,
  });

  final String leftAsset;
  final String rightAsset;
  final double phoneAspect;
  final bool emphasizeRight;

  static const _stagger = 120.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final stacked = width < 800;

    if (stacked) {
      return Column(
        children: [
          _FullScreenPhone(
            asset: leftAsset,
            aspectRatio: phoneAspect,
          ),
          const SizedBox(height: 20),
          _FullScreenPhone(
            asset: rightAsset,
            aspectRatio: phoneAspect,
            emphasize: emphasizeRight,
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: _stagger),
            child: _FullScreenPhone(
              asset: leftAsset,
              aspectRatio: phoneAspect,
            ),
          ),
        ),
        const SizedBox(width: 28),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: _stagger),
            child: _FullScreenPhone(
              asset: rightAsset,
              aspectRatio: phoneAspect,
              emphasize: emphasizeRight,
            ),
          ),
        ),
      ],
    );
  }
}

class _FullScreenPhone extends StatelessWidget {
  const _FullScreenPhone({
    required this.asset,
    required this.aspectRatio,
    this.emphasize = false,
  });

  final String asset;
  final double aspectRatio;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: emphasize ? 320 : 300,
          maxHeight: emphasize ? 660 : 620,
        ),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(emphasize ? 28 : 24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: emphasize ? 0.25 : 0.14),
                  blurRadius: emphasize ? 28 : 18,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              asset,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
