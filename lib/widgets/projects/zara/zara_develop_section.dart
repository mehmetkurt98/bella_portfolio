import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraDevelopSection extends StatelessWidget {
  const ZaraDevelopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Color(0xFFF0F2F5),
          ],
        ),
      ),
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'DEVELOP',
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 28 : 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 24),
            for (final paragraph in ZaraProjectData.developParagraphs) ...[
              Text(
                paragraph,
                style: AppTheme.sans.copyWith(
                  fontSize: 14,
                  height: 1.7,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),
            ],
            SizedBox(height: wide ? 40 : 28),
            Text(
              'WIRE FRAME',
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 22 : 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: wide ? 28 : 20),
            const _WireframeGrid(),
          ],
        ),
      ),
    );
  }
}

class _WireframeGrid extends StatelessWidget {
  const _WireframeGrid();

  @override
  Widget build(BuildContext context) {
    final frames = <Widget>[
      const _HomeWireframe(),
      const _MenuWireframe(),
      const _SkirtsWireframe(),
      const _GuideWireframe(),
      const _SurveyIntroWireframe(),
      const _SurveyQuestionsWireframe(),
      const _StyleOptionsWireframe(),
      const _BagWireframe(),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 1100
            ? 4
            : constraints.maxWidth > 700
                ? 2
                : 1;
        final spacing = 16.0;
        final itemWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final frame in frames)
              SizedBox(
                width: itemWidth,
                height: itemWidth * 1.85,
                child: frame,
              ),
          ],
        );
      },
    );
  }
}

class _PhoneShell extends StatelessWidget {
  const _PhoneShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFB0B0B0), width: 1.5),
      ),
      child: Column(
        children: [
          Expanded(child: child),
          const _BottomNav(),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFCFCFCF))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final label in ['HOME', 'MENU', 'ACCOUNT', 'BAG (0)'])
            Text(
              label,
              style: AppTheme.sans.copyWith(
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
        ],
      ),
    );
  }
}

class _BoxLabel extends StatelessWidget {
  const _BoxLabel(
    this.label, {
    this.fill = const Color(0xFFD9D9D9),
    this.expand = false,
  });

  final String label;
  final Color fill;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: fill,
        border: Border.all(color: const Color(0xFF9E9E9E)),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: AppTheme.sans.copyWith(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),
      ),
    );

    if (expand) {
      return Expanded(child: child);
    }
    return child;
  }
}

class _HomeWireframe extends StatelessWidget {
  const _HomeWireframe();

  @override
  Widget build(BuildContext context) {
    return _PhoneShell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const _BoxLabel('LOGO'),
            const SizedBox(height: 10),
            const _BoxLabel('FASHION PHOTO', expand: true),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 36,
                  height: 10,
                  color: const Color(0xFFCFCFCF),
                ),
                const Spacer(),
                Text(
                  'GUIDE',
                  style: AppTheme.sans.copyWith(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuWireframe extends StatelessWidget {
  const _MenuWireframe();

  static const _items = [
    'NEW',
    'THE REHEARSAL ZARA STUDIO',
    'SPECIAL OCCASION',
    'SWIMWEAR',
    'SELECTED BY',
    'JACKETS/COATS',
    'TROUSERS',
    'JEANS',
    'LINEN',
    'SWEATERS/CARDIGANS',
    'HOODIES/SWEATSHIRTS',
    'T-SHIRTS',
    'OVERSHIRTS',
  ];

  @override
  Widget build(BuildContext context) {
    return _PhoneShell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: _BoxLabel('LOGO')),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final item in ['WOMEN', 'MAN', 'KIDS'])
                  Text(
                    item,
                    style: AppTheme.sans.copyWith(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'STYLE YOUR ITEM',
              style: AppTheme.sans.copyWith(fontSize: 8),
            ),
            Text(
              'STYLE ME ZARA',
              style: AppTheme.sans.copyWith(
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (final item in _items)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        item,
                        style: AppTheme.sans.copyWith(fontSize: 7.5),
                      ),
                    ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'SEARCH',
                style: AppTheme.sans.copyWith(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkirtsWireframe extends StatelessWidget {
  const _SkirtsWireframe();

  @override
  Widget build(BuildContext context) {
    const filters = [
      'VIEW ALL',
      'DENIM',
      'SHIRT',
      'LEATHER',
      'CROPPED',
      'COLOUR',
      'SIZE',
      'PRICE',
      'COLLECTION',
    ];

    return _PhoneShell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                for (final filter in filters)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF9E9E9E)),
                    ),
                    child: Text(
                      filter,
                      style: AppTheme.sans.copyWith(fontSize: 6.5),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            const _BoxLabel('SKIRTS', expand: true),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'SEARCH',
                style: AppTheme.sans.copyWith(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuideWireframe extends StatelessWidget {
  const _GuideWireframe();

  @override
  Widget build(BuildContext context) {
    return _PhoneShell(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'GUIDE',
              style: AppTheme.sans.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.foreground, width: 1.5),
              ),
              child: Text(
                'Style Me Zara',
                style: AppTheme.sans.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SurveyIntroWireframe extends StatelessWidget {
  const _SurveyIntroWireframe();

  @override
  Widget build(BuildContext context) {
    return _PhoneShell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'SURVEY',
              style: AppTheme.sans.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: const Color(0xFFD9D9D9),
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Hi! I'm your Zara Assistant.\nLet's get started!",
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(
                    fontSize: 10,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SurveyQuestionsWireframe extends StatelessWidget {
  const _SurveyQuestionsWireframe();

  @override
  Widget build(BuildContext context) {
    return _PhoneShell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'SURVEY',
              style: AppTheme.sans.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Questions and Answers',
              style: AppTheme.sans.copyWith(fontSize: 9),
            ),
            const SizedBox(height: 16),
            for (var i = 0; i < 4; i++) ...[
              Container(
                height: 28,
                width: double.infinity,
                color: const Color(0xFFD9D9D9),
              ),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}

class _StyleOptionsWireframe extends StatelessWidget {
  const _StyleOptionsWireframe();

  @override
  Widget build(BuildContext context) {
    return _PhoneShell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Style Options',
              style: AppTheme.sans.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  4,
                  (_) => Container(color: const Color(0xFFD9D9D9)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BagWireframe extends StatelessWidget {
  const _BagWireframe();

  @override
  Widget build(BuildContext context) {
    return _PhoneShell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Shopping Bag',
              style: AppTheme.sans.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            const _BoxLabel('', expand: true, fill: Color(0xFFD9D9D9)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.foreground),
              ),
              child: Text(
                'Continue',
                style: AppTheme.sans.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
