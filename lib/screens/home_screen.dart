import 'package:flutter/material.dart';

import '../widgets/about_section.dart';
import '../widgets/category_grid.dart';
import '../widgets/contact_section.dart';
import '../widgets/featured_works.dart';
import '../widgets/hero_section.dart';
import '../widgets/luxury_footer.dart';
import '../widgets/luxury_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _worksKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();
  bool _promoVisible = true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  void _navigate(String section) {
    switch (section) {
      case 'top':
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      case 'works':
        _scrollTo(_worksKey);
      case 'about':
        _scrollTo(_aboutKey);
      case 'contact':
        _scrollTo(_contactKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LuxuryHeader(
            promoVisible: _promoVisible,
            onClosePromo: () => setState(() => _promoVisible = false),
            onNavigate: _navigate,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    onViewWorks: () => _navigate('works'),
                    onContact: () => _navigate('contact'),
                  ),
                  KeyedSubtree(
                    key: _worksKey,
                    child: const FeaturedWorks(),
                  ),
                  const CategoryGrid(),
                  KeyedSubtree(
                    key: _aboutKey,
                    child: const AboutSection(),
                  ),
                  KeyedSubtree(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),
                  const LuxuryFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
