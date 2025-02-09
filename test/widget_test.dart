import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_maker_app/main.dart';

void main() {
  testWidgets('PortfolioMaker app smoke test', (WidgetTester tester) async {
    // Build the PortfolioMaker app.
    await tester.pumpWidget(const PortfolioMaker());

    // Verify that the app's title is displayed.
    expect(find.text('Portfolio Maker'), findsOneWidget);

    // Tap the "Create and Download Portfolio" button.
    await tester.tap(find.text('Create and Download Portfolio'));
    await tester.pump();

    // Verify that the portfolio is saved and downloaded.
    expect(find.text('Portfolio saved and downloaded'), findsOneWidget);
  });
}
