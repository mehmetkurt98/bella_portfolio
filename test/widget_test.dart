import 'package:flutter_test/flutter_test.dart';

import 'package:bella_portfolio/app.dart';

void main() {
  testWidgets('Portfolio app renders hero section', (tester) async {
    await tester.pumpWidget(const BellaPortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('BELLA'), findsOneWidget);
    expect(find.textContaining('SELECTED WORKS'), findsOneWidget);
  });
}
