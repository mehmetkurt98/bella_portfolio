import 'package:flutter/material.dart';

/// Editable About section content.
/// Update these fields to change the About page without touching layout code.
abstract final class AboutData {
  static const portraitAsset = 'assets/about/portrait.png';
  static const boardAsset = 'assets/about/about_board.png';
  static const logoAsset = 'assets/about/bv_logo.png';

  static const aboutTitle = 'ABOUT ME';
  static const aboutBody =
      'I\'m Bella Vahidoglu, a Design & Strategy Lead with a deep passion for '
      'creating bold, user-centered designs that make a real impact. My work at '
      'the United Nations fuels my dedication to human rights and inspires me to '
      'bring a sense of purpose to every project. I find creativity in the world '
      'around me—whether it\'s through my love for art, nature, or positive energy. '
      'Traveling and exploring different cultures continuously broaden my '
      'perspective, while my connection to the earth and oceans keeps me grounded. '
      'As a former swimmer, I approach my work with focus, energy, and a dynamic '
      'spirit. Each design I create is an opportunity to blend innovation with a '
      'deeper human connection, making my work both meaningful and transformative.';

  static const educationTitle = 'EDUCATION';
  static const educationLines = <String>[
    'Master\'s In',
    'Visual Communication Design',
  ];

  static const skillsTitle = 'SKILLS';
  static const skills = <AboutSkill>[
    AboutSkill(name: 'Figma', color: Color(0xFFF24E1E)),
    AboutSkill(name: 'Adobe XD', color: Color(0xFFFF61F6)),
    AboutSkill(name: 'Illustrator', color: Color(0xFFFF9A00)),
    AboutSkill(name: 'Principle', color: Color(0xFF000000)),
    AboutSkill(name: 'Photoshop', color: Color(0xFF31A8FF)),
    AboutSkill(name: 'Zeplin', color: Color(0xFFFDBD39)),
    AboutSkill(name: 'Sketch', color: Color(0xFFFDAD00)),
    AboutSkill(name: 'InVision', color: Color(0xFFFF3366)),
  ];

  static const contactTitle = 'CONTACT';
  static const linkedInLabel =
      'https://www.linkedin.com/in/bella-vahidoglu-8b5a9850/';
  static const linkedInUrl =
      'https://www.linkedin.com/in/bella-vahidoglu-8b5a9850/';

  static const bestTitle = 'BEST IN THE FIELD';
  static const bestParagraphs = <AboutParagraph>[
    AboutParagraph(
      text:
          'Revolutionary leader with a unique blend of strategic vision and '
          'creative prowess. Over 15 years of transforming diverse sectors, from '
          'diplomacy to design, through innovative UI/UX solutions and dynamic '
          'project management. Renowned for pioneering groundbreaking '
          'initiatives, optimizing resources for maximum impact, and setting new '
          'industry benchmarks.',
      boldParts: ['15 years'],
    ),
    AboutParagraph(
      text:
          'My proven track record of delivering exceptional results and forging '
          'influential partnerships showcases a commitment to excellence and a '
          'passion for driving transformative change.',
    ),
  ];
}

class AboutSkill {
  const AboutSkill({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}

class AboutParagraph {
  const AboutParagraph({
    required this.text,
    this.boldParts = const [],
  });

  final String text;
  final List<String> boldParts;
}
