import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frudence/app/theme/app_theme.dart';
import 'package:frudence/features/category/presentation/widgets/category_icon.dart';
import 'package:frudence/features/transaction/data/dummy/sample_transactions.dart';
import 'package:frudence/features/transaction/presentation/widgets/transaction_box.dart';

void main() {
  testWidgets('Sample transactions load their category images', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: Column(
            children: [
              for (final transaction in sampleTransactions)
                TransactionBox(transaction: transaction),
            ],
          ),
        ),
      ),
    );
    await tester.runAsync(() async {
      for (final element in find.byType(Image).evaluate()) {
        await precacheImage((element.widget as Image).image, element);
      }
    });
    await tester.pumpAndSettle();

    expect(find.byType(CategoryIcon), findsNWidgets(sampleTransactions.length));
    expect(tester.takeException(), isNull);
    for (final image in tester.widgetList<RawImage>(find.byType(RawImage))) {
      expect(image.image, isNotNull);
    }
  });
}
