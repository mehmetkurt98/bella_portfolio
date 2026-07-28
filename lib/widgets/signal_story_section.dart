import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class SignalRowSection extends StatelessWidget {
  const SignalRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width > 900 ? 4 : width > 680 ? 2 : 1;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: width < 680 ? 30 : 0,
        child: Padding(
          padding: EdgeInsets.only(bottom: width < 680 ? 48 : 38),
          child: EqualHeightGrid(
            itemCount: HomeData.signals.length,
            columns: columns,
            spacing: 0,
            runSpacing: 0,
            itemBuilder: (context, index) {
              final item = HomeData.signals[index];
              return Container(
                constraints: const BoxConstraints(minHeight: 92),
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.foreground, width: 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.value,
                      style: AppTheme.serif.copyWith(
                        fontSize: 44,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        height: 0.82,
                        letterSpacing: -1.5,
                      ),
                    ),
                    const SizedBox(width: 13),
                    Text(
                      item.label,
                      style: AppTheme.sans.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class StoryStatementSection extends StatelessWidget {
  const StoryStatementSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: PagePadding(
        vertical: wide ? 72 : 58,
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.18,
                    child: Text(
                      HomeData.storyKicker,
                      style: AppTheme.sans.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.6,
                      ),
                    ),
                  ),
                  Expanded(child: _Quote()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HomeData.storyKicker,
                    style: AppTheme.sans.copyWith(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const _Quote(),
                ],
              ),
      ),
    );
  }
}

class _Quote extends StatelessWidget {
  const _Quote();

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.sizeOf(context).width * 0.038).clamp(34.0, 58.0);
    return Text.rich(
      TextSpan(
        style: AppTheme.serif.copyWith(
          fontSize: size,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          height: 1.02,
          letterSpacing: -1,
        ),
        children: [
          TextSpan(text: '${HomeData.storyLead}\n'),
          TextSpan(
            text: HomeData.storyTail,
            style: const TextStyle(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}
