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
    final columns = width > 700 ? 2 : 1;
    final personas = ZaraProjectData.personas;
    final compact = width < 900;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF7F7F5),
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
            SizedBox(height: wide ? 48 : 32),
            EqualHeightGrid(
              itemCount: personas.length,
              columns: columns,
              spacing: 20,
              runSpacing: 20,
              itemBuilder: (context, index) => _PersonaCard(
                persona: personas[index],
                compact: compact || columns == 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonaCard extends StatelessWidget {
  const _PersonaCard({
    required this.persona,
    required this.compact,
  });

  final ZaraPersona persona;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 18 : 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            persona.title,
            style: AppTheme.sans.copyWith(
              fontSize: compact ? 15 : 16,
              fontWeight: FontWeight.w700,
              height: 1.35,
              color: AppColors.foreground,
            ),
          ),
          SizedBox(height: compact ? 16 : 20),
          if (compact)
            _StackedBody(persona: persona)
          else
            _SideBySideBody(persona: persona),
        ],
      ),
    );
  }
}

class _SideBySideBody extends StatelessWidget {
  const _SideBySideBody({required this.persona});

  final ZaraPersona persona;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 168,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(
                persona.imageAsset,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: _PersonaDetails(persona: persona),
          ),
        ],
      ),
    );
  }
}

class _StackedBody extends StatelessWidget {
  const _StackedBody({required this.persona});

  final ZaraPersona persona;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 4 / 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.asset(
              persona.imageAsset,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 18),
        _PersonaDetails(persona: persona),
      ],
    );
  }
}

class _PersonaDetails extends StatelessWidget {
  const _PersonaDetails({required this.persona});

  final ZaraPersona persona;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailLine(label: 'Demographics', value: persona.demographics),
        const SizedBox(height: 14),
        _DetailLine(label: 'Behavior', value: persona.behavior),
        const SizedBox(height: 14),
        _DetailLine(label: 'Needs', value: persona.needs),
      ],
    );
  }
}

class _DetailLine extends StatelessWidget {
  const _DetailLine({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTheme.sans.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.6,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTheme.sans.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.55,
            color: AppColors.foreground,
          ),
        ),
      ],
    );
  }
}
