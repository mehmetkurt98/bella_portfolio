/// Homepage content adapted from the Vercel / Next.js portfolio.
abstract final class HomeData {
  static const fullName = 'Bella Vahidoglu';
  static const role = 'Head of Design';
  static const hello = "HELLO, I'M BELLA";
  static const linkedInUrl =
      'https://www.linkedin.com/in/bella-vahidoglu-8b5a9850/';

  static const monogramAsset = 'assets/site/bella-monogram.webp';
  static const heroPortraitAsset = 'assets/site/bella-white-shirt.webp';

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
      image: 'assets/site/unwomen-work-detail.webp',
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
      image: 'assets/site/fitlab-case.webp',
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
      image: 'assets/site/pillox-ui.webp',
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
      image: '',
      intro:
          'Made public-facing information clearer and built trusted digital '
          'communication across a high-stakes diplomatic environment.',
      scope:
          'Digital communications, website content and updates, UX writing, '
          'stakeholder journeys, partnerships, and cross-cultural communication.',
      result:
          '11 years translating institutional complexity into clear public experiences',
      textOnly: true,
    ),
  ];

  static const caseStudies = <HomeCaseStudy>[
    HomeCaseStudy(
      title: 'Style Me Zara!',
      type: 'PERSONALIZED COMMERCE UX',
      image: 'assets/site/zara-guide-cover.webp',
      headline: 'Redesigning Personalized Shopping Experiences',
      subline: 'Tailored to You, by GUIDE.',
      keyword: 'PERSONAL',
      projectId: 'zara',
      details: [
        CaseDetail(
          label: '01 / CHALLENGE',
          title: 'Make fashion discovery feel personal.',
          copy:
              'Reduce decision fatigue while helping people move from inspiration '
              'to a confident choice.',
        ),
        CaseDetail(
          label: '02 / DESIGN DIRECTION',
          title: 'One guide, two clear paths.',
          copy:
              'Users can style an existing item or discover a look shaped around '
              'their individual preferences.',
        ),
        CaseDetail(
          label: '03 / VALUE',
          title: 'Clarity without losing aspiration.',
          copy:
              'A minimal commerce experience balances editorial storytelling, '
              'guidance, and fast navigation.',
        ),
      ],
    ),
    HomeCaseStudy(
      title: 'A Bite Away, Anytime!',
      type: 'YEMEKSEPETI · APPLE WATCH',
      image: 'assets/site/apple-watch-wrist.webp',
      headline: 'Food delivery, reimagined for your wrist.',
      subline: 'Faster, simpler, and always within reach.',
      keyword: 'CONVENIENCE',
      projectId: 'yemeksepeti',
      details: [
        CaseDetail(
          label: '01 / CHALLENGE',
          title: 'Bring ordering into a glanceable format.',
          copy:
              'Translate a multi-step food delivery journey into focused decisions '
              'that work on a compact screen.',
        ),
        CaseDetail(
          label: '02 / INTERACTION',
          title: 'Designed for quick, confident actions.',
          copy:
              'Clear hierarchy, wrist-friendly touch targets, and real-time order '
              'updates keep every interaction effortless.',
        ),
        CaseDetail(
          label: '03 / EXPERIENCE',
          title: 'Convenience that moves with you.',
          copy:
              'Favorite meals, essential choices, and delivery status stay '
              'accessible anytime and anywhere.',
        ),
      ],
    ),
    HomeCaseStudy(
      title: 'Coca-Cola Lime',
      type: 'ORDERING EXPERIENCE · UI/UX',
      image: 'assets/site/coca-cola-laptop.webp',
      headline: "Redesigning Coca-Cola Lime's order page",
      subline: 'A seamless and visually engaging user experience.',
      keyword: 'ENERGY',
      projectId: 'cola',
      details: [
        CaseDetail(
          label: '01 / CHALLENGE',
          title: 'Turn product energy into a clear path.',
          copy:
              'Create an ordering experience that feels vibrant and branded without '
              'competing with the purchase task.',
        ),
        CaseDetail(
          label: '02 / DESIGN DIRECTION',
          title: 'Bold storytelling, controlled hierarchy.',
          copy:
              'Product imagery, color, typography, and calls to action work together '
              'to guide attention naturally.',
        ),
        CaseDetail(
          label: '03 / VALUE',
          title: 'Engagement that supports conversion.',
          copy:
              'The refreshed page makes selection feel intuitive while keeping the '
              'Coca-Cola Lime story memorable.',
        ),
      ],
    ),
    HomeCaseStudy(
      title: 'Purchase',
      type: 'PURCHASE FLOW · CONVERSION UX',
      image: 'assets/site/zara-purchase.webp',
      secondaryImage: 'assets/site/purchase-samsung.webp',
      headline: 'Purchase your items easily',
      subline: 'In just a few simple steps.',
      keyword: 'EFFORTLESS',
      projectId: 'purchase',
      details: [
        CaseDetail(
          label: '01 / CHALLENGE',
          title: 'Remove uncertainty from checkout.',
          copy:
              'Make cost, delivery, payment, and order decisions easy to understand '
              'at every step.',
        ),
        CaseDetail(
          label: '02 / FLOW',
          title: 'Only the information users need.',
          copy:
              'A focused sequence, clear progress, and familiar interaction patterns '
              'reduce friction and hesitation.',
        ),
        CaseDetail(
          label: '03 / OUTCOME',
          title: 'A faster path from cart to confirmation.',
          copy:
              'The simplified experience preserves momentum while improving '
              'confidence and completion.',
        ),
      ],
    ),
    HomeCaseStudy(
      title: 'Components',
      type: 'UI & DESIGN SYSTEMS',
      image: 'assets/site/components-system-cover.webp',
      headline: 'A system designed to scale',
      subline: 'Reusable patterns. Consistent experiences.',
      keyword: 'SYSTEM',
      projectId: 'components',
      details: [
        CaseDetail(
          label: '01 / FOUNDATION',
          title: 'Build consistency into the product.',
          copy:
              'Shared tokens, states, spacing, and accessibility rules create one '
              'dependable visual language.',
        ),
        CaseDetail(
          label: '02 / COMPONENTS',
          title: 'Reusable without becoming rigid.',
          copy:
              'Flexible patterns support search, forms, ratings, payments, '
              'navigation, and recurring product needs.',
        ),
        CaseDetail(
          label: '03 / IMPACT',
          title: 'More speed, less design debt.',
          copy:
              'Documented behavior helps design and engineering ship faster while '
              'protecting usability and quality.',
        ),
      ],
    ),
    HomeCaseStudy(
      title: 'Login & Registration',
      type: 'ACCOUNT ACCESS · ONBOARDING UX',
      image: 'assets/site/login-registration.webp',
      headline: 'Effortless access from the first step',
      subline: 'Log in, register, verify, and begin.',
      keyword: 'ACCESS',
      projectId: 'login',
      details: [
        CaseDetail(
          label: '01 / CHALLENGE',
          title: 'Make account access feel effortless.',
          copy:
              'Reduce friction across registration, sign-in, verification, and the '
              'first successful account moment.',
        ),
        CaseDetail(
          label: '02 / FLOW',
          title: 'One clear step at a time.',
          copy:
              'Focused forms, familiar sign-in options, concise guidance, and '
              'visible feedback help users move confidently.',
        ),
        CaseDetail(
          label: '03 / VALUE',
          title: 'Trust begins before shopping.',
          copy:
              'A consistent cross-platform experience creates clarity while preparing '
              'users for faster future purchases.',
        ),
      ],
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
      logo: 'assets/site/fitlab-logo.webp',
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
      logo: 'assets/site/pillox-logo.webp',
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
      logo: 'assets/site/happyfocus-logo.webp',
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
    this.textOnly = false,
  });

  final String title;
  final String label;
  final String image;
  final String intro;
  final String scope;
  final String result;
  final bool textOnly;
}

class HomeCaseStudy {
  const HomeCaseStudy({
    required this.title,
    required this.type,
    required this.image,
    required this.headline,
    required this.subline,
    required this.keyword,
    required this.details,
    this.secondaryImage,
    this.projectId,
  });

  final String title;
  final String type;
  final String image;
  final String? secondaryImage;
  final String headline;
  final String subline;
  final String keyword;
  final List<CaseDetail> details;
  final String? projectId;
}

class CaseDetail {
  const CaseDetail({
    required this.label,
    required this.title,
    required this.copy,
  });

  final String label;
  final String title;
  final String copy;
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
