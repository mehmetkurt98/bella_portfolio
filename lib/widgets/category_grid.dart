import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../models/portfolio_category.dart';
import '../screens/category_screen.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width > 1100 ? 3 : width > 700 ? 2 : 1;

    return PagePadding(
      vertical: 0,
      child: Column(
        children: [
          const SectionHeading(
            title: 'Disciplines',
            subtitle: 'Explore work by practice area.',
          ),
          const SizedBox(height: 56),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: SampleData.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: columns == 1 ? 1.4 : 0.82,
            ),
            itemBuilder: (context, index) {
              return _CategoryCard(category: SampleData.categories[index]);
            },
          ),
          const SizedBox(height: 96),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatefulWidget {
  const _CategoryCard({required this.category});

  final PortfolioCategory category;

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _hovered = false;

  void _openCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CategoryScreen(category: widget.category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _openCategory(context),
        child: AnimatedScale(
          scale: _hovered ? 1.02 : 1,
          duration: const Duration(milliseconds: 220),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  widget.category.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: const Color(0xFFECECEC)),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              widget.category.title.toUpperCase(),
              textAlign: TextAlign.center,
              style: AppTheme.serif.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${widget.category.projectCount} Projects',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 11,
                letterSpacing: 2,
                color: AppColors.muted,
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
