import 'package:flutter/material.dart';

/// Editable Yemeksepeti Apple Watch case study content (from Figma).
abstract final class YemeksepetiProjectData {
  static const title = 'Yemeksepeti for Apple Watch';
  static const shortTitle = 'Yemeksepeti Watch';
  static const category = 'UI/UX · Wearable';
  static const year = '2026';
  static const tagline = 'A Bite Away, Anytime!';

  static const coverAsset = 'assets/projects/yemeksepeti/ys_watch_hero.webp';

  /// Figma board exports in case-study order (About excluded).
  static const boardAssets = <String>[
    'assets/projects/yemeksepeti/ys_main.webp',
    'assets/projects/yemeksepeti/ys_background.webp',
    'assets/projects/yemeksepeti/ys_challenge.webp',
    'assets/projects/yemeksepeti/ys_project_overview.webp',
    'assets/projects/yemeksepeti/ys_swot_image.webp',
    'assets/projects/yemeksepeti/ys_information_arch.webp',
    'assets/projects/yemeksepeti/ys_design_system.webp',
    'assets/projects/yemeksepeti/ys_color_system.webp',
    'assets/projects/yemeksepeti/ys_persona.webp',
    'assets/projects/yemeksepeti/ys_develop.webp',
    'assets/projects/yemeksepeti/ys_main_screen.webp',
    'assets/projects/yemeksepeti/ys_order_screen.webp',
    'assets/projects/yemeksepeti/ys_payment_screen.webp',
    'assets/projects/yemeksepeti/ys_final.webp',
  ];

  static const brandPink = Color(0xFFE91E63);
  static const brandMagenta = Color(0xFFC2185B);
  static const brandOrange = Color(0xFFFF6A3D);
  static const brandYellow = Color(0xFFF5C518);
  static const softBg = Color(0xFFF7F6F2);
  static const ink = Color(0xFF111111);
  static const muted = Color(0xFF6B6B6B);
  static const cardBorder = Color(0xFFE6E2DA);

  static const heroDescription =
      'Reimagining the food delivery experience, Yemeksepeti Food Delivery for '
      'Apple Watch brings convenience to your wrist. Designed for seamless '
      'interactions and real-time updates, this innovative solution makes '
      'ordering your favorite meals faster, simpler, and more engaging—anytime, '
      'anywhere.';

  static const backgroundBody =
      'The Yemeksepeti Food Delivery for Apple Watch project brought the '
      'platform’s convenience to wearable technology. It focused on easy '
      'navigation, quick payments, clear food selection, and a clean, intuitive '
      'design to deliver a seamless and efficient user experience.';

  static const overviewCards = <YsOverviewCard>[
    YsOverviewCard(
      title: 'Focus',
      body:
          'The project focused on delivering an intuitive and glanceable '
          'interface tailored to the Apple Watch’s smaller screen. Emphasis was '
          'placed on simplifying complex interactions into quick, single-tap or '
          'swipe actions while maintaining the core features of Yemeksepeti, '
          'such as order tracking, favorite meals, and secure payments.',
    ),
    YsOverviewCard(
      title: 'Approach',
      body:
          'The Yemeksepeti Apple Watch app prioritized simplicity and usability, '
          'focusing on quick access to essential details like order status and '
          'delivery time. With streamlined navigation, clear visuals, and '
          'seamless integration into the existing ecosystem, the app was '
          'designed to make food ordering fast, intuitive, and enjoyable.',
    ),
    YsOverviewCard(
      title: 'Goal',
      body:
          'To provide Yemeksepeti users with a fast, accessible, and hassle-free '
          'way to order and track food deliveries through the Apple Watch, '
          'enhancing their overall experience with the platform.',
    ),
    YsOverviewCard(
      title: 'Outcome',
      body:
          'A wearable experience that turns complex actions like ordering food '
          'and tracking deliveries into effortless, intuitive moments—while '
          'preserving brand energy on a glanceable screen.',
    ),
  ];

  static const challengeIntro =
      'Designing a seamless food delivery experience for Apple Watch presented '
      'unique challenges. The primary goal was to adapt Yemeksepeti’s '
      'comprehensive functionality to a small screen, ensuring essential '
      'features like quick ordering, food selection, delivery tracking, and '
      'fast payments remained accessible and intuitive.';

  static const challenges = <YsChallenge>[
    YsChallenge(
      title: 'Adapting to limited screen space',
      body: 'Compress complex flows into glanceable watch interactions.',
    ),
    YsChallenge(
      title: 'Prioritizing user needs',
      body: 'Surface only the actions that matter in the moment.',
    ),
    YsChallenge(
      title: 'Maintaining brand identity',
      body: 'Keep Yemeksepeti’s energy alive on a tiny canvas.',
    ),
    YsChallenge(
      title: 'Optimizing for quick interactions',
      body: 'Design for one-tap and swipe-first moments.',
    ),
  ];

  static const projectOverviewIntro =
      'This project was more than just adapting a platform; it was about '
      'transforming how users interact with Yemek Sepeti on the go. By '
      'leveraging the unique capabilities of the Apple Watch, I delivered a '
      'design that turns complex actions into effortless moments—all within '
      '1 week.';

  static const roleTitle = 'ROLE';
  static const roleValue = 'Lead UX/UI Innovator';
  static const roleBody =
      'This project reimagined menu browsing, ordering, payment, and delivery '
      'tracking for the Apple Watch, delivering a seamless and intuitive user '
      'experience.';

  static const timeframeTitle = 'Timeframe';
  static const timeframeValue = 'Completed in just 7 days.';
  static const timeframeBody =
      'The design focused on simplicity, intuitive interactions, and seamless '
      'integration of Apple Watch features for a smooth, user-friendly '
      'experience.';

  static const valuesTitle = 'Project Values';
  static const valuesBody =
      'Independently handled every stage of the design journey, from ideation '
      'to final prototype delivery, showcasing leadership and creative '
      'expertise.';

  static const processLabels = <String>[
    'Analysis',
    'Information Architecture',
    'Design System',
    'Color System',
    'UI Screens',
  ];

  static const closing =
      'A wearable food-ordering experience designed for speed, clarity, and '
      'delight—right from the wrist.';
}

class YsOverviewCard {
  const YsOverviewCard({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

class YsChallenge {
  const YsChallenge({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}


