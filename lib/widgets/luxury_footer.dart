import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class LuxuryFooter extends StatelessWidget {
  const LuxuryFooter({super.key, this.onBackToTop});

  final VoidCallback? onBackToTop;

  Future<void> _openLinkedIn() async {
    final uri = Uri.parse(HomeData.linkedInUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final titleSize = (width * 0.06).clamp(44.0, 92.0);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.mustardSoft, AppColors.mustard],
        ),
      ),
      child: PagePadding(
        vertical: width < 680 ? 76 : 100,
        child: Column(
          children: [
            Text(
              "LET'S CREATE SOMETHING PEOPLE REMEMBER",
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.6,
              ),
            ),
            SizedBox(height: width < 680 ? 38 : 48),
            Text(
              'Looking for a design leader\nwho sees the whole picture?',
              textAlign: TextAlign.center,
              style: AppTheme.serif.copyWith(
                fontSize: titleSize,
                fontWeight: FontWeight.w500,
                height: 0.95,
                letterSpacing: -2,
              ),
            ),
            const SizedBox(height: 36),
            Material(
              color: AppColors.foreground,
              borderRadius: BorderRadius.circular(999),
              child: InkWell(
                onTap: _openLinkedIn,
                borderRadius: BorderRadius.circular(999),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 17),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Connect on LinkedIn',
                        style: AppTheme.sans.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 25),
                      const Text(
                        '↗',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: width < 680 ? 62 : 90),
            Container(
              padding: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.foreground.withValues(alpha: 0.3),
                  ),
                ),
              ),
              child: width < 680
                  ? Column(
                      children: [
                        Text(
                          '© 2026 ${HomeData.fullName.toUpperCase()}',
                          style: AppTheme.sans.copyWith(
                            fontSize: 8,
                            letterSpacing: 1.3,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'HEAD OF DESIGN ACROSS PRODUCT STRATEGY · UX · BRAND SYSTEMS · CREATIVE DIRECTION',
                          textAlign: TextAlign.center,
                          style: AppTheme.sans.copyWith(
                            fontSize: 8,
                            letterSpacing: 1.3,
                          ),
                        ),
                        if (onBackToTop != null) ...[
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: onBackToTop,
                            child: const Text('↑ BACK TO TOP'),
                          ),
                        ],
                      ],
                    )
                  : Row(
                      children: [
                        Text(
                          '© 2026 ${HomeData.fullName.toUpperCase()}',
                          style: AppTheme.sans.copyWith(
                            fontSize: 8,
                            letterSpacing: 1.3,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'HEAD OF DESIGN ACROSS PRODUCT STRATEGY · UX · BRAND SYSTEMS · CREATIVE DIRECTION',
                          style: AppTheme.sans.copyWith(
                            fontSize: 8,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
