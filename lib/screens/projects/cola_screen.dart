import 'package:flutter/material.dart';

import '../../data/cola_project_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/projects/cola/cola_challenge_section.dart';
import '../../widgets/projects/cola/cola_deliver_section.dart';
import '../../widgets/projects/cola/cola_design_system_section.dart';
import '../../widgets/projects/cola/cola_develop_section.dart';
import '../../widgets/projects/cola/cola_hero_section.dart';
import '../../widgets/projects/cola/cola_ia_section.dart';
import '../../widgets/projects/cola/cola_intro_section.dart';
import '../../widgets/projects/cola/cola_overview_section.dart';
import '../../widgets/projects/cola/cola_persona_section.dart';
import '../../widgets/projects/cola/cola_quote_section.dart';
import '../../widgets/projects/cola/cola_values_section.dart';
import '../../widgets/projects/cola/cola_wireframes_section.dart';
import '../../widgets/shared.dart';

class ColaScreen extends StatelessWidget {
  const ColaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColaProjectData.frameYellow,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          color: AppColors.background,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PagePadding(
                  vertical: 24,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: LuxuryTextButton(
                      label: 'Back',
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                ),
                const ColaHeroSection(),
                const ColaIntroSection(),
                const ColaChallengeSection(),
                const ColaOverviewSection(),
                const ColaValuesSection(),
                const ColaQuoteSection(),
                const ColaIaSection(),
                const ColaDesignSystemSection(),
                const ColaPersonaSection(),
                const ColaDevelopSection(),
                const ColaWireframesSection(),
                const ColaDeliverSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
