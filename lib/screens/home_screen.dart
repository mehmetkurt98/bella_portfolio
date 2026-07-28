import 'package:flutter/material.dart';

import '../widgets/brand_section.dart';
import '../widgets/case_studies_section.dart';
import '../widgets/creative_about_section.dart';
import '../widgets/delivered_work_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/luxury_footer.dart';
import '../widgets/luxury_header.dart';
import '../widgets/signal_story_section.dart';
import '../widgets/strategy_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _workKey = GlobalKey();
  final _productsKey = GlobalKey();
  final _strategyKey = GlobalKey();
  final _brandingKey = GlobalKey();
  final _creativeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();

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
      alignment: 0.02,
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
      case 'work':
      case 'works':
        _scrollTo(_workKey);
      case 'products':
        _scrollTo(_productsKey);
      case 'strategy':
        _scrollTo(_strategyKey);
      case 'branding':
        _scrollTo(_brandingKey);
      case 'creative':
        _scrollTo(_creativeKey);
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
          LuxuryHeader(onNavigate: _navigate),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    onViewWorks: () => _navigate('work'),
                    onAbout: () => _navigate('about'),
                  ),
                  const SignalRowSection(),
                  const StoryStatementSection(),
                  KeyedSubtree(
                    key: _workKey,
                    child: const DeliveredWorkSection(),
                  ),
                  KeyedSubtree(
                    key: _productsKey,
                    child: const CaseStudiesSection(),
                  ),
                  KeyedSubtree(
                    key: _strategyKey,
                    child: const StrategySection(),
                  ),
                  KeyedSubtree(
                    key: _brandingKey,
                    child: const BrandSection(),
                  ),
                  KeyedSubtree(
                    key: _creativeKey,
                    child: const CreativeSection(),
                  ),
                  KeyedSubtree(
                    key: _aboutKey,
                    child: const AboutExperienceSection(),
                  ),
                  const LeadershipSummarySection(),
                  KeyedSubtree(
                    key: _contactKey,
                    child: LuxuryFooter(onBackToTop: () => _navigate('top')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
