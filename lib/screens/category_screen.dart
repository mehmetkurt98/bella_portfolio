import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/sample_data.dart';
import '../models/portfolio_category.dart';
import '../models/portfolio_item.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';
import 'projects/cola_screen.dart';
import 'projects/feedback_screen.dart';
import 'projects/fitlab_screen.dart';
import 'projects/login_screen.dart';
import 'projects/purchase_screen.dart';
import 'projects/yemeksepeti_screen.dart';
import 'projects/zara_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final PortfolioCategory category;

  static String _normalize(String value) =>
      value.replaceAll(' ', '').toLowerCase();

  List<PortfolioItem> get _items => SampleData.featuredWorks
      .where(
        (item) => _normalize(item.category) == _normalize(category.title),
      )
      .toList(growable: false);

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final width = MediaQuery.sizeOf(context).width;
    final columns = width > 1100
        ? 3
        : width > 700
            ? 2
            : 1;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PagePadding(
              vertical: 24,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LuxuryTextButton(
                  label: 'Back',
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ),
            ),
            PagePadding(
              vertical: 24,
              child: SectionHeading(
                title: category.title,
                subtitle: items.isEmpty
                    ? 'No projects in this discipline yet.'
                    : '${items.length} project${items.length == 1 ? '' : 's'} in this discipline.',
              ),
            ),
            PagePadding(
              vertical: 40,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 48,
                  childAspectRatio: columns == 1 ? 0.95 : 0.72,
                ),
                itemBuilder: (context, index) =>
                    _CategoryWorkCard(item: items[index]),
              ),
            ),
            const SizedBox(height: 72),
          ],
        ),
      ),
    );
  }
}

class _CategoryWorkCard extends StatefulWidget {
  const _CategoryWorkCard({required this.item});

  final PortfolioItem item;

  @override
  State<_CategoryWorkCard> createState() => _CategoryWorkCardState();
}

class _CategoryWorkCardState extends State<_CategoryWorkCard> {
  bool _hovered = false;

  PortfolioItem get item => widget.item;

  Future<void> _openProject(BuildContext context) async {
    final Widget? screen = switch (item.projectId) {
      'cola' => const ColaScreen(),
      'zara' => const ZaraScreen(),
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
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _openProject(context),
        child: AnimatedScale(
          scale: _hovered ? 1.02 : 1,
          duration: const Duration(milliseconds: 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: item.imageAsset != null
                      ? Image.asset(
                          item.imageAsset!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: const Color(0xFFECECEC)),
                        )
                      : item.imageUrl != null
                          ? Image.network(
                              item.imageUrl!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(color: const Color(0xFFECECEC)),
                            )
                          : Container(color: const Color(0xFFECECEC)),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                item.title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.serif.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.year,
                textAlign: TextAlign.center,
                style: AppTheme.sans.copyWith(
                  fontSize: 11,
                  letterSpacing: 2,
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              LuxuryTextButton(
                label: 'View Project',
                onPressed: () => _openProject(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
