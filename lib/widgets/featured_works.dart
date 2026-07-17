import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/projects/cola_screen.dart';
import '../screens/projects/zara_screen.dart';
import '../data/sample_data.dart';
import '../models/portfolio_item.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class FeaturedWorks extends StatefulWidget {
  const FeaturedWorks({super.key});

  @override
  State<FeaturedWorks> createState() => _FeaturedWorksState();
}

class _FeaturedWorksState extends State<FeaturedWorks> {
  late final PageController _controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.72);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 800;
    final items = SampleData.featuredWorks;

    return Column(
      children: [
        PagePadding(
          vertical: 96,
          child: SectionHeading(
            title: 'Featured Projects',
            subtitle:
                'A curated selection of recent work across brand, product, and digital craft.',
          ),
        ),
        SizedBox(
          height: compact ? 420 : 520,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (value) => setState(() => _index = value),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final active = index == _index;

              return ClipRect(
                child: AnimatedScale(
                  scale: active ? 1 : 0.94,
                  duration: const Duration(milliseconds: 250),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox.expand(
                      child: _WorkCard(item: item),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ArrowButton(
              icon: Icons.arrow_back,
              onPressed: _index > 0
                  ? () => _controller.previousPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutCubic,
                      )
                  : null,
            ),
            const SizedBox(width: 24),
            for (var i = 0; i < items.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: i == _index ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: i == _index
                      ? AppColors.foreground
                      : AppColors.border,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            const SizedBox(width: 24),
            _ArrowButton(
              icon: Icons.arrow_forward,
              onPressed: _index < items.length - 1
                  ? () => _controller.nextPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutCubic,
                      )
                  : null,
            ),
          ],
        ),
        const SizedBox(height: 96),
      ],
    );
  }
}

class _WorkCard extends StatelessWidget {
  const _WorkCard({required this.item});

  final PortfolioItem item;

  void _openProject(BuildContext context) {
    if (item.projectId == 'zara') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ZaraScreen()),
      );
      return;
    }

    if (item.projectId == 'cola') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ColaScreen()),
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
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: item.imageAsset != null
                  ? Image.asset(
                      item.imageAsset!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: const Color(0xFFECECEC)),
                    )
                  : item.imageUrl != null
                      ? Image.network(
                          item.imageUrl!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: const Color(0xFFECECEC)),
                        )
                      : Container(color: const Color(0xFFECECEC)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 168,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                item.category.toUpperCase(),
                style: AppTheme.sans.copyWith(
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.serif.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.year,
                style: AppTheme.sans.copyWith(
                  fontSize: 12,
                  letterSpacing: 2,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Text(
                      item.description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
                child: (item.projectId != null || item.projectUrl != null)
                    ? LuxuryTextButton(
                        label: 'View Project',
                        onPressed: () => _openProject(context),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      style: IconButton.styleFrom(
        disabledForegroundColor: AppColors.border,
      ),
    );
  }
}
