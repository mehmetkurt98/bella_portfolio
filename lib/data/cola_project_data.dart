import 'package:flutter/material.dart';

abstract final class ColaProjectData {
  static const darkBlue = Color(0xFF2E3848);
  static const yellow = Color(0xFFFFD700);
  static const frameYellow = Color(0xFFFFD700);
  static const green = Color(0xFF9DD055);
  static const lime = Color(0xFF9DD055);
  static const limeDark = Color(0xFF7AB82E);
  static const quoteBg = Color(0xFFE5E14E);
  static const softBg = Color(0xFFF7F6F2);
  static const ink = Color(0xFF111111);

  static const title = 'COCA-COLA LIME ORDERING EXPERIENCE PROJECT';
  static const subtitle =
      'Redesigning Coca-Cola Lime\'s Order Page To Deliver A Seamless And '
      'Visually Engaging User Experience.';

  static const closing =
      'A seamless pre-order experience designed for clarity, delight, and brand energy.';

  /// Figma board exports in case-study order.
  static const boardAssets = <String>[
    'assets/projects/cola/coca_cola1.webp',
    'assets/projects/cola/coca_cola2.webp',
    'assets/projects/cola/coca_cola3.webp',
    'assets/projects/cola/coca_cola4.webp',
    'assets/projects/cola/coca_cola5.webp',
    'assets/projects/cola/coca_cola6.webp',
    'assets/projects/cola/coca_cola7.webp',
    'assets/projects/cola/coca_cola8.webp',
    'assets/projects/cola/coca_cola9.webp',
    'assets/projects/cola/coca_cola10.webp',
    'assets/projects/cola/coca_cola11.webp',
    'assets/projects/cola/coca_cola12.webp',
    'assets/projects/cola/coca_cola13.webp',
    'assets/projects/cola/coca_cola14.webp',
    'assets/projects/cola/coca_cola15.webp',
    'assets/projects/cola/coca_cola16.webp',
    'assets/projects/cola/coca_cola17.webp',
    'assets/projects/cola/coca_cola18.webp',
    'assets/projects/cola/coca_cola19.webp',
    'assets/projects/cola/coca_cola20.webp',
    'assets/projects/cola/coca_cola21.webp',
  ];

  static const heroImage = 'assets/projects/cola/coca_cola1.webp';
  static const logoIcon = 'assets/projects/cola/cola30.png';
  static const challengeImage = 'assets/projects/cola/cola2.png';
  static const timeframeImage = 'assets/projects/cola/cola3.png';
  static const swotImage = 'assets/projects/cola/cola4.png';

  static const gilroyWeights = 'assets/projects/cola/cola5.png';
  static const gilroyMark = 'assets/projects/cola/cola6.png';
  static const gilroySpecimen = 'assets/projects/cola/cola7.png';
  static const overlockWeights = 'assets/projects/cola/cola8.png';
  static const overlockMark = 'assets/projects/cola/cola9.png';
  static const overlockSpecimen = 'assets/projects/cola/cola10.png';
  static const colorPalette = 'assets/projects/cola/cola11.png';
  static const personaImage = 'assets/projects/cola/cola12.png';
  static const developImages = <String>[
    'assets/projects/cola/cola13.png',
    'assets/projects/cola/cola14.png',
  ];
  static const wireframeImages = <String>[
    'assets/projects/cola/cola15.png',
    'assets/projects/cola/cola16.png',
    'assets/projects/cola/cola17.png',
    'assets/projects/cola/cola18.png',
  ];
  static const wireframeLabels = <String>[
    'Homepage',
    'Products',
    'About Us',
    'Impact',
  ];
  static const wireframeHero = 'assets/projects/cola/cola19.png';
  static const deliverImages = <String>[
    'assets/projects/cola/cola20.png',
    'assets/projects/cola/cola21.png',
    'assets/projects/cola/cola22.png',
    'assets/projects/cola/cola23.png',
    'assets/projects/cola/cola24.png',
    'assets/projects/cola/cola25.png',
    'assets/projects/cola/cola26.png',
    'assets/projects/cola/cola27.png',
    'assets/projects/cola/cola28.png',
    'assets/projects/cola/cola29.png',
  ];

  static const introTitle = 'LIME UP YOUR DAY!';
  static const introBody =
      'This project aimed to create a user-friendly and visually appealing UI/UX '
      'design for the Coca-Cola Lime order page. The goal was to enhance the digital '
      'experience, making it easier for users to explore products, understand '
      'promotions, and complete pre-orders with confidence.';

  static const objectives = <String>[
    'Enhance User Satisfaction',
    'Simplify The Order Process',
    'Make Promotions And Product Details More Visible',
  ];

  static const objectivesClosing =
      'The redesign focused on delivering a seamless experience that strengthens '
      'Coca-Cola Lime\'s digital presence.';

  static const backgroundItems = <ColaTextBlock>[
    ColaTextBlock(
      title: 'Focus',
      body:
          'Redesigning the Coca-Cola Lime pre-order page to deliver a clearer, '
          'more engaging, and conversion-focused digital experience.',
    ),
    ColaTextBlock(
      title: 'Approach',
      body:
          'Conducted user research and competitor analysis to identify pain points '
          'such as unclear navigation, weak promotion visibility, and friction in '
          'the order flow.',
    ),
    ColaTextBlock(
      title: 'Goal',
      body:
          'Simplify the order journey, highlight product details and promotions, '
          'and create a visually compelling interface aligned with the brand.',
    ),
    ColaTextBlock(
      title: 'Outcome',
      body:
          'An intuitive and engaging ordering experience that improves clarity, '
          'supports faster decision-making, and increases user satisfaction.',
    ),
  ];

  static const challengeItems = <ColaTextBlock>[
    ColaTextBlock(
      title: 'Creating a Seamless User Flow',
      body:
          'Designing an intuitive path from discovery to pre-order without '
          'unnecessary steps or confusion.',
    ),
    ColaTextBlock(
      title: 'Highlighting Promotions and Deals',
      body:
          'Making offers and limited-edition details immediately visible without '
          'overwhelming the page.',
    ),
    ColaTextBlock(
      title: 'Enhancing Visual Appeal',
      body:
          'Balancing vibrant Coca-Cola Lime branding with a clean, modern layout '
          'that feels premium and refreshing.',
    ),
    ColaTextBlock(
      title: 'Simplifying Checkout Process',
      body:
          'Reducing friction in the pre-order form while keeping required '
          'information complete and clear.',
    ),
    ColaTextBlock(
      title: 'Mobile Optimization',
      body:
          'Ensuring the experience remains fluid and readable across phones, '
          'tablets, and desktop screens.',
    ),
    ColaTextBlock(
      title: 'Balancing Information and Simplicity',
      body:
          'Presenting product details, brand story, and CTAs without creating '
          'visual or cognitive overload.',
    ),
  ];

  static const challengeClosing =
      'These challenges guided every design decision toward clarity, energy, '
      'and a brand-true Coca-Cola Lime experience.';

  static const overviewBody =
      'The project focused on designing a responsive pre-order experience for '
      'Coca-Cola Lime, applying modern UX/UI principles to create a clear, '
      'engaging, and conversion-oriented digital journey.';

  static const timeframeNote = 'The project was completed in 7 DAYS';

  static const timeframeDays = <ColaTextBlock>[
    ColaTextBlock(
      title: 'DAY 1',
      body: 'Initial research and user needs; sketched wireframes.',
    ),
    ColaTextBlock(
      title: 'DAY 2',
      body: 'Designed homepage and product page layouts.',
    ),
    ColaTextBlock(
      title: 'DAY 3',
      body: 'Developed About Us and Contact pages.',
    ),
    ColaTextBlock(
      title: 'DAY 4',
      body: 'Created the pre-order form (focus on speed/simplicity).',
    ),
    ColaTextBlock(
      title: 'DAY 5',
      body: 'Refined product promotion displays.',
    ),
    ColaTextBlock(
      title: 'DAY 6',
      body: 'Conducted usability testing and collected feedback.',
    ),
    ColaTextBlock(
      title: 'DAY 7',
      body: 'Finalized all pages and prepared the clickable prototype.',
    ),
  ];

  static const projectValues = <ColaTextBlock>[
    ColaTextBlock(
      title: 'USER-CENTRIC DESIGN',
      body:
          'Prioritizing the needs, preferences, and satisfaction of users at '
          'every stage of the design process.',
    ),
    ColaTextBlock(
      title: 'SIMPLICITY AND EFFICIENCY',
      body:
          'Streamlining processes and interfaces to ensure quick and easy '
          'navigation, minimizing friction for users.',
    ),
    ColaTextBlock(
      title: 'VISUAL APPEAL',
      body:
          'Incorporating vibrant, brand-aligned aesthetics to create an '
          'engaging and memorable experience.',
    ),
    ColaTextBlock(
      title: 'RESPONSIVENESS',
      body:
          'Designing with adaptability in mind, ensuring a seamless experience '
          'across all devices and screen sizes.',
    ),
    ColaTextBlock(
      title: 'BRAND INTEGRITY',
      body:
          'Maintaining Coca-Cola Lime\'s energetic and refreshing identity '
          'while integrating it into every design element.',
    ),
    ColaTextBlock(
      title: 'DATA-DRIVEN DECISIONS',
      body:
          'Using insights from user research, feedback, and testing to inform '
          'and refine design choices.',
    ),
    ColaTextBlock(
      title: 'INNOVATION AND CREATIVITY',
      body:
          'Pushing boundaries to deliver fresh, exciting solutions that stand '
          'out while solving real user challenges.',
    ),
    ColaTextBlock(
      title: 'ACCESSIBILITY',
      body:
          'Ensuring the design is inclusive and usable for a diverse range of '
          'users, adhering to WCAG standards.',
    ),
  ];

  static const valuesClosing =
      'These values guided the Coca-Cola Lime project, shaping the process and '
      'outcomes to deliver a design that balances functionality, creativity, '
      'and user satisfaction.';

  static const quote =
      'Design Is Where Creativity Meets Purpose, and Every Detail Tells A Story.';
  static const quoteAuthor = 'Bella Vahidoglu';

  static const designSystemIntro =
      'For this project, Gilroy and Overlock SC fonts were selected to create a '
      'harmonious balance. Overlock SC captivates attention with its bold, '
      'energetic style, reflecting Coca-Cola Lime\'s vibrant identity, while '
      'Gilroy provides clean readability and usability across product details '
      'and instructional content.';

  static const gilroyBody =
      'Gilroy Condensed is used for body text, detailed product descriptions, '
      'and instructional content thanks to its excellent readability.';

  static const overlockBody =
      'Overlock SC Condensed reflects the lively and refreshing brand personality, '
      'adding a playful touch to Coca-Cola Lime\'s dynamic identity.';

  static const colorSystemIntro =
      'Dark blue, yellow, green, white, and black were chosen for Coca-Cola Lime '
      'to emphasize freshness, energy, and modernity.';

  static const colorSystemClosing =
      'Together, these colors create a fresh, dynamic, and visually striking '
      'brand identity.';

  static const colorSwatches = <ColaColorSwatch>[
    ColaColorSwatch(name: 'Dark Blue', hex: '#2E3848', color: darkBlue),
    ColaColorSwatch(name: 'Yellow', hex: '#FFD700', color: yellow),
    ColaColorSwatch(name: 'Green', hex: '#9DD055', color: green),
    ColaColorSwatch(name: 'White', hex: '#FFFFFF', color: Color(0xFFFFFFFF)),
    ColaColorSwatch(name: 'Black', hex: '#000000', color: Color(0xFF000000)),
  ];

  static const iaNodes = <ColaIaNode>[
    ColaIaNode(label: 'Homepage', children: ['Products', 'About Us', 'Impact']),
    ColaIaNode(label: 'Products', children: ['Order Now', 'Products Page']),
  ];

  static const personaIntro =
      'Emily is a dynamic, health-conscious professional who prefers modern '
      'beverages that match her active lifestyle and eco-aware values.';

  static const personaName = 'EMILY CARTER';
  static const personaDetails = <ColaTextBlock>[
    ColaTextBlock(title: 'Name', body: 'Emily Carter'),
    ColaTextBlock(title: 'Age', body: '28'),
    ColaTextBlock(title: 'Occupation', body: 'Yoga Instructor'),
    ColaTextBlock(title: 'Location', body: 'Los Angeles'),
    ColaTextBlock(title: 'Lifestyle', body: 'Active and Trendy'),
  ];

  static const personaPsychographics = <ColaTextBlock>[
    ColaTextBlock(
      title: 'Personality',
      body:
          'Outgoing, adventurous, and curious. Loves exploring new experiences '
          'and brands.',
    ),
    ColaTextBlock(
      title: 'Values',
      body:
          'Enjoys brands that align with eco-consciousness, vibrancy, and '
          'innovation.',
    ),
    ColaTextBlock(
      title: 'Interests',
      body:
          'Fitness classes like Zumba and Yoga. Social events, weekend brunches, '
          'and craft markets. Traveling and trying unique beverages.',
    ),
  ];

  static const personaGoal =
      'To discover innovative, refreshing beverages that match her vibrant and '
      'active lifestyle, offering low-calorie options with unique flavors that '
      'align with her eco-conscious values and aesthetic preferences.';

  static const developIntro =
      'The development phase emphasized efficiency and scalability, translating '
      'research insights into modular layouts, dynamic prototypes, and '
      'production-ready interaction patterns.';

  static const developItems = <ColaTextBlock>[
    ColaTextBlock(
      title: 'Efficient Iteration',
      body:
          'Rapid wireframe revision and a modular design system accelerated '
          'decision-making across screens.',
    ),
    ColaTextBlock(
      title: 'Scalability in Design',
      body:
          'Pages were structured to support future additions such as loyalty '
          'programs and seasonal campaigns.',
    ),
    ColaTextBlock(
      title: 'Dynamic Prototyping',
      body:
          'Smooth transitions and optimized user flows validated the pre-order '
          'journey before visual polish.',
    ),
    ColaTextBlock(
      title: 'Outcomes from the Development Phase',
      body:
          'Technical refinements (hover states/transitions) and a problem-solving '
          'mindset simplified navigation while keeping brand energy intact.',
    ),
  ];

  static const wireframesIntro =
      'The Coca-Cola Lime project\'s wireframes served as the foundation for '
      'creating a user-centric and visually engaging platform across Homepage, '
      'Products, About Us, and Impact.';

  static const deliverIntro =
      'The Deliver phase ensured a responsive, scalable design that met modern '
      'user expectations across desktop, tablet, and mobile — from high-fidelity '
      'screens to interactive prototypes and brand storytelling.';
}

class ColaTextBlock {
  const ColaTextBlock({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

class ColaColorSwatch {
  const ColaColorSwatch({
    required this.name,
    required this.hex,
    required this.color,
  });

  final String name;
  final String hex;
  final Color color;
}

class ColaIaNode {
  const ColaIaNode({
    required this.label,
    this.children = const [],
  });

  final String label;
  final List<String> children;
}
