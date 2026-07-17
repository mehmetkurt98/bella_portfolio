import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class LuxuryFooter extends StatelessWidget {
  const LuxuryFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return Column(
      children: [
        const Divider(height: 1, thickness: 1),
        PagePadding(
          vertical: 48,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final stacked = constraints.maxWidth < 800;

              if (stacked) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FooterColumn(
                      title: 'Navigation',
                      items: const ['Works', 'About', 'Contact'],
                    ),
                    const SizedBox(height: 32),
                    _FooterColumn(
                      title: 'Services',
                      items: const [
                        'Brand Identity',
                        'Product Design',
                        'Development',
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      '© $year Bella. All rights reserved.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _FooterColumn(
                      title: 'Navigation',
                      items: const ['Works', 'About', 'Contact'],
                    ),
                  ),
                  Expanded(
                    child: _FooterColumn(
                      title: 'Services',
                      items: const [
                        'Brand Identity',
                        'Product Design',
                        'Development',
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '© $year Bella. All rights reserved.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  const _FooterColumn({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTheme.sans.copyWith(
            fontSize: 11,
            letterSpacing: 2.4,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              item,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.muted,
                  ),
            ),
          ),
      ],
    );
  }
}
