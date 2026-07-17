import 'package:flutter/material.dart';

abstract final class ZaraProjectData {
  static const title = 'Style Me Zara!';
  static const subtitle =
      'Redesigning Personalized Shopping Experiences Tailored to You, by GUIDE.';
  static const description =
      'A personalized shopping experience designed to reduce decision fatigue '
      'and improve engagement, validated through A/B testing.';
  static const heroImage = 'assets/projects/zara/zara1.png';

  static const overviewTitle = 'STYLE ME ZARA!';
  static const overviewIntro =
      'This project transformed Zara\'s online shopping experience by identifying key '
      'user desires and creating a personalized styling platform that seamlessly '
      'integrated into the shopping process. By conducting user surveys and analyzing '
      'shopping behaviors, we pinpointed the need for fashion guidance that resonates '
      'with individual style preferences. The goal was to create a more engaging and '
      'tailored experience, improving user satisfaction by offering personalized outfit '
      'recommendations based on their tastes and fashion trends. This solution not only '
      'enhanced the customer journey but also fostered stronger brand loyalty.';

  static const backgroundCards = <ZaraBackgroundCard>[
    ZaraBackgroundCard(
      title: 'Focus',
      body:
          'Personalizing the shopping experience by accurately identifying user preferences.',
      left: 165,
      top: 483,
      width: 289,
      height: 267,
      borderColor: Color(0xFFE9E241),
      gradientColors: [
        Color(0xFFFFFFFF),
        Color(0xFFB2C0D7),
      ],
    ),
    ZaraBackgroundCard(
      title: 'Approach',
      body:
          'Designed a survey to collect key details about users\' tastes, body type, '
          'and style preferences.\n\n'
          'Once preferences were identified, Zara\'s online store displayed curated '
          'style options that matched the user\'s profile.',
      left: 437,
      top: 376,
      width: 327,
      height: 346,
      borderColor: Color(0xFFB1BFD7),
      gradientColors: [
        Color(0xFFFFFFFF),
        Color(0xFFD5DAE3),
        Color(0xFFE4E9F1),
        Color(0xFFACBBD4),
      ],
    ),
    ZaraBackgroundCard(
      title: 'Goal',
      body:
          'Help users discover their preferred style by using tailored survey questions '
          'and offering personalized style options.',
      left: 322,
      top: 649,
      width: 273,
      height: 300,
      borderColor: Color(0xFFB1BFD7),
      gradientColors: [
        Color(0xFFFFFFFF),
        Color(0xFFD5DAE3),
        Color(0xFFE4E9F1),
        Color(0xFFACBBD4),
      ],
    ),
    ZaraBackgroundCard(
      title: 'Outcome',
      body:
          'Enhanced user satisfaction by offering a tailored and relevant shopping '
          'experience that reflected their unique style.',
      left: 559,
      top: 719,
      width: 280,
      height: 302,
      borderColor: Color(0xFFB1BFD7),
      gradientColors: [
        Color(0xFFFFFFFF),
        Color(0xFFD5DAE3),
        Color(0xFFE4E9F1),
        Color(0xFFACBBD4),
      ],
    ),
  ];

  static const challengeBullets = <String>[
    'The primary challenge was to create an accurate and efficient method of '
        'identifying users\' style preferences through targeted survey questions.',
    'Another key challenge was developing a system that allowed users to receive '
        'quick and relevant styling options for specific items selected from Zara\'s '
        'store, while ensuring the process was intuitive and seamless.',
  ];

  static const challengeCards = <ZaraChallengeCard>[
    ZaraChallengeCard(
      title: 'Focus',
      body: 'Creating a personalized styling experience for users.',
      left: 21,
      top: 92,
      width: 248,
      height: 169,
    ),
    ZaraChallengeCard(
      title: 'Approach:',
      body:
          '• Followed a user-centric process leveraging data to identify preferences.\n\n'
          '• Delivered quick, intuitive outfit suggestions.\n\n'
          '• Provided seamless styling assistance with curated looks based on item selection.',
      left: 300,
      top: 0,
      width: 270,
      height: 420,
    ),
    ZaraChallengeCard(
      title: 'Outcome',
      body:
          'Increased user engagement and satisfaction with personalized '
          'recommendations, leading to quicker decision-making and improved '
          'conversion rates.',
      left: 80,
      top: 300,
      width: 270,
      height: 260,
    ),
  ];

  static const projectDetailGroups = <ZaraProjectDetailGroup>[
    ZaraProjectDetailGroup(
      label: 'Role',
      cards: [
        ZaraProjectDetailCard(body: 'Lead UX and UI Designer'),
        ZaraProjectDetailCard(
          body:
              'Responsible for all UX and UI design, from ideation to execution, '
              'with no team involvement.',
        ),
      ],
    ),
    ZaraProjectDetailGroup(
      label: 'Timeframe',
      cards: [
        ZaraProjectDetailCard(
          body:
              'Concept Development: 3 weeks\n'
              'Wire-framing & Prototyping: 6 weeks\n'
              '(240 wireframes in total)',
          boldParts: ['6 weeks', '240'],
        ),
        ZaraProjectDetailCard(
          body: 'Final Adjustments & Testing: 3 weeks',
        ),
      ],
    ),
    ZaraProjectDetailGroup(
      label: 'Project Overview',
      cards: [
        ZaraProjectDetailCard(
          body:
              'Designed a total of 240 wireframes: 80 for iPhone 15 Plus, '
              '80 for iPhone 14, and 80 for Android platforms.',
          boldParts: ['240'],
        ),
        ZaraProjectDetailCard(
          body:
              'Completed all UX and UI design, including concept creation '
              'and adaptation, within 3 months.',
          boldParts: ['within 3 months'],
        ),
      ],
    ),
  ];

  static const valuesIntro =
      'At Style Your Items, we are committed to fostering creativity, '
      'personalization, and innovation. Our values guide every design decision, '
      'ensuring that each user experiences a unique and tailored shopping journey.';

  static const valueCards = <ZaraValueCard>[
    ZaraValueCard(
      title: 'Customer-Centric Design',
      body:
          'I centered the design around user preferences, ensuring that every '
          'interaction felt personalized and tailored to the individual\'s fashion sense.',
    ),
    ZaraValueCard(
      title: 'Innovation',
      body:
          'I introduced a creative styling tool that allowed users to mix and '
          'match items, giving them more control over their fashion choices.',
    ),
    ZaraValueCard(
      title: 'Data-Driven Decisions',
      body:
          'User feedback and data informed each stage of the design, ensuring '
          'the solution was both relevant and effective.',
    ),
    ZaraValueCard(
      title: 'Simplicity & Accessibility',
      body:
          'The tool was designed to be intuitive and easy to use, ensuring that '
          'users can navigate and utilize it with minimal effort, simplifying '
          'the styling process.',
    ),
    ZaraValueCard(
      title: 'Aesthetic Excellence',
      body:
          'The final design aligned with Zara\'s modern and sleek brand identity '
          'while providing a seamless and enjoyable user experience.',
    ),
    ZaraValueCard(
      title: 'Accessibility',
      body:
          'The tool was crafted with inclusivity in mind, making it accessible '
          'to users of all abilities, ensuring that everyone can benefit from '
          'the simplified styling process.',
    ),
  ];

  static const blueprintColumns = <String>[
    'PROCESS',
    'USER LOGIN AND ACCOUNT MANAGEMENT',
    'DEFINING STYLE',
    'PRODUCT SELECTION',
    'PURCHASE',
    'FEEDBACK AND IMPROVEMENT',
    'DATA ANALYSIS AND MANAGEMENT',
  ];

  static const blueprintRows = <ZaraBlueprintRow>[
    ZaraBlueprintRow(
      label: 'OPERATIONS',
      cells: [
        'Sign Up, Username, Password, E-mail',
        'Survey Questions',
        'Search, Style Recommendations, Explore Product',
        'Add to Cart, Bank and Payment Options',
        'Feedback Survey',
        'Analysis Using Web Applications',
      ],
    ),
    ZaraBlueprintRow(
      label: 'ACTOR / ROLE',
      cells: [
        'User',
        'Artificial Intelligence',
        'User',
        'User',
        'User',
        'User',
      ],
    ),
    ZaraBlueprintRow(
      label: 'TOOLS AND EQUIPMENT',
      cells: [
        'Computer, Tablet, Phone',
        'Computer, Tablet, Phone',
        'Store, Computer, Tablet, Phone',
        'Store, Computer, Tablet, Phone',
        'Computer, Tablet, Phone',
        'Computer, Tablet, Phone',
      ],
    ),
    ZaraBlueprintRow(
      label: 'ENVIRONMENT',
      cells: [
        'Mobile Application, Online Store, Website',
        'Mobile Application, Online Store, Website',
        'Online Store, Website',
        'Store, Mobile Application, Online Store, Website',
        'Website',
        'Analysis Using Web Applications',
      ],
    ),
    ZaraBlueprintRow(
      label: 'STAKEHOLDER',
      cells: [
        'Zara customer',
        'Consultants',
        'Sales Representatives',
        'Purchase in-store - seller, Customer Bank',
        'Mobile and Web Development Team',
        'Customer Service Team',
      ],
    ),
    ZaraBlueprintRow(
      label: 'RISK',
      cells: [
        'Security Risks: Compromised user information jeopardizing user experience',
        'Style recommendations not matching the person\'s body type and preferences',
        'Discover Your Style and Zara\'s Exploration providing the same style recommendations',
        'Not converting sales based on the provided recommendations',
        'Survey questions not yielding realistic results in determining people\'s preferences',
        'Failure to implement updates based on the feedback received',
      ],
    ),
  ];

  static const swotCards = <ZaraSwotCard>[
    ZaraSwotCard(
      title: 'STRENGTHS (S)',
      borderColor: Color(0xFF4CAF50),
      points: [
        'Personalized shopping experience tailored to users\' needs and preferences.',
        'Customized product recommendations based on personal choices.',
        'Unique shopping process with diverse combinations enhances user satisfaction.',
      ],
    ),
    ZaraSwotCard(
      title: 'WEAKNESSES (W)',
      borderColor: Color(0xFFE57373),
      points: [
        'Dependency on accurate user data for effective personalization.',
        'Need for continuous updates and improvements to maintain relevance.',
        'Potential complexity in managing diverse user preferences and choices.',
      ],
    ),
    ZaraSwotCard(
      title: 'OPPORTUNITIES (O)',
      borderColor: Color(0xFF42A5F5),
      points: [
        'Expanding market reach by attracting fashion-conscious consumers globally.',
        'Leveraging data analytics for further personalization and customer insights.',
        'Introducing innovative features to differentiate from competitors.',
      ],
    ),
    ZaraSwotCard(
      title: 'THREATS (T)',
      borderColor: Color(0xFFFBC02D),
      points: [
        'Intense competition from established and emerging fashion brands.',
        'Privacy concerns and data security risks associated with personalization.',
        'Economic uncertainties impacting consumer spending habits.',
      ],
    ),
  ];

  static const iaBranches = <ZaraIaBranch>[
    ZaraIaBranch(
      nodes: [
        'Home',
        'New',
        'Reveries Zara Studio',
        'Join Life',
        'Join Our Newsletter',
      ],
    ),
    ZaraIaBranch(
      nodes: [
        'Menu',
        'Women',
        'Man',
        'Kids',
        'Home',
        'Perfumes',
      ],
    ),
    ZaraIaBranch(
      nodes: [
        'Guide',
        'Style your item',
        'Style me Zara',
        'Choose your item',
        'Survey',
        'Style Options',
        'Purchase',
      ],
    ),
    ZaraIaBranch(
      nodes: [
        'Bag',
        'Shopping Bag',
        'Purchase',
      ],
    ),
  ];

  static const iaCheckoutNodes = <String>[
    'Create an account / Log in',
    'Continue as a guest',
  ];

  static const itemTitle = 'ITEM';
  static const itemDescription =
      'The interface reflects the brand\'s modern and elegant aesthetic. '
      'Its clean lines and refined visual language reinforce Zara\'s commitment '
      'to stylish and functional design.';

  static const designSystemIntro =
      'Inter was chosen for its modern and elegant aesthetic. Its clean lines '
      'and high readability reflect Zara\'s commitment to stylish and functional design.';

  static const typographySpecs = <ZaraTypeSpec>[
    ZaraTypeSpec(label: 'Title/Header 1', weightLabel: 'Medium', size: 20, weight: FontWeight.w500),
    ZaraTypeSpec(label: 'Title/Header 2', weightLabel: 'Medium', size: 18, weight: FontWeight.w500),
    ZaraTypeSpec(label: 'Title/Header 3', weightLabel: 'Regular', size: 18, weight: FontWeight.w400),
    ZaraTypeSpec(label: 'Body Text', weightLabel: 'Regular', size: 16, weight: FontWeight.w400),
    ZaraTypeSpec(label: 'Small Text', weightLabel: 'Medium', size: 14, weight: FontWeight.w500),
    ZaraTypeSpec(label: 'Button Text', weightLabel: 'Medium', size: 18, weight: FontWeight.w500),
  ];

  static const interSamples = <ZaraInterSample>[
    ZaraInterSample(label: 'Regular', weight: FontWeight.w400),
    ZaraInterSample(label: 'Medium', weight: FontWeight.w500),
    ZaraInterSample(label: 'Bold', weight: FontWeight.w700),
    ZaraInterSample(label: 'Light', weight: FontWeight.w300),
    ZaraInterSample(label: 'Regular', weight: FontWeight.w400),
    ZaraInterSample(label: 'Medium', weight: FontWeight.w500),
    ZaraInterSample(label: 'Bold', weight: FontWeight.w700),
  ];

  static const colorSystemIntro =
      'The black, white, and gray color palette in the Zara redesign creates a '
      'minimalist, elegant, and modern aesthetic that aligns with Zara\'s '
      'sophisticated brand identity.';

  static const primaryColors = <ZaraColorSwatch>[
    ZaraColorSwatch(
      name: 'WHITE',
      hexLabel: 'FFFFFF',
      color: Color(0xFFFFFFFF),
      labelColor: Color(0xFF3E5375),
    ),
    ZaraColorSwatch(
      name: 'WHITE',
      hexLabel: 'FFFFFF 70%',
      color: Color(0xB3FFFFFF),
      displayColor: Color(0xFFB8B8B8),
      labelColor: Color(0xFF3E5375),
    ),
    ZaraColorSwatch(
      name: 'BLACK',
      hexLabel: '000000',
      color: Color(0xFF000000),
      labelColor: Color(0xFF3E5375),
    ),
    ZaraColorSwatch(
      name: 'BLACK',
      hexLabel: '000000 50%',
      color: Color(0x80000000),
      displayColor: Color(0xFF808080),
      labelColor: Color(0xFF3E5375),
    ),
  ];

  static const secondaryColors = <ZaraColorSwatch>[
    ZaraColorSwatch(
      name: 'GRAY',
      hexLabel: '979797',
      color: Color(0xFF979797),
      labelColor: Color(0xFF3E5375),
    ),
    ZaraColorSwatch(
      name: 'GRAY',
      hexLabel: 'E5E5E5',
      color: Color(0xFFE5E5E5),
      labelColor: Color(0xFF3E5375),
    ),
    ZaraColorSwatch(
      name: 'PINK',
      hexLabel: 'F57191',
      color: Color(0xFFF57191),
      labelColor: Color(0xFF3E5375),
    ),
    ZaraColorSwatch(
      name: 'GOLD',
      hexLabel: 'FFD700',
      color: Color(0xFFFFD700),
      labelColor: Color(0xFF3E5375),
    ),
  ];

  static const personas = <ZaraPersona>[
    ZaraPersona(
      title: 'Style-Conscious Teenager Sarah',
      imageAsset: 'assets/projects/zara/zara2.png',
      layout: ZaraPersonaLayout.horizontal,
      cardWidth: 596,
      cardHeight: 459,
      imageWidth: 240,
      imageHeight: 320,
      demographics: 'Female, 16-20, active on social media.',
      behavior:
          'Follows influencers, emulates fashion trends, values peer validation.',
      needs:
          'Wants trendy outfits that appeal to her social circle and are Instagram-worthy.',
    ),
    ZaraPersona(
      title: 'Fashion-Curious College Student Alex',
      imageAsset: 'assets/projects/zara/zara4.png',
      layout: ZaraPersonaLayout.vertical,
      cardWidth: 475,
      cardHeight: 683,
      imageWidth: 420,
      imageHeight: 320,
      demographics: 'Non-binary, 18-25, university student.',
      behavior: 'Explores fashion styles, experiments with new looks.',
      needs:
          'Trendy outfits for evolving style. Values self-expression and inclusivity.',
    ),
    ZaraPersona(
      title: 'Practical and Budget-Conscious Family Mom Linda',
      imageAsset: 'assets/projects/zara/zara3.png',
      layout: ZaraPersonaLayout.horizontal,
      cardWidth: 596,
      cardHeight: 459,
      imageWidth: 240,
      imageHeight: 320,
      demographics: 'Female, 35-50, with children.',
      behavior:
          'Shops for quality and longevity. Values versatile pieces for various occasions.',
      needs:
          'Functional, stylish outfits that transition from casual to formal. '
          'Appreciates casual styling tips for a busy lifestyle.',
    ),
    ZaraPersona(
      title: 'Fashion Enthusiast Emily',
      imageAsset: 'assets/projects/zara/zara5.png',
      layout: ZaraPersonaLayout.vertical,
      cardWidth: 475,
      cardHeight: 670,
      imageWidth: 420,
      imageHeight: 360,
      demographics: 'Female, 25-35, urban dweller.',
      behavior:
          'Loves exploring new fashion trends, often overwhelmed by choices.',
      needs:
          'Personalized recommendations to mix and match Zara items for unique, '
          'trendy looks.',
    ),
    ZaraPersona(
      title: 'Busy Professional Mark',
      imageAsset: 'assets/projects/zara/zara7.png',
      layout: ZaraPersonaLayout.horizontal,
      cardWidth: 591,
      cardHeight: 451,
      imageWidth: 240,
      imageHeight: 320,
      demographics: 'Male, 30-45, career-oriented.',
      behavior: 'Prefers a streamlined shopping experience.',
      needs:
          'Quick access to curated outfits for work and social occasions. '
          'Values time efficiency and convenience.',
    ),
    ZaraPersona(
      title: 'Sophisticated Trendsetter James',
      imageAsset: 'assets/projects/zara/zara6.png',
      layout: ZaraPersonaLayout.horizontal,
      cardWidth: 593,
      cardHeight: 437,
      imageWidth: 266,
      imageHeight: 348,
      demographics: 'Male, 20-40, professional in a creative industry.',
      behavior: 'Values high-quality, statement pieces.',
      needs:
          'Personalized styling advice for standout pieces. Mixes classic and '
          'contemporary styles for a polished look.',
    ),
  ];

  static const developParagraphs = <String>[
    'In the develop stage of the Style Me Zara project, I focused on creating and '
        'refining design concepts and prototypes. Drawing from the insights gathered '
        'in earlier stages, I developed wireframes and mockups to visualize the '
        'personalized styling platform. Working independently, I built 240 wireframes '
        'across iPhone 15, iPhone 14, and Android platforms, ensuring consistency and '
        'functionality across all devices.',
    'I continually tested and iterated on the prototypes, adjusting the user '
        'experience to align with style preferences and making sure that the design '
        'was both intuitive and responsive. Each prototype was meticulously refined '
        'to enhance the personalized outfit recommendations, ensuring a seamless and '
        'engaging user journey.',
  ];

  static const deliverHeroImage = 'assets/projects/zara/zara8.png';

  static const deliverScreens = <String>[
    'assets/projects/zara/zara9.png',
    'assets/projects/zara/zara10.png',
    'assets/projects/zara/zara11.png',
    'assets/projects/zara/zara12.png',
  ];
}

enum ZaraPersonaLayout { horizontal, vertical }

class ZaraPersona {
  const ZaraPersona({
    required this.title,
    required this.imageAsset,
    required this.layout,
    required this.cardWidth,
    required this.cardHeight,
    required this.imageWidth,
    required this.imageHeight,
    required this.demographics,
    required this.behavior,
    required this.needs,
  });

  final String title;
  final String imageAsset;
  final ZaraPersonaLayout layout;
  final double cardWidth;
  final double cardHeight;
  final double imageWidth;
  final double imageHeight;
  final String demographics;
  final String behavior;
  final String needs;
}

class ZaraColorSwatch {
  const ZaraColorSwatch({
    required this.name,
    required this.hexLabel,
    required this.color,
    required this.labelColor,
    this.displayColor,
  });

  final String name;
  final String hexLabel;
  final Color color;
  final Color labelColor;
  final Color? displayColor;
}

class ZaraTypeSpec {
  const ZaraTypeSpec({
    required this.label,
    required this.weightLabel,
    required this.size,
    required this.weight,
  });

  final String label;
  final String weightLabel;
  final double size;
  final FontWeight weight;
}

class ZaraInterSample {
  const ZaraInterSample({
    required this.label,
    required this.weight,
  });

  final String label;
  final FontWeight weight;
}

class ZaraIaBranch {
  const ZaraIaBranch({required this.nodes});

  final List<String> nodes;
}

class ZaraSwotCard {
  const ZaraSwotCard({
    required this.title,
    required this.borderColor,
    required this.points,
  });

  final String title;
  final Color borderColor;
  final List<String> points;
}

class ZaraBlueprintRow {
  const ZaraBlueprintRow({
    required this.label,
    required this.cells,
  });

  final String label;
  final List<String> cells;
}

class ZaraValueCard {
  const ZaraValueCard({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

class ZaraProjectDetailGroup {
  const ZaraProjectDetailGroup({
    required this.label,
    required this.cards,
  });

  final String label;
  final List<ZaraProjectDetailCard> cards;
}

class ZaraProjectDetailCard {
  const ZaraProjectDetailCard({
    required this.body,
    this.boldParts = const [],
  });

  final String body;
  final List<String> boldParts;
}

class ZaraChallengeCard {
  const ZaraChallengeCard({
    required this.title,
    required this.body,
    this.left = 0,
    this.top = 0,
    this.width = 280,
    this.height = 220,
  });

  final String title;
  final String body;
  final double left;
  final double top;
  final double width;
  final double height;
}

class ZaraBackgroundCard {
  const ZaraBackgroundCard({
    required this.title,
    required this.body,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.gradientColors,
  });

  final String title;
  final String body;
  final double left;
  final double top;
  final double width;
  final double height;
  final Color borderColor;
  final List<Color> gradientColors;
}
