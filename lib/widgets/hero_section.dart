import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onViewWorks,
    required this.onContact,
  });

  final VoidCallback onViewWorks;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final heroHeight = height < 700 ? 620.0 : height * 0.88;

    return SizedBox(
      height: heroHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            SampleData.heroImage,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(color: const Color(0xFF1A1A1A)),
          ),
          Container(color: AppColors.overlay),
          Align(
            alignment: Alignment.bottomCenter,
            child: PagePadding(
              vertical: 56,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Curated by ${SampleData.ownerName}',
                    style: AppTheme.sans.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    SampleData.heroTitle.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: AppTheme.serif.copyWith(
                      color: Colors.white,
                      fontSize: MediaQuery.sizeOf(context).width > 800 ? 64 : 42,
                      fontWeight: FontWeight.w500,
                      height: 1.05,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    SampleData.heroSubtitle,
                    textAlign: TextAlign.center,
                    style: AppTheme.sans.copyWith(
                      color: Colors.white.withValues(alpha: 0.82),
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 28,
                    runSpacing: 12,
                    children: [
                      LuxuryTextButton(
                        label: 'View Works',
                        light: true,
                        onPressed: onViewWorks,
                      ),
                      LuxuryTextButton(
                        label: 'Contact Me',
                        light: true,
                        onPressed: onContact,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
