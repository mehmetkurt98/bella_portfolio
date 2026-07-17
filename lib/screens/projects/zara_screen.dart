import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/projects/zara/zara_background_section.dart';
import '../../widgets/projects/zara/zara_blueprint_section.dart';
import '../../widgets/projects/zara/zara_challenge_section.dart';
import '../../widgets/projects/zara/zara_deliver_section.dart';
import '../../widgets/projects/zara/zara_design_system_section.dart';
import '../../widgets/projects/zara/zara_develop_section.dart';
import '../../widgets/projects/zara/zara_hero_section.dart';
import '../../widgets/projects/zara/zara_info_architecture_section.dart';
import '../../widgets/projects/zara/zara_persona_section.dart';
import '../../widgets/projects/zara/zara_project_details_section.dart';
import '../../widgets/projects/zara/zara_swot_section.dart';
import '../../widgets/projects/zara/zara_values_section.dart';
import '../../widgets/shared.dart';

class ZaraScreen extends StatelessWidget {
  const ZaraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
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
            const ZaraHeroSection(),
            const ZaraBackgroundSection(),
            const ZaraChallengeSection(),
            const ZaraProjectDetailsSection(),
            const ZaraValuesSection(),
            const ZaraBlueprintSection(),
            const ZaraSwotSection(),
            const ZaraInfoArchitectureSection(),
            const ZaraDesignSystemSection(),
            const ZaraPersonaSection(),
            const ZaraDevelopSection(),
            const ZaraDeliverSection(),
          ],
        ),
      ),
    );
  }
}
