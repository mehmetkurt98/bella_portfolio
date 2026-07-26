import 'dart:async';

import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../models/portfolio_item.dart';
import '../screens/projects/cola_screen.dart';
import '../screens/projects/fitlab_screen.dart';
import '../screens/projects/yemeksepeti_screen.dart';
import '../screens/projects/zara_screen.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'shared.dart';

class LuxuryHeader extends StatefulWidget {
  const LuxuryHeader({
    super.key,
    required this.onNavigate,
    this.promoVisible = true,
    this.onClosePromo,
  });

  final ValueChanged<String> onNavigate;
  final bool promoVisible;
  final VoidCallback? onClosePromo;

  @override
  State<LuxuryHeader> createState() => _LuxuryHeaderState();
}

class _LuxuryHeaderState extends State<LuxuryHeader> {
  bool _menuOpen = false;

  static List<PortfolioItem> get _projects => SampleData.featuredWorks
      .where((item) => item.projectId != null)
      .toList(growable: false);

  void _openProject(PortfolioItem item) {
    setState(() => _menuOpen = false);

    final Widget? screen = switch (item.projectId) {
      'cola' => const ColaScreen(),
      'zara' => const ZaraScreen(),
      'fitlab' => const FitlabScreen(),
      'yemeksepeti' => const YemeksepetiScreen(),
      _ => null,
    };
    if (screen == null) return;

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 960;

    return Material(
      color: AppColors.background,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.promoVisible)
            Container(
              width: double.infinity,
              color: AppColors.promoBar,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Available for selected freelance projects',
                      style: AppTheme.sans.copyWith(
                        color: Colors.white,
                        fontSize: 11,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onClosePromo,
                    icon: const Icon(Icons.close, size: 16, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
          PagePadding(
            vertical: 20,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => widget.onNavigate('top'),
                  child: Text(
                    SampleData.ownerName.toUpperCase(),
                    style: AppTheme.serif.copyWith(
                      fontSize: compact ? 28 : 34,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                const Spacer(),
                if (!compact) ...[
                  _WorksNavItem(
                    projects: _projects,
                    onWorksTap: () => widget.onNavigate('works'),
                    onProjectTap: _openProject,
                  ),
                  const SizedBox(width: 20),
                  LuxuryTextButton(
                    label: 'About',
                    onPressed: () => widget.onNavigate('about'),
                  ),
                  const SizedBox(width: 20),
                  LuxuryTextButton(
                    label: 'Contact',
                    onPressed: () => widget.onNavigate('contact'),
                  ),
                  const SizedBox(width: 32),
                  _HeaderIcon(
                    icon: Icons.mail_outline,
                    onTap: () => widget.onNavigate('contact'),
                  ),
                  const SizedBox(width: 16),
                  _HeaderIcon(
                    icon: Icons.language,
                    onTap: () => widget.onNavigate('works'),
                  ),
                ] else
                  IconButton(
                    onPressed: () => setState(() => _menuOpen = !_menuOpen),
                    icon: Icon(_menuOpen ? Icons.close : Icons.menu),
                  ),
              ],
            ),
          ),
          if (compact && _menuOpen)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LuxuryTextButton(
                    label: 'Works',
                    onPressed: () {
                      setState(() => _menuOpen = false);
                      widget.onNavigate('works');
                    },
                  ),
                  for (final project in _projects)
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 8),
                      child: TextButton(
                        onPressed: () => _openProject(project),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.foreground,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 6,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          project.title,
                          style: AppTheme.sans.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 12),
                  LuxuryTextButton(
                    label: 'About',
                    onPressed: () {
                      setState(() => _menuOpen = false);
                      widget.onNavigate('about');
                    },
                  ),
                  const SizedBox(height: 12),
                  LuxuryTextButton(
                    label: 'Contact',
                    onPressed: () {
                      setState(() => _menuOpen = false);
                      widget.onNavigate('contact');
                    },
                  ),
                ],
              ),
            ),
          const Divider(height: 1, thickness: 1),
        ],
      ),
    );
  }
}

class _WorksNavItem extends StatefulWidget {
  const _WorksNavItem({
    required this.projects,
    required this.onWorksTap,
    required this.onProjectTap,
  });

  final List<PortfolioItem> projects;
  final VoidCallback onWorksTap;
  final ValueChanged<PortfolioItem> onProjectTap;

  @override
  State<_WorksNavItem> createState() => _WorksNavItemState();
}

class _WorksNavItemState extends State<_WorksNavItem> {
  final _link = LayerLink();
  OverlayEntry? _entry;
  bool _overButton = false;
  bool _overMenu = false;
  Timer? _closeTimer;

  void _syncOverlay() {
    _closeTimer?.cancel();
    final shouldShow = _overButton || _overMenu;
    if (shouldShow) {
      if (_entry == null) _showOverlay();
      return;
    }
    _closeTimer = Timer(const Duration(milliseconds: 120), () {
      if (!_overButton && !_overMenu) {
        _hideOverlay();
      }
    });
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    _entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 240,
          child: CompositedTransformFollower(
            link: _link,
            showWhenUnlinked: false,
            offset: const Offset(-8, 34),
            child: MouseRegion(
              onEnter: (_) {
                _overMenu = true;
                _syncOverlay();
              },
              onExit: (_) {
                _overMenu = false;
                _syncOverlay();
              },
              child: Material(
                color: AppColors.background,
                elevation: 8,
                shadowColor: Colors.black26,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final project in widget.projects)
                        InkWell(
                          onTap: () {
                            _hideOverlay();
                            widget.onProjectTap(project);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            child: Text(
                              project.title,
                              style: AppTheme.sans.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.8,
                                color: AppColors.foreground,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    overlay.insert(_entry!);
  }

  void _hideOverlay() {
    _closeTimer?.cancel();
    _entry?.remove();
    _entry = null;
    _overButton = false;
    _overMenu = false;
  }

  @override
  void dispose() {
    _closeTimer?.cancel();
    _hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: MouseRegion(
        onEnter: (_) {
          _overButton = true;
          _syncOverlay();
        },
        onExit: (_) {
          _overButton = false;
          _syncOverlay();
        },
        child: LuxuryTextButton(
          label: 'Works',
          onPressed: widget.onWorksTap,
        ),
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, size: 20, color: AppColors.foreground),
      ),
    );
  }
}
