import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaPersonaSection extends StatelessWidget {
  const ColaPersonaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 72 : 48,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'PERSONA',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  ColaProjectData.personaIntro,
                  textAlign: TextAlign.center,
                  style: AppTheme.sans.copyWith(fontSize: 14, height: 1.7),
                ),
              ),
            ),
            SizedBox(height: wide ? 40 : 28),
            if (wide)
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: _Psychographics()),
                  SizedBox(width: 28),
                  Expanded(flex: 6, child: _PersonaCard()),
                ],
              )
            else
              const Column(
                children: [
                  _Psychographics(),
                  SizedBox(height: 24),
                  _PersonaCard(),
                ],
              ),
            SizedBox(height: wide ? 36 : 28),
            Text(
              'GOAL',
              style: AppTheme.sans.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              ColaProjectData.personaGoal,
              style: AppTheme.sans.copyWith(fontSize: 14, height: 1.7),
            ),
          ],
        ),
      ),
    );
  }
}

class _Psychographics extends StatelessWidget {
  const _Psychographics();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in ColaProjectData.personaPsychographics) ...[
          Text(
            item.title,
            style: AppTheme.sans.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.body,
            style: AppTheme.sans.copyWith(
              fontSize: 13,
              height: 1.6,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class _PersonaCard extends StatelessWidget {
  const _PersonaCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ColaProjectData.personaImage,
          fit: BoxFit.contain,
          width: double.infinity,
        ),
        const SizedBox(height: 16),
        for (final detail in ColaProjectData.personaDetails)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    detail.title,
                    style: AppTheme.sans.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    detail.body,
                    style: AppTheme.sans.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
