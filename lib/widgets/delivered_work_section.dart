import 'package:flutter/material.dart';

import '../data/home_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class DeliveredWorkSection extends StatelessWidget {
  const DeliveredWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: MediaQuery.sizeOf(context).width < 680 ? 78 : 118,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _SectionIntro(
              kicker: 'DELIVERED WORK',
              title: 'Strategy translated',
              titleAccent: 'into work people can use.',
              body:
                  'Selected product, UX, systems, and communication work. Open each '
                  'project to see the role, thinking, and outcome.',
            ),
            const SizedBox(height: 48),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.lineStrong)),
              ),
              child: Column(
                children: [
                  for (var i = 0; i < HomeData.deliveredWork.length; i++)
                    _WorkProject(
                      index: i,
                      project: HomeData.deliveredWork[i],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionIntro extends StatelessWidget {
  const _SectionIntro({
    required this.kicker,
    required this.title,
    required this.titleAccent,
    required this.body,
  });

  final String kicker;
  final String title;
  final String titleAccent;
  final String body;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;
    final titleSize =
        (MediaQuery.sizeOf(context).width * 0.044).clamp(40.0, 66.0);

    final heading = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kicker,
          style: AppTheme.sans.copyWith(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 18),
        Text.rich(
          TextSpan(
            style: AppTheme.serif.copyWith(
              fontSize: titleSize,
              fontWeight: FontWeight.w500,
              height: 1.02,
              letterSpacing: -1.2,
            ),
            children: [
              TextSpan(text: '$title\n'),
              TextSpan(
                text: titleAccent,
                style: const TextStyle(color: AppColors.mutedSoft),
              ),
            ],
          ),
        ),
      ],
    );

    final description = Text(
      body,
      style: AppTheme.sans.copyWith(
        fontSize: 13,
        height: 1.72,
        color: AppColors.muted,
      ),
    );

    if (!wide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading,
          const SizedBox(height: 24),
          description,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(flex: 12, child: heading),
        const SizedBox(width: 48),
        Expanded(flex: 6, child: description),
      ],
    );
  }
}

class _WorkProject extends StatefulWidget {
  const _WorkProject({required this.index, required this.project});

  final int index;
  final DeliveredWork project;

  @override
  State<_WorkProject> createState() => _WorkProjectState();
}

class _WorkProjectState extends State<_WorkProject> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;
    final titleSize =
        (MediaQuery.sizeOf(context).width * 0.032).clamp(30.0, 49.0);

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFBDBEB6))),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _open = !_open),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: wide ? 28 : 22,
                horizontal: _open ? 12 : 0,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: wide ? 62 : 28,
                    child: Text(
                      '${widget.index + 1}'.padLeft(2, '0'),
                      style: AppTheme.sans.copyWith(
                        fontSize: 9,
                        letterSpacing: 1.6,
                        color: AppColors.muted,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.label,
                          style: AppTheme.sans.copyWith(
                            fontSize: 7,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.3,
                            color: AppColors.muted,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.project.title,
                          style: AppTheme.serif.copyWith(
                            fontSize: titleSize,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            letterSpacing: -1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (wide)
                    Text(
                      'EXPLORE MY ROLE',
                      style: AppTheme.sans.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.3,
                      ),
                    ),
                  const SizedBox(width: 16),
                  AnimatedRotation(
                    turns: _open ? 0.125 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: const Text('+', style: TextStyle(fontSize: 28)),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: _ExpandedBody(project: widget.project),
            crossFadeState:
                _open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 280),
          ),
        ],
      ),
    );
  }
}

class _ExpandedBody extends StatelessWidget {
  const _ExpandedBody({required this.project});

  final DeliveredWork project;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;
    final textOnly = project.textOnly || project.image.isEmpty;

    final copy = Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: textOnly ? 0 : (wide ? 530 : 340),
        maxWidth: textOnly ? 920 : double.infinity,
      ),
      padding: EdgeInsets.fromLTRB(
        wide ? (textOnly ? 8 : 52) : 28,
        wide ? (textOnly ? 20 : 52) : 28,
        wide ? (textOnly ? 8 : 52) : 28,
        wide ? (textOnly ? 36 : 52) : 28,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'THE WORK BEHIND THE WORK',
            style: AppTheme.sans.copyWith(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 28),
          Text(
            project.title,
            style: AppTheme.serif.copyWith(
              fontSize: wide ? (textOnly ? 44 : 52) : 39,
              fontWeight: FontWeight.w500,
              height: 0.95,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            project.intro,
            style: AppTheme.sans.copyWith(
              fontSize: 17,
              height: 1.45,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            project.scope,
            style: AppTheme.sans.copyWith(
              fontSize: 13,
              height: 1.75,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 26),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 26),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: Text(
              project.result,
              style: AppTheme.sans.copyWith(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );

    if (textOnly) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 38),
        child: copy,
      );
    }

    final image = Container(
      constraints: BoxConstraints(minHeight: wide ? 530 : 0),
      color: Colors.white,
      child: AspectRatio(
        aspectRatio: wide ? 1.2 : 1.08,
        child: Image.asset(
          project.image,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );

    if (!wide) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: Column(
          children: [image, copy],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 38),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 116, child: image),
            Expanded(flex: 84, child: copy),
          ],
        ),
      ),
    );
  }
}
