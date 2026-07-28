import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/sample_data.dart';
import '../models/portfolio_item.dart';
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

class FeaturedWorks extends StatelessWidget {
  const FeaturedWorks({super.key});

  @override
  Widget build(BuildContext context) {
    final items = SampleData.featuredWorks;
    const featuredIds = {'yemeksepeti', 'fitlab', 'cola', 'zara'};
    final featured = items
        .where((item) => featuredIds.contains(item.projectId))
        .toList(growable: false);
    final more = items
        .where((item) => !featuredIds.contains(item.projectId))
        .toList(growable: false);

    return Column(
      children: [
        PagePadding(
          vertical: 88,
          child: Column(
            children: [
              Text(
                'SELECTED WORKS',
                textAlign: TextAlign.center,
                style: AppTheme.sans.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Featured Projects',
                textAlign: TextAlign.center,
                style: AppTheme.serif.copyWith(
                  fontSize: MediaQuery.sizeOf(context).width > 800 ? 48 : 36,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
        for (final item in featured)
          _EditorialShowcase(
            item: item,
            imageAlignment: item.projectId == 'cola'
                ? Alignment.center
                : const Alignment(0, -0.05),
          ),
        if (more.isNotEmpty) ...[
          PagePadding(
            vertical: 72,
            child: Column(
              children: [
                Text(
                  'MORE WORK',
                  style: AppTheme.sans.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3.2,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 40),
                _MoreWorksGrid(items: more),
              ],
            ),
          ),
        ],
        const SizedBox(height: 48),
      ],
    );
  }
}

class _EditorialShowcase extends StatefulWidget {
  const _EditorialShowcase({
    required this.item,
    this.imageAlignment = Alignment.center,
  });

  final PortfolioItem item;
  final Alignment imageAlignment;

  @override
  State<_EditorialShowcase> createState() => _EditorialShowcaseState();
}

class _EditorialShowcaseState extends State<_EditorialShowcase> {
  bool _hovered = false;

  PortfolioItem get item => widget.item;

  void _openProject() {
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

    if (screen != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => screen),
      );
      return;
    }

    final url = item.projectUrl;
    if (url == null) return;
    _openExternalUrl(url);
  }

  Future<void> _openExternalUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final panelHeight = width < 700
        ? 520.0
        : (height * 0.82).clamp(560.0, 820.0);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _openProject,
        child: SizedBox(
          width: double.infinity,
          height: panelHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(
                color: const Color(0xFF1A1A1A),
              ),
              AnimatedScale(
                scale: _hovered ? 1.04 : 1,
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                child: _ShowcaseImage(
                  item: item,
                  alignment: widget.imageAlignment,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: _hovered ? 0.18 : 0.08),
                      Colors.black.withValues(alpha: _hovered ? 0.62 : 0.52),
                    ],
                    stops: const [0.35, 1],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedSlide(
                  offset: _hovered ? Offset.zero : const Offset(0, 0.04),
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeOutCubic,
                  child: PagePadding(
                    vertical: width < 700 ? 36 : 56,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 560),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.category.toUpperCase()}  ·  ${item.year}',
                            style: AppTheme.sans.copyWith(
                              color: Colors.white.withValues(alpha: 0.72),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2.8,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            item.title,
                            style: AppTheme.serif.copyWith(
                              color: Colors.white,
                              fontSize: width > 800 ? 56 : 36,
                              fontWeight: FontWeight.w500,
                              height: 1.05,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            item.description,
                            style: AppTheme.sans.copyWith(
                              color: Colors.white.withValues(alpha: 0.82),
                              fontSize: 14,
                              height: 1.65,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 28),
                          LuxuryTextButton(
                            label: 'Explore Project',
                            light: true,
                            onPressed: _openProject,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShowcaseImage extends StatelessWidget {
  const _ShowcaseImage({
    required this.item,
    required this.alignment,
  });

  final PortfolioItem item;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (item.imageAsset != null) {
      return Image.asset(
        item.imageAsset!,
        fit: BoxFit.cover,
        alignment: alignment,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) =>
            Container(color: const Color(0xFF1A1A1A)),
      );
    }

    if (item.imageUrl != null) {
      return Image.network(
        item.imageUrl!,
        fit: BoxFit.cover,
        alignment: alignment,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) =>
            Container(color: const Color(0xFF1A1A1A)),
      );
    }

    return Container(color: const Color(0xFF1A1A1A));
  }
}

class _MoreWorksGrid extends StatelessWidget {
  const _MoreWorksGrid({required this.items});

  final List<PortfolioItem> items;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width > 1100 ? 3 : width > 700 ? 2 : 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        final gap = 28.0;
        final itemWidth =
            (constraints.maxWidth - gap * (columns - 1)) / columns;

        return Wrap(
          spacing: gap,
          runSpacing: 48,
          children: [
            for (final item in items)
              SizedBox(
                width: itemWidth,
                child: _QuietWorkTile(item: item),
              ),
          ],
        );
      },
    );
  }
}

class _QuietWorkTile extends StatefulWidget {
  const _QuietWorkTile({required this.item});

  final PortfolioItem item;

  @override
  State<_QuietWorkTile> createState() => _QuietWorkTileState();
}

class _QuietWorkTileState extends State<_QuietWorkTile> {
  bool _hovered = false;

  PortfolioItem get item => widget.item;

  bool get _canOpen => item.projectId != null || item.projectUrl != null;

  Future<void> _open() async {
    final Widget? screen = switch (item.projectId) {
      'purchase' => const PurchaseScreen(),
      'login' => const LoginScreen(),
      'feedback' => const FeedbackScreen(),
      'zara' => const ZaraScreen(),
      'cola' => const ColaScreen(),
      'fitlab' => const FitlabScreen(),
      'yemeksepeti' => const YemeksepetiScreen(),
      _ => null,
    };

    if (screen != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => screen),
      );
      return;
    }

    final url = item.projectUrl;
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: _canOpen
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _canOpen ? _open : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 5,
              child: ClipRect(
                child: AnimatedScale(
                  scale: _hovered ? 1.03 : 1,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutCubic,
                  child: _tileImage(),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              item.category.toUpperCase(),
              style: AppTheme.sans.copyWith(
                fontSize: 10,
                letterSpacing: 2.4,
                fontWeight: FontWeight.w500,
                color: AppColors.muted,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: AppTheme.serif.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              item.year,
              style: AppTheme.sans.copyWith(
                fontSize: 11,
                letterSpacing: 2,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tileImage() {
    if (item.imageAsset != null) {
      return Image.asset(
        item.imageAsset!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) =>
            Container(color: const Color(0xFFECECEC)),
      );
    }

    if (item.imageUrl != null) {
      return Image.network(
        item.imageUrl!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) =>
            Container(color: const Color(0xFFECECEC)),
      );
    }

    return Container(color: const Color(0xFFECECEC));
  }
}
