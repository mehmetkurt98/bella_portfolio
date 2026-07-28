import 'package:flutter/material.dart';

/// Editable FitLab Eats project content.
abstract final class FitlabProjectData {
  static const title = 'FitLab Eats';
  static const category = 'UI/UX · Product';
  static const year = '2026';
  static const coverAsset = 'assets/projects/fitlab/fitlab_cover.webp';

  static const brandYellow = Color(0xFFF5C518);
  static const brandYellowDeep = Color(0xFFE6B800);
  static const softBg = Color(0xFFF6F6F4);
  static const ink = Color(0xFF111111);
  static const muted = Color(0xFF6B6B6B);

  static const logoPrimary = 'FITLab';
  static const logoAccent = 'Eats';

  static const headlineLead = 'Healthy eating made ';
  static const headlineAccent = 'simple.';

  static const description =
      'FitLab Eats helps people build sustainable nutrition habits with '
      'high-protein recipes, personal goals, and effortless daily tracking — '
      'designed for clarity, speed, and real-life routines.';

  static const ctaLabel = 'Now Live on Android';

  static const features = <FitlabFeature>[
    FitlabFeature(
      title: 'High Protein Recipes',
      subtitle: 'Meals built around strength and recovery goals.',
      icon: Icons.fitness_center_rounded,
    ),
    FitlabFeature(
      title: 'Clean Ingredients',
      subtitle: 'Simple foods with transparent nutrition details.',
      icon: Icons.eco_rounded,
    ),
    FitlabFeature(
      title: 'Personal Goals',
      subtitle: 'Targets tailored to your lifestyle and progress.',
      icon: Icons.track_changes_rounded,
    ),
    FitlabFeature(
      title: 'Quick & Easy Meals',
      subtitle: 'Fast recipes that still feel intentional.',
      icon: Icons.schedule_rounded,
    ),
    FitlabFeature(
      title: 'Habit Tracking',
      subtitle: 'Water, meals, and routines in one calm flow.',
      icon: Icons.favorite_rounded,
    ),
  ];

  static const processSteps = <FitlabProcessStep>[
    FitlabProcessStep(
      title: 'Product Strategy',
      body: 'Defined audience, value proposition, and success metrics.',
      icon: Icons.lightbulb_outline_rounded,
    ),
    FitlabProcessStep(
      title: 'UX Research',
      body: 'Mapped eating habits, friction points, and motivation loops.',
      icon: Icons.search_rounded,
    ),
    FitlabProcessStep(
      title: 'Information Architecture',
      body: 'Structured discovery, tracking, and recipe journeys.',
      icon: Icons.account_tree_outlined,
    ),
    FitlabProcessStep(
      title: 'UI/UX Design',
      body: 'Crafted a warm, high-clarity interface system.',
      icon: Icons.design_services_outlined,
    ),
    FitlabProcessStep(
      title: 'Design System',
      body: 'Tokens, components, and reusable product patterns.',
      icon: Icons.grid_view_rounded,
    ),
    FitlabProcessStep(
      title: 'Creative Direction',
      body: 'Brand tone, motion language, and visual hierarchy.',
      icon: Icons.brush_outlined,
    ),
    FitlabProcessStep(
      title: 'Android Development',
      body: 'Shipped a polished native experience now live on Android.',
      icon: Icons.phone_android_rounded,
    ),
  ];

  static const footerQuote =
      'Good food. Real results. Your journey to a healthier you starts here.';
}

class FitlabFeature {
  const FitlabFeature({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}

class FitlabProcessStep {
  const FitlabProcessStep({
    required this.title,
    required this.body,
    required this.icon,
  });

  final String title;
  final String body;
  final IconData icon;
}
