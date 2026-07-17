import '../models/portfolio_category.dart';
import '../models/portfolio_item.dart';

abstract final class SampleData {
  static const ownerName = 'Bella';
  static const tagline = 'Principal Product Designer';
  static const heroTitle = 'Selected Works 2026';
  static const heroSubtitle = 'Crafted with precision, emotion, and intent.';
  static const heroImage =
      'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=2400&q=80';
  static const email = 'hello@bellaportfolio.com';

  static const featuredWorks = <PortfolioItem>[
    PortfolioItem(
      title: 'Coca-Cola Lime',
      category: 'UI/UX',
      year: '2026',
      imageAsset: 'assets/projects/cola/cola1.png',
      description:
          'Redesigning Coca-Cola Lime\'s order page for a seamless pre-order experience.',
      projectId: 'cola',
    ),
    PortfolioItem(
      title: 'Style Me Zara!',
      category: 'UI/UX',
      year: '2026',
      imageAsset: 'assets/projects/zara/zara1.png',
      description:
          'Personalized shopping experience reducing decision fatigue through GUIDE.',
      projectId: 'zara',
    ),
    PortfolioItem(
      title: 'Aurora Brand Identity',
      category: 'Branding',
      year: '2026',
      imageUrl:
          'https://images.unsplash.com/photo-1561070791-2526d30994b5?auto=format&fit=crop&w=1200&q=80',
      description:
          'A refined visual system for a contemporary lifestyle label.',
      projectUrl: 'https://example.com',
    ),
    PortfolioItem(
      title: 'Monolith E-Commerce',
      category: 'UI/UX',
      year: '2025',
      imageUrl:
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1200&q=80',
      description:
          'Luxury shopping experience with editorial layout and motion.',
      projectUrl: 'https://example.com',
    ),
    PortfolioItem(
      title: 'Noir Editorial Platform',
      category: 'Development',
      year: '2025',
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=1200&q=80',
      description:
          'Minimal publishing platform built for high-impact storytelling.',
      projectUrl: 'https://example.com',
    ),
    PortfolioItem(
      title: 'Velvet Motion System',
      category: 'Motion',
      year: '2024',
      imageUrl:
          'https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=1200&q=80',
      description:
          'Cinematic transitions and interaction patterns for digital products.',
      projectUrl: 'https://example.com',
    ),
    PortfolioItem(
      title: 'Atelier Portfolio',
      category: 'UI/UX',
      year: '2024',
      imageUrl:
          'https://images.unsplash.com/photo-1507238691740-1872ebd51d16?auto=format&fit=crop&w=1200&q=80',
      description:
          'An immersive portfolio experience for a multidisciplinary studio.',
      projectUrl: 'https://example.com',
    ),
  ];

  static const categories = <PortfolioCategory>[
    PortfolioCategory(
      title: 'UI / UX',
      imageUrl:
          'https://images.unsplash.com/photo-1558655146-9f40138edfeb?auto=format&fit=crop&w=1200&q=80',
      projectCount: 12,
    ),
    PortfolioCategory(
      title: 'Development',
      imageUrl:
          'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=1200&q=80',
      projectCount: 9,
    ),
    PortfolioCategory(
      title: 'Branding',
      imageUrl:
          'https://images.unsplash.com/photo-1626785774573-4b799314346d?auto=format&fit=crop&w=1200&q=80',
      projectCount: 7,
    ),
  ];

  static const aboutText =
      'I create refined digital experiences where design, technology, and narrative '
      'meet. My work is guided by clarity, restraint, and a deep respect for craft — '
      'the same principles that define the world\'s most iconic luxury houses.';

  static const socialLinks = <String, String>{
    'GitHub': 'https://github.com',
    'LinkedIn': 'https://linkedin.com',
    'Dribbble': 'https://dribbble.com',
  };
}
