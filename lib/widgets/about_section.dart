import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/about_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 96 : 64,
        child: wide ? const _WideAbout() : const _CompactAbout(),
      ),
    );
  }
}

class _WideAbout extends StatelessWidget {
  const _WideAbout();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 6,
                child: _AboutIntro(),
              ),
              const SizedBox(width: 40),
              Expanded(
                flex: 4,
                child: _Portrait(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),
        const Divider(height: 1, thickness: 1, color: AppColors.border),
        const SizedBox(height: 36),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 6,
                child: _LeftMeta(),
              ),
              Container(
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 32),
                color: AppColors.border,
              ),
              const Expanded(
                flex: 4,
                child: _BestInField(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CompactAbout extends StatelessWidget {
  const _CompactAbout();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Portrait(height: 360),
        SizedBox(height: 28),
        _AboutIntro(),
        SizedBox(height: 32),
        Divider(height: 1, thickness: 1, color: AppColors.border),
        SizedBox(height: 32),
        _LeftMeta(),
        SizedBox(height: 32),
        Divider(height: 1, thickness: 1, color: AppColors.border),
        SizedBox(height: 32),
        _BestInField(),
      ],
    );
  }
}

class _AboutIntro extends StatelessWidget {
  const _AboutIntro();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AboutData.aboutTitle,
          style: AppTheme.sans.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.6,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          AboutData.aboutBody,
          style: AppTheme.sans.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.75,
            color: AppColors.foreground,
          ),
        ),
      ],
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait({this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: AspectRatio(
        aspectRatio: height == null ? 3 / 4 : 3 / 4,
        child: Image.asset(
          AboutData.portraitAsset,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          height: height,
          errorBuilder: (context, error, stackTrace) =>
              Container(color: const Color(0xFFECECEC)),
        ),
      ),
    );
  }
}

class _LeftMeta extends StatelessWidget {
  const _LeftMeta();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AboutData.educationTitle,
          style: AppTheme.sans.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 12),
        for (final line in AboutData.educationLines)
          Text(
            line,
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: AppColors.foreground,
            ),
          ),
        const SizedBox(height: 32),
        Text(
          AboutData.skillsTitle,
          style: AppTheme.sans.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 16),
        const _SkillsRow(),
        const SizedBox(height: 32),
        Text(
          AboutData.contactTitle,
          style: AppTheme.sans.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 12),
        const _LinkedInLink(),
      ],
    );
  }
}

class _SkillsRow extends StatelessWidget {
  const _SkillsRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        for (final skill in AboutData.skills) _SkillItem(skill: skill),
      ],
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({required this.skill});

  final AboutSkill skill;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: skill.color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              skill.name.substring(0, 1).toUpperCase(),
              style: AppTheme.sans.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            skill.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.sans.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 1.25,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkedInLink extends StatelessWidget {
  const _LinkedInLink();

  Future<void> _open() async {
    final uri = Uri.parse(AboutData.linkedInUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _open,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF0A66C2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'in',
              style: AppTheme.sans.copyWith(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              AboutData.linkedInLabel,
              style: AppTheme.sans.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.45,
                color: AppColors.foreground,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.foreground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BestInField extends StatelessWidget {
  const _BestInField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AboutData.bestTitle,
          style: AppTheme.sans.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < AboutData.bestParagraphs.length; i++) ...[
          _RichParagraph(paragraph: AboutData.bestParagraphs[i]),
          if (i < AboutData.bestParagraphs.length - 1)
            const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class _RichParagraph extends StatelessWidget {
  const _RichParagraph({required this.paragraph});

  final AboutParagraph paragraph;

  @override
  Widget build(BuildContext context) {
    final base = AppTheme.sans.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.7,
      color: AppColors.foreground,
    );

    if (paragraph.boldParts.isEmpty) {
      return Text(paragraph.text, style: base);
    }

    final spans = <TextSpan>[];
    var remaining = paragraph.text;
    for (final part in paragraph.boldParts) {
      final index = remaining.indexOf(part);
      if (index < 0) continue;
      if (index > 0) {
        spans.add(TextSpan(text: remaining.substring(0, index)));
      }
      spans.add(
        TextSpan(
          text: part,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      );
      remaining = remaining.substring(index + part.length);
    }
    if (remaining.isNotEmpty) {
      spans.add(TextSpan(text: remaining));
    }

    return Text.rich(TextSpan(style: base, children: spans));
  }
}
