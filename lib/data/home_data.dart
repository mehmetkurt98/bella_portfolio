/// Homepage content adapted from the Vercel / Next.js portfolio.
abstract final class HomeData {
  static const fullName = 'Bella Vahidoglu';
  static const role = 'Head of Design';
  static const hello = "HELLO, I'M BELLA";
  static const linkedInUrl =
      'https://www.linkedin.com/in/bella-vahidoglu-8b5a9850/';

  static const monogramAsset = 'assets/site/bella-monogram.png';
  static const heroPortraitAsset = 'assets/site/bella-white-shirt.png';

  static const heroHeadlineLead = "I'm a Head of Design,";
  static const heroHeadlineLine2 = 'product designer,';
  static const heroHeadlineLine3 = 'UX strategist';
  static const heroHeadlineAccent = '& brand builder.';

  static const heroIntro =
      'I turn complex ideas into products people understand, trust, and love.';

  static const heroDirection =
      'From UX strategy to creative direction and art direction, I shape '
      'the product, the system, and the story.';

  static const storyKicker = 'DESIGN WITH MEANING';
  static const storyLead = 'Every design carries a story.';
  static const storyTail =
      'I make that story clear, useful, and effortless for people to experience.';

  static const signals = <HomeSignal>[
    HomeSignal(value: '15+', label: 'YEARS OF DESIGN\nLEADERSHIP'),
    HomeSignal(value: '60+', label: 'GLOBAL DIGITAL\nEXPERIENCES'),
    HomeSignal(value: '0→1', label: 'PRODUCTS FROM\nSTRATEGY TO LAUNCH'),
    HomeSignal(value: '360°', label: 'PRODUCT · UX\nSYSTEMS · BRAND'),
  ];

  static const deliveredWork = <DeliveredWork>[
    DeliveredWork(
      title: 'UN Women',
      label: 'GLOBAL UX · PRODUCT DESIGN · DESIGN SYSTEMS',
      image: 'assets/site/unwomen-work-detail.png',
      intro:
          'Led UX strategy, product design, accessibility, and design-system '
          'direction across a complex global digital ecosystem.',
      scope:
          'Discovery, stakeholder alignment, information architecture, UX writing, '
          'prototyping, usability, accessible UI, Figma migration, and global UI '
          'components developed in line with UN Women policies, brand guidance, '
          'and accessibility standards.',
      result: '60+ global websites · 2 enterprise platforms · One scalable design language',
    ),
    DeliveredWork(
      title: 'FitLab Eats',
      label: 'HEAD OF DESIGN · PRODUCT DESIGN · BRAND · DESIGN SYSTEM',
      image: 'assets/site/fitlab-case.png',
      intro:
          'Built a new mobile health experience from a blank page—connecting '
          'product strategy, behavior, brand, and launch.',
      scope:
          'Product strategy, UX research, IA, prototyping, usability testing, UI, '
          'design system, brand identity, creative direction, and release readiness.',
      result: 'Android launched · iOS in progress',
    ),
    DeliveredWork(
      title: 'Pillox',
      label: 'HEAD OF DESIGN · PRODUCT DESIGN · BRAND · DESIGN SYSTEM',
      image: 'assets/site/pillox-ui.jpeg',
      intro:
          'Designed a medication reminder app that makes daily treatment routines '
          'feel clear, reassuring, and easy to manage.',
      scope:
          'Medication schedules, reminder flows, adherence journeys, information '
          'architecture, UX strategy, testing, UI design, design system, brand '
          'identity, and launch direction.',
      result: 'Designed and launched for iOS & Android',
    ),
    DeliveredWork(
      title: 'Consulate General of the Republic of Türkiye in New York',
      label: 'DIPLOMATIC MISSION · DIGITAL COMMUNICATIONS',
      image: 'assets/site/consulate-logo.png',
      intro:
          'Made public-facing information clearer and built trusted digital '
          'communication across a high-stakes diplomatic environment.',
      scope:
          'Digital communications, website content and updates, UX writing, '
          'stakeholder journeys, partnerships, and cross-cultural communication.',
      result:
          '11 years translating institutional complexity into clear public experiences',
      logoOnly: true,
    ),
  ];

  static const caseStudies = <HomeCaseStudy>[
    HomeCaseStudy(
      title: 'Style Me Zara',
      type: 'PERSONALIZED COMMERCE UX',
      image: 'assets/site/zara-case.png',
      copy:
          'A guided fashion experience designed to reduce decision fatigue and '
          'make discovery feel personal.',
      wide: true,
      projectId: 'zara',
    ),
    HomeCaseStudy(
      title: 'Apple Watch',
      type: 'WEARABLE INTERACTION',
      image: 'assets/site/apple-watch-case.png',
      copy:
          'A glanceable food-ordering flow designed for compact navigation, '
          'hierarchy, and touch.',
      projectId: 'yemeksepeti',
    ),
    HomeCaseStudy(
      title: 'Coca-Cola Lime',
      type: 'CAMPAIGN STORYTELLING',
      image: 'assets/site/coca-cola-case.png',
      copy:
          'A bold seasonal concept extending one product story across memorable '
          'digital touchpoints.',
      projectId: 'cola',
    ),
    HomeCaseStudy(
      title: 'Ordering Page',
      type: 'CHECKOUT & CONVERSION UX',
      image: 'assets/site/zara-purchase.png',
      copy:
          'A focused ordering flow designed to reduce friction, clarify decisions, '
          'and keep momentum through checkout.',
      projectId: 'purchase',
    ),
    HomeCaseStudy(
      title: 'Components',
      type: 'UI & DESIGN SYSTEMS',
      image: 'assets/site/zara-components.png',
      copy:
          'Reusable interface patterns that bring consistency, speed, and quality '
          'to product teams at scale.',
      projectId: 'zara',
    ),
  ];

  static const strategyQuestions = <FaqItem>[
    FaqItem(
      question: 'How do I define the right problem?',
      answer:
          'I start by separating symptoms from causes. I bring together user '
          'evidence, stakeholder knowledge, business goals, technical constraints, '
          'and existing data; then turn that complexity into a shared problem '
          'statement, clear success criteria, and the questions we still need to answer.',
    ),
    FaqItem(
      question: 'How do I structure the experience?',
      answer:
          'I map the complete journey before polishing screens. Tasks, content, '
          'decision points, edge cases, and system dependencies become an information '
          'architecture that feels logical to users and practical for the team to build. '
          'Navigation and hierarchy are tested against real goals—not personal preference.',
    ),
    FaqItem(
      question: 'How do insights become solutions?',
      answer:
          'I translate research into design hypotheses, explore multiple routes, and '
          'prototype at the lowest fidelity that can answer the next important question. '
          'I make trade-offs visible, align product and engineering early, and connect '
          'every design decision back to user value and business intent.',
    ),
    FaqItem(
      question: 'How do I test and improve the work?',
      answer:
          'I use usability sessions, task-based testing, accessibility checks, content '
          'reviews, and design QA throughout the process—not only at the end. Findings '
          'are prioritized by risk and impact, turned into iterations, and carried into '
          'post-launch feedback loops.',
    ),
    FaqItem(
      question: 'How do I make the system scale?',
      answer:
          'Patterns become reusable components, tokens, content rules, and documented '
          'behaviors. I define ownership and governance with the team so the system stays '
          'coherent as products, markets, and contributors grow.',
    ),
  ];

  static const brandCases = <BrandCase>[
    BrandCase(
      title: 'FitLab Eats',
      label: 'NAMING · STRATEGY · IDENTITY · PRODUCT LANGUAGE',
      logo: 'assets/site/fitlab-logo.png',
      intro: 'Healthy eating made simple, warm, and human.',
      body:
          'I shaped the brand from positioning to product expression: the optimistic '
          'heart symbol, an energetic food-led palette, approachable typography, tone '
          'of voice, and the visual rules that connect the app, campaigns, and everyday '
          'touchpoints.',
      ideaLabel: 'BRAND IDEA',
      idea: 'Care you can feel',
      principleLabel: 'DESIGN PRINCIPLE',
      principle: 'Bright, never clinical',
    ),
    BrandCase(
      title: 'Pillox',
      label: 'POSITIONING · LOGO SYSTEM · UX VOICE · PRODUCT BRAND',
      logo: 'assets/site/pillox-logo.png',
      intro: 'A medication reminder that reassures, not alarms.',
      body:
          'The pill and letterform become one recognizable product mark. A calm blue '
          'builds trust; a focused red creates urgency only where it matters. I connected '
          'the identity to reminder flows, adherence moments, notifications, and '
          'accessible UI states.',
      ideaLabel: 'BRAND IDEA',
      idea: 'Confidence, on time',
      principleLabel: 'VOICE',
      principle: 'Clear, calm, supportive',
    ),
    BrandCase(
      title: 'Happy Focus',
      label: 'STORYTELLING · CHARACTER LANGUAGE · ART DIRECTION',
      logo: 'assets/site/happyfocus-logo.png',
      intro: 'Focus practice reframed as a joyful adventure.',
      body:
          'I created a playful identity system with bold display type, reward-led '
          'symbols, expressive characters, and a high-energy purple-and-yellow world. '
          'The system gives product screens, activities, and communications one '
          'memorable visual voice.',
      ideaLabel: 'BRAND IDEA',
      idea: 'Small wins feel big',
      principleLabel: 'ART DIRECTION',
      principle: 'Playful, bold, encouraging',
    ),
  ];

  static const creativeItems = <CreativeItem>[
    CreativeItem(
      number: '01',
      title: 'UN Women',
      subtitle: 'Global digital direction',
      body:
          'Directed reusable UI components and editorial experiences globally, '
          'working within institutional policies, brand guidance, accessibility '
          'standards, and diverse regional needs.',
    ),
    CreativeItem(
      number: '02',
      title: 'Brand storytelling',
      subtitle: 'From positioning to expression',
      body:
          'Translate the central brand idea into a recognizable visual language '
          'across product, web, campaigns, content, and launch.',
    ),
    CreativeItem(
      number: '03',
      title: 'Social media',
      subtitle: 'Creative systems that stay consistent',
      body:
          'Build scalable content directions, templates, visual standards, and '
          'campaign narratives that preserve quality at publishing speed.',
    ),
  ];

  static const experience = <ExperienceItem>[
    ExperienceItem(
      years: '5+ YEARS',
      role: 'Principal Product Designer & Creative Design Lead',
      company: 'UN Women HQ',
      copy:
          'Directed global product experiences, enterprise design systems, '
          'accessibility standards, brand governance, and cross-functional delivery.',
    ),
    ExperienceItem(
      years: 'FREELANCE · NOW',
      role: 'Head of Design',
      company: 'FitLab Eats',
      copy:
          'Leading product strategy, UX research, IA, UX/UI, design systems, branding, '
          'creative direction, and cross-platform launch.',
    ),
    ExperienceItem(
      years: '10+ YEARS',
      role: 'Executive Officer',
      company:
          'Consulate General of the Republic of Türkiye in New York · Diplomatic Mission',
      copy:
          'Led digital communications, website content, UX writing, partnerships, '
          'and stakeholder-facing experiences.',
    ),
  ];

  static const aboutFacts = <AboutFact>[
    AboutFact(
      label: 'EDUCATION',
      title: "Master's in Visual Communication Design",
      detail: 'GPA 3.85 · 2023',
    ),
    AboutFact(
      label: 'DESIGN LEADERSHIP',
      title: '15+ years across product, UX, systems, and brand',
      detail: 'Global teams · Cross-functional delivery',
    ),
    AboutFact(
      label: 'CREATIVE PRACTICE',
      title: 'Creative direction, art direction & social media',
      detail: 'Digital products · Brand systems · Campaign storytelling',
    ),
  ];

  static const tools = <String>[
    'Figma',
    'FigJam',
    'Adobe Creative Suite',
    'Adobe XD',
    'Sketch',
    'Illustrator',
    'Zeplin',
    'Claude',
    'Cursor',
    'ChatGPT',
    'Gemini',
    'Midjourney',
    'Figma AI',
  ];

  static const aboutQuestions = <FaqItem>[
    FaqItem(
      question: 'What do I bring as a Head of Design?',
      answer:
          'I connect product strategy, UX, visual systems, brand, and delivery. I set '
          'a clear quality bar, create the conditions for strong collaboration, and stay '
          'close enough to the craft to turn direction into work people can actually use.',
    ),
    FaqItem(
      question: 'How do I lead product design?',
      answer:
          'I stay hands-on from discovery and product framing through flows, prototyping, '
          'interface systems, design QA, and launch. I connect user value, business goals, '
          'and delivery realities without lowering the craft bar.',
    ),
    FaqItem(
      question: 'How do branding and social media connect?',
      answer:
          'I build the brand as a living system—not a standalone logo. Positioning, '
          'identity, art direction, product language, campaign storytelling, and social '
          'media creative direction work together so every touchpoint feels unmistakably '
          'connected.',
    ),
    FaqItem(
      question: 'How do I lead teams and stakeholders?',
      answer:
          'I make decisions and expectations visible. I align people around the user '
          'problem, give direct and constructive feedback, mentor designers, and translate '
          'between product, engineering, communications, leadership, and external partners.',
    ),
    FaqItem(
      question: 'How do I use AI in my design practice?',
      answer:
          'I use AI to accelerate research synthesis, concept exploration, prototyping, '
          'content, and production. The tools increase speed; design judgment, accessibility, '
          'ethics, and the final quality bar remain human.',
    ),
  ];

  static const leadershipItems = <LeadershipItem>[
    LeadershipItem(
      label: 'HEAD OF DESIGN',
      body: 'Vision, teams, standards, and delivery',
    ),
    LeadershipItem(
      label: 'PRODUCT & UX',
      body: 'Research, strategy, systems, and launch',
    ),
    LeadershipItem(
      label: 'BRAND & CREATIVE',
      body: 'Identity, art direction, storytelling, and social',
    ),
  ];
}

class HomeSignal {
  const HomeSignal({required this.value, required this.label});
  final String value;
  final String label;
}

class DeliveredWork {
  const DeliveredWork({
    required this.title,
    required this.label,
    required this.image,
    required this.intro,
    required this.scope,
    required this.result,
    this.logoOnly = false,
  });

  final String title;
  final String label;
  final String image;
  final String intro;
  final String scope;
  final String result;
  final bool logoOnly;
}

class HomeCaseStudy {
  const HomeCaseStudy({
    required this.title,
    required this.type,
    required this.image,
    required this.copy,
    this.wide = false,
    this.projectId,
  });

  final String title;
  final String type;
  final String image;
  final String copy;
  final bool wide;
  final String? projectId;
}

class FaqItem {
  const FaqItem({required this.question, required this.answer});
  final String question;
  final String answer;
}

class BrandCase {
  const BrandCase({
    required this.title,
    required this.label,
    required this.logo,
    required this.intro,
    required this.body,
    required this.ideaLabel,
    required this.idea,
    required this.principleLabel,
    required this.principle,
  });

  final String title;
  final String label;
  final String logo;
  final String intro;
  final String body;
  final String ideaLabel;
  final String idea;
  final String principleLabel;
  final String principle;
}

class CreativeItem {
  const CreativeItem({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.body,
  });

  final String number;
  final String title;
  final String subtitle;
  final String body;
}

class ExperienceItem {
  const ExperienceItem({
    required this.years,
    required this.role,
    required this.company,
    required this.copy,
  });

  final String years;
  final String role;
  final String company;
  final String copy;
}

class AboutFact {
  const AboutFact({
    required this.label,
    required this.title,
    required this.detail,
  });

  final String label;
  final String title;
  final String detail;
}

class LeadershipItem {
  const LeadershipItem({required this.label, required this.body});
  final String label;
  final String body;
}
