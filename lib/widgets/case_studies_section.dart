import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../screens/projects/cola_screen.dart';
import '../screens/projects/feedback_screen.dart';
import '../screens/projects/fitlab_screen.dart';
import '../screens/projects/login_screen.dart';
import '../screens/projects/purchase_screen.dart';
import '../screens/projects/yemeksepeti_screen.dart';
import '../screens/projects/zara_screen.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class CaseStudiesSection extends StatelessWidget {
  const CaseStudiesSection({super.key, this.onViewAll});

  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;
    final titleSize = (width * 0.044).clamp(40.0, 66.0);

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: width < 680 ? 78 : 118,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 12,
                        child: _Heading(titleSize: titleSize),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Product concepts and focused case studies across '
                          'interaction, commerce, wearables, conversion, and '
                          'scalable interface systems.',
                          style: AppTheme.sans.copyWith(
                            fontSize: 13,
                            height: 1.72,
                            color: AppColors.muted,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Heading(titleSize: titleSize),
                      const SizedBox(height: 24),
                      Text(
                        'Product concepts and focused case studies across '
                        'interaction, commerce, wearables, conversion, and '
                        'scalable interface systems.',
                        style: AppTheme.sans.copyWith(
                          fontSize: 13,
                          height: 1.72,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: width < 680 ? 42 : 68),
            const _CaseGrid(),
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({required this.titleSize});

  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SELECTED PRODUCT WORK',
          style: AppTheme.sans.copyWith(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 18),
        Text.rich(
          TextSpan(
            style: AppTheme.serif.copyWith(
              fontSize: titleSize,
              fontWeight: FontWeight.w500,
              height: 1.02,
              letterSpacing: -1.2,
            ),
            children: const [
              TextSpan(text: 'Ideas explored.\n'),
              TextSpan(
                text: 'Experiences resolved.',
                style: TextStyle(color: AppColors.mutedSoft),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CaseGrid extends StatelessWidget {
  const _CaseGrid();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final twoCol = width > 680;
    final items = HomeData.caseStudies;

    if (!twoCol) {
      return Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(height: 54),
            _CaseCard(item: items[i], stacked: true),
          ],
        ],
      );
    }

    final children = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      if (item.wide) {
        children.add(_CaseCard(item: item, stacked: false));
        children.add(const SizedBox(height: 72));
      } else if (i + 1 < items.length && !items[i + 1].wide) {
        children.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _CaseCard(item: item, stacked: true)),
              const SizedBox(width: 22),
              Expanded(child: _CaseCard(item: items[i + 1], stacked: true)),
            ],
          ),
        );
        children.add(const SizedBox(height: 72));
        i++;
      } else {
        children.add(_CaseCard(item: item, stacked: true));
        children.add(const SizedBox(height: 72));
      }
    }

    return Column(children: children);
  }
}

class _CaseCard extends StatelessWidget {
  const _CaseCard({required this.item, required this.stacked});

  final HomeCaseStudy item;
  final bool stacked;

  void _open(BuildContext context) {
    final Widget? screen = switch (item.projectId) {
      'zara' => const ZaraScreen(),
      'cola' => const ColaScreen(),
      'fitlab' => const FitlabScreen(),
      'yemeksepeti' => const YemeksepetiScreen(),
      'purchase' => const PurchaseScreen(),
      'login' => const LoginScreen(),
      'feedback' => const FeedbackScreen(),
      _ => null,
    };
    if (screen == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleSize =
        (MediaQuery.sizeOf(context).width * 0.03).clamp(34.0, 50.0);
    final clickable = item.projectId != null;

    final image = Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        color: Colors.white,
      ),
      child: AspectRatio(
        aspectRatio: item.wide && !stacked ? 1.75 : 1.42,
        child: Image.asset(
          item.image,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );

    final meta = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.type,
          style: AppTheme.sans.copyWith(
            fontSize: 8,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          item.title,
          style: AppTheme.serif.copyWith(
            fontSize: titleSize,
            fontWeight: FontWeight.w500,
            height: 1.05,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          item.copy,
          style: AppTheme.sans.copyWith(
            fontSize: 12,
            height: 1.65,
            color: AppColors.muted,
          ),
        ),
      ],
    );

    final content = item.wide && !stacked
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(flex: 145, child: image),
              const SizedBox(width: 28),
              Expanded(flex: 55, child: meta),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              image,
              const SizedBox(height: 22),
              meta,
            ],
          );

    if (!clickable) return content;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _open(context),
        child: content,
      ),
    );
  }
}
