import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class LuxuryHeader extends StatelessWidget {
  const LuxuryHeader({super.key, required this.onNavigate});

  final void Function(String section) onNavigate;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 900;
    final tight = width < 680;

    return Material(
      color: AppColors.background.withValues(alpha: 0.92),
      child: Container(
        height: tight ? 64 : 84,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.border.withValues(alpha: 0.75)),
          ),
        ),
        child: PagePadding(
          child: Row(
            children: [
              InkWell(
                onTap: () => onNavigate('top'),
                child: Row(
                  children: [
                    Image.asset(
                      HomeData.monogramAsset,
                      height: tight ? 44 : 56,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                    if (!compact) ...[
                      Text(
                        '${HomeData.fullName.toUpperCase()} · ${HomeData.role.toUpperCase()}',
                        style: AppTheme.sans.copyWith(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.6,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const Spacer(),
              if (!tight) ...[
                _NavLink(label: 'Work', onTap: () => onNavigate('work')),
                _NavLink(label: 'Branding', onTap: () => onNavigate('branding')),
                if (width > 1120)
                  _NavLink(
                    label: 'Products',
                    onTap: () => onNavigate('products'),
                  ),
                _NavLink(
                  label: 'UX Strategy',
                  onTap: () => onNavigate('strategy'),
                ),
                if (width > 1120)
                  _NavLink(
                    label: 'Creative Direction',
                    onTap: () => onNavigate('creative'),
                  ),
                _NavLink(label: 'About', onTap: () => onNavigate('about')),
                const SizedBox(width: 8),
              ],
              _CtaButton(
                label: "Let's talk",
                onPressed: () => onNavigate('contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            label,
            style: AppTheme.sans.copyWith(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}

class _CtaButton extends StatelessWidget {
  const _CtaButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.mustard,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTheme.sans.copyWith(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              const Text('↗', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
