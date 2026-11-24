import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frudence/app/app.dart';
import 'package:frudence/app/router/app_router.dart';
import 'package:frudence/app/theme/app_theme.dart';
import 'package:frudence/features/transaction/presentation/widgets/transaction_balance_header.dart';
import 'package:frudence/features/transaction/presentation/pages/transaction_page.dart';
import 'package:frudence/features/transaction/presentation/widgets/transaction_box.dart';

void main() {
  testWidgets('Transactions tab opens and can switch back to Home', (
    tester,
  ) async {
    AppRouter.router.go('/home');
    await tester.pumpWidget(const FrudenceApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Transactions'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(TransactionBalanceHeader), findsOneWidget);
    expect(find.byType(TransactionBox), findsWidgets);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Transactions'));
    await tester.pumpAndSettle();
    expect(find.byType(TransactionBalanceHeader), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
    AppRouter.router.go('/home');
  });

  testWidgets(
    'Transactions page lays out and scrolls below the balance header',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: SizedBox(width: 360, height: 300, child: TransactionPage()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.byType(TransactionBalanceHeader), findsOneWidget);
      expect(find.byType(TransactionBox), findsWidgets);
      final headerBottom = tester
          .getBottomLeft(find.byType(TransactionBalanceHeader))
          .dy;
      expect(
        tester.getTopLeft(find.byType(ListView)).dy,
        greaterThanOrEqualTo(headerBottom),
      );

      await tester.drag(find.byType(ListView), const Offset(0, -200));
      await tester.pumpAndSettle();
      expect(
        tester.state<ScrollableState>(find.byType(Scrollable)).position.pixels,
        greaterThan(0),
      );
      expect(tester.takeException(), isNull);
    },
  );
}
