import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaWireframesSection extends StatelessWidget {
  const ColaWireframesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final wide = size.width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 56 : 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'WIRE FRAMES',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              ),
            ),
            SizedBox(height: wide ? 28 : 20),
            LayoutBuilder(
              builder: (context, constraints) {
                final gap = wide ? 12.0 : 8.0;
                final columns = constraints.maxWidth > 560 ? 2 : 1;
                final cellWidth = columns == 1
                    ? constraints.maxWidth
                    : (constraints.maxWidth - gap) / 2;
                final cellHeight = columns == 1
                    ? cellWidth * 0.72
                    : (size.height * 0.38).clamp(200.0, 320.0);

                return Wrap(
                  spacing: gap,
                  runSpacing: gap,
                  children: [
                    for (final asset in ColaProjectData.wireframeImages)
                      SizedBox(
                        width: cellWidth,
                        height: cellHeight,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.foreground,
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              asset,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            SizedBox(height: wide ? 40 : 28),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: wide ? 360 : 240,
              ),
              child: Image.asset(
                ColaProjectData.wireframeHero,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
