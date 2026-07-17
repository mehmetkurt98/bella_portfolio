import 'package:flutter/material.dart';

import '../../../data/cola_project_data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../shared.dart';

class ColaIaSection extends StatelessWidget {
  const ColaIaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 900;

    return ColoredBox(
      color: AppColors.background,
      child: PagePadding(
        vertical: wide ? 72 : 48,
        child: Column(
          children: [
            Text(
              'INFORMATION ARCHITECTURE',
              textAlign: TextAlign.center,
              style: AppTheme.sans.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: wide ? 48 : 32),
            const _IaDiagram(),
          ],
        ),
      ),
    );
  }
}

class _IaDiagram extends StatelessWidget {
  const _IaDiagram();

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 800;

    if (!wide) {
      return const Column(
        children: [
          _IaNode(label: 'Homepage'),
          SizedBox(height: 16),
          _IaNode(label: 'Products'),
          SizedBox(height: 12),
          _IaNode(label: 'About Us'),
          SizedBox(height: 12),
          _IaNode(label: 'Impact'),
          SizedBox(height: 16),
          _IaNode(label: 'Order Now'),
          SizedBox(height: 12),
          _IaNode(label: 'Products Page'),
        ],
      );
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: _IaNode(label: 'Homepage')),
          const SizedBox(width: 20),
          const SizedBox(
            width: 36,
            child: CustomPaint(painter: _BranchPainter()),
          ),
          const SizedBox(width: 12),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _IaNode(label: 'Products'),
              SizedBox(height: 16),
              _IaNode(label: 'About Us'),
              SizedBox(height: 16),
              _IaNode(label: 'Impact'),
            ],
          ),
          const SizedBox(width: 20),
          const SizedBox(
            width: 36,
            child: CustomPaint(painter: _BranchPainter(count: 2)),
          ),
          const SizedBox(width: 12),
          const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _IaNode(label: 'Order Now'),
              SizedBox(height: 24),
              _IaNode(label: 'Products Page'),
            ],
          ),
        ],
      ),
    );
  }
}

class _IaNode extends StatelessWidget {
  const _IaNode({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: ColaProjectData.quoteBg, width: 2),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: AppTheme.sans.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),
      ),
    );
  }
}

class _BranchPainter extends CustomPainter {
  const _BranchPainter({this.count = 3});

  final int count;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColaProjectData.quoteBg
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final midY = size.height / 2;
    canvas.drawLine(Offset(0, midY), Offset(size.width * 0.35, midY), paint);

    for (var i = 0; i < count; i++) {
      final t = count == 1 ? 0.5 : i / (count - 1);
      final y = size.height * (0.12 + t * 0.76);
      final path = Path()
        ..moveTo(size.width * 0.35, midY)
        ..lineTo(size.width * 0.55, y)
        ..lineTo(size.width, y);
      canvas.drawPath(path, paint);
      final tip = Offset(size.width, y);
      canvas.drawLine(tip, tip + const Offset(-8, -5), paint);
      canvas.drawLine(tip, tip + const Offset(-8, 5), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BranchPainter oldDelegate) =>
      oldDelegate.count != count;
}
