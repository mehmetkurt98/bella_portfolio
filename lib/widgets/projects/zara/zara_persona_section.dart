import 'package:flutter/material.dart';

import '../../../data/zara_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ZaraPersonaSection extends StatelessWidget {
  const ZaraPersonaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width > 900;
    final personas = ZaraProjectData.personas;

    final horizontal = personas
        .where((p) => p.layout == ZaraPersonaLayout.horizontal)
        .toList();
    final vertical = personas
        .where((p) => p.layout == ZaraPersonaLayout.vertical)
        .toList();

    return Container(
      width: double.infinity,
      color: const Color(0xFFF3F3F3),
      child: PagePadding(
        vertical: wide ? 80 : 56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'PERSONA',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: wide ? 28 : 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: wide ? 40 : 28),
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        for (var i = 0; i < horizontal.length; i++) ...[
                          _PersonaCard(persona: horizontal[i]),
                          if (i < horizontal.length - 1)
                            const SizedBox(height: 16),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        for (var i = 0; i < vertical.length; i++) ...[
                          _PersonaCard(persona: vertical[i]),
                          if (i < vertical.length - 1)
                            const SizedBox(height: 16),
                        ],
                      ],
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  for (var i = 0; i < personas.length; i++) ...[
                    _PersonaCard(persona: personas[i]),
                    if (i < personas.length - 1) const SizedBox(height: 16),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _PersonaCard extends StatelessWidget {
  const _PersonaCard({required this.persona});

  final ZaraPersona persona;

  @override
  Widget build(BuildContext context) {
    final isHorizontal = persona.layout == ZaraPersonaLayout.horizontal;

    return LayoutBuilder(
      builder: (context, constraints) {
        final scale =
            (constraints.maxWidth / persona.cardWidth).clamp(0.55, 1.0);
        final height = persona.cardHeight * scale;
        final imageW = persona.imageWidth * scale;
        final imageH = persona.imageHeight * scale;
        final radius = 32 * scale;

        return Container(
          width: double.infinity,
          height: height,
          padding: EdgeInsets.all(20 * scale),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16 * scale),
            border: Border.all(color: const Color(0xFFD7DEE8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: isHorizontal
              ? _HorizontalBody(
                  persona: persona,
                  scale: scale,
                  imageW: imageW,
                  imageH: imageH,
                  radius: radius,
                )
              : _VerticalBody(
                  persona: persona,
                  scale: scale,
                  imageH: imageH,
                  radius: radius,
                ),
        );
      },
    );
  }
}

class _HorizontalBody extends StatelessWidget {
  const _HorizontalBody({
    required this.persona,
    required this.scale,
    required this.imageW,
    required this.imageH,
    required this.radius,
  });

  final ZaraPersona persona;
  final double scale;
  final double imageW;
  final double imageH;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          persona.title,
          style: AppTheme.sans.copyWith(
            fontSize: 15 * scale,
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: AppColors.foreground,
          ),
        ),
        SizedBox(height: 14 * scale),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(
                  persona.imageAsset,
                  width: imageW,
                  height: imageH,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 18 * scale),
              Expanded(
                child: _PersonaDetails(persona: persona, scale: scale),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _VerticalBody extends StatelessWidget {
  const _VerticalBody({
    required this.persona,
    required this.scale,
    required this.imageH,
    required this.radius,
  });

  final ZaraPersona persona;
  final double scale;
  final double imageH;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          persona.title,
          style: AppTheme.sans.copyWith(
            fontSize: 15 * scale,
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: AppColors.foreground,
          ),
        ),
        SizedBox(height: 14 * scale),
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.asset(
            persona.imageAsset,
            width: double.infinity,
            height: imageH,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 14 * scale),
        Expanded(
          child: _PersonaDetails(persona: persona, scale: scale),
        ),
      ],
    );
  }
}

class _PersonaDetails extends StatelessWidget {
  const _PersonaDetails({
    required this.persona,
    required this.scale,
  });

  final ZaraPersona persona;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _DetailLine(
          label: 'Demographics',
          value: persona.demographics,
          scale: scale,
        ),
        SizedBox(height: 10 * scale),
        _DetailLine(
          label: 'Behavior',
          value: persona.behavior,
          scale: scale,
        ),
        SizedBox(height: 10 * scale),
        _DetailLine(
          label: 'Needs',
          value: persona.needs,
          scale: scale,
        ),
      ],
    );
  }
}

class _DetailLine extends StatelessWidget {
  const _DetailLine({
    required this.label,
    required this.value,
    required this.scale,
  });

  final String label;
  final String value;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 7 * scale),
          child: Container(
            width: 5 * scale,
            height: 5 * scale,
            decoration: const BoxDecoration(
              color: AppColors.foreground,
              shape: BoxShape.circle,
            ),
          ),
        ),
        SizedBox(width: 10 * scale),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: AppTheme.sans.copyWith(
                fontSize: 13 * scale,
                height: 1.5,
                color: AppColors.foreground,
              ),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
