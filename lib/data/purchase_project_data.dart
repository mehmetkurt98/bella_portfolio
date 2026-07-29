import 'package:flutter/material.dart';

/// Purchase Experience case study — from presentation handoff.
abstract final class PurchaseProjectData {
  static const title = 'Purchase Experience';
  static const shortTitle = 'Purchase';
  static const category = 'UI / UX CASE STUDY';
  static const subtitle =
      'A clearer checkout journey across iOS and Android.';
  static const conceptLabel = 'CONCEPT REDESIGN';
  static const designer = 'Bella Vahidoglu · Product Designer';

  // Design tokens from handoff
  static const background = Color(0xFFFFFFFF);
  static const backgroundWarm = Color(0xFFFBFAF4);
  static const accentYellow = Color(0xFFE9E241);
  static const accentSoft = Color(0xFFF8F6C9);
  static const textPrimary = Color(0xFF171717);
  static const textSecondary = Color(0xFF66645C);
  static const border = Color(0xFFE5E1D4);

  static const heroAsset = 'assets/projects/purchase/hero-checkout-flow.webp';
  static const addToBagAsset = 'assets/projects/purchase/add-to-bag.webp';
  static const shoppingBagAsset = 'assets/projects/purchase/shopping-bag.webp';
  static const shippingAsset = 'assets/projects/purchase/shipping.webp';
  static const paymentAsset = 'assets/projects/purchase/payment.webp';
  static const orderSummaryAsset =
      'assets/projects/purchase/order-summary.webp';

  static const challengeEyebrow = '01 — THE CHALLENGE';
  static const challengeTitle = 'Three friction points define the problem.';
  static const challengeLead =
      'The redesign focuses on the places where customers are most likely to '
      'hesitate, re-check information, or lose confidence.';

  static const frictionPoints = <PurchaseFriction>[
    PurchaseFriction(
      title: 'No visible progress',
      body: 'Uncertainty increases hesitation before payment.',
    ),
    PurchaseFriction(
      title: 'High form density',
      body: 'Too many equal fields create cognitive load.',
    ),
    PurchaseFriction(
      title: 'Weak order context',
      body: 'Customers need details nearby to feel confident.',
    ),
  ];

  static const directionEyebrow = '02 — DESIGN DIRECTION';
  static const directionTitle = 'From friction to design decisions.';
  static const directionLead =
      'Each decision directly answers a checkout problem visible in the '
      'original flow.';

  static const decisions = <PurchaseDecision>[
    PurchaseDecision(
      number: '01',
      title: 'One dominant action',
      body: 'Competing choices → a clear primary CTA at every step.',
      highlight: true,
    ),
    PurchaseDecision(
      number: '02',
      title: 'Group by intent',
      body: 'Dense forms → information organized into manageable tasks.',
    ),
    PurchaseDecision(
      number: '03',
      title: 'Keep context visible',
      body: 'Repeated checking → totals and order details stay within reach.',
    ),
    PurchaseDecision(
      number: '04',
      title: 'Share the logic',
      body: 'Platform drift → one hierarchy adapted to native controls.',
    ),
  ];

  static const flowEyebrow = '03 — EXPERIENCE FLOW';
  static const flowTitle = 'Reduce cognitive load—one decision at a time.';
  static const flowLead =
      'The flow turns one complex purchase into five focused customer questions.';
  static const flowWhyLabel = 'WHY IT WORKS';
  static const flowWhy =
      'Confirm → orient → complete. The same rhythm repeats across the entire '
      'checkout.';

  static const flowSteps = <PurchaseFlowStep>[
    PurchaseFlowStep(
      number: '01',
      label: 'ADD',
      question: 'Is this the right item?',
    ),
    PurchaseFlowStep(
      number: '02',
      label: 'REVIEW',
      question: 'Is my order correct?',
    ),
    PurchaseFlowStep(
      number: '03',
      label: 'SHIP',
      question: 'Where should it go?',
      highlight: true,
    ),
    PurchaseFlowStep(
      number: '04',
      label: 'PAY',
      question: 'How will I pay?',
    ),
    PurchaseFlowStep(
      number: '05',
      label: 'CONFIRM',
      question: 'What happens next?',
    ),
  ];

  static const momentsEyebrow = '04 — KEY MOMENTS';
  static const momentsTitle = 'The screens make the decisions visible.';

  static const keyMoments = <PurchaseKeyMoment>[
    PurchaseKeyMoment(
      number: '01',
      title: 'Immediate feedback',
      body:
          'Selection is confirmed; the customer can continue or review the bag.',
      asset: addToBagAsset,
    ),
    PurchaseKeyMoment(
      number: '02',
      title: 'Order review',
      body:
          'Product, quantity, total, and next action remain visible in one scan.',
      asset: shoppingBagAsset,
    ),
    PurchaseKeyMoment(
      number: '03',
      title: 'Focused input',
      body:
          'Fields are grouped by intent while the order stays within reach.',
      asset: shippingAsset,
    ),
  ];

  static const systemEyebrow = '05 — SYSTEM THINKING';
  static const systemTitle = 'One system. Familiar on every platform.';
  static const systemLead =
      'Shared hierarchy creates consistency; native controls preserve familiarity.';

  static const systemCards = <PurchaseSystemCard>[
    PurchaseSystemCard(
      label: 'PAYMENT',
      title: 'Flexible payment.',
      body: 'Clear methods and predictable fields.',
      asset: paymentAsset,
      yellow: false,
    ),
    PurchaseSystemCard(
      label: 'SUMMARY',
      title: 'Confident final review.',
      body: 'Delivery and order details stay easy to verify.',
      asset: orderSummaryAsset,
      yellow: true,
    ),
  ];

  static const outcomeEyebrow = '06 — OUTCOME';
  static const outcomeTitle =
      'A scalable checkout foundation ready for validation.';
  static const outcomeLead =
      'This concept aligns the purchase journey around reusable patterns and '
      'clearer customer decisions—without claiming untested performance gains.';

  static const outcomePillars = <PurchasePillar>[
    PurchasePillar(label: 'CLEARER', body: 'decision points'),
    PurchasePillar(label: 'REUSABLE', body: 'form patterns'),
    PurchasePillar(label: 'CONSISTENT', body: 'cross-platform hierarchy'),
  ];

  static const nextStepLabel = 'NEXT STEP';
  static const nextStepTitle = 'Validate the rhythm, not just the screens.';
  static const nextSteps = <String>[
    'Test task completion across the five-step flow',
    'Observe hesitation around forms and totals',
    'Refine accessibility states and error guidance',
    'Translate patterns into reusable components',
  ];

  static const role = 'ROLE · Product Design / UX / UI';
  static const thankYou = 'THANK YOU';
}

class PurchaseFriction {
  const PurchaseFriction({required this.title, required this.body});
  final String title;
  final String body;
}

class PurchaseDecision {
  const PurchaseDecision({
    required this.number,
    required this.title,
    required this.body,
    this.highlight = false,
  });
  final String number;
  final String title;
  final String body;
  final bool highlight;
}

class PurchaseFlowStep {
  const PurchaseFlowStep({
    required this.number,
    required this.label,
    required this.question,
    this.highlight = false,
  });
  final String number;
  final String label;
  final String question;
  final bool highlight;
}

class PurchaseKeyMoment {
  const PurchaseKeyMoment({
    required this.number,
    required this.title,
    required this.body,
    required this.asset,
  });
  final String number;
  final String title;
  final String body;
  final String asset;
}

class PurchaseSystemCard {
  const PurchaseSystemCard({
    required this.label,
    required this.title,
    required this.body,
    required this.asset,
    required this.yellow,
  });
  final String label;
  final String title;
  final String body;
  final String asset;
  final bool yellow;
}

class PurchasePillar {
  const PurchasePillar({required this.label, required this.body});
  final String label;
  final String body;
}
