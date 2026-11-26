import 'package:flutter/material.dart';
import 'package:frudence/core/constants/time_constants.dart';
import 'package:frudence/core/utils/constants/date_time_constants.dart';
import 'package:frudence/core/utils/formatter.dart';
import 'package:frudence/core/utils/list_utils.dart';
import 'package:frudence/core/widgets/horizontal_scroll.dart';
import 'package:frudence/features/transaction/data/dummy/sample_transactions.dart';
import 'package:frudence/features/transaction/domain/entities/transaction.dart';
import 'package:frudence/features/transaction/presentation/widgets/transaction_balance_header.dart';
import 'package:frudence/features/transaction/presentation/widgets/transaction_box.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({
    super.key
  });

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  String? _selectedMonth;

  @override
  Widget build(BuildContext context) {
    final transactionsGroupByDates = groupBy(
      sampleTransactions,
      (item) => item.occurredAt,
    ).entries.toList();
    final totalExpense = sampleTransactions.fold<double>(
      0.0,
      (total, transaction) =>
        total + (transaction.transactionType == TransactionType.expense
          ? transaction.amount
          : 0.0
        )
    );
    final totalIncome = sampleTransactions.fold<double>(
      0.0,
      (total, transaction) =>
        total + (transaction.transactionType == TransactionType.income
          ? transaction.amount
          : 0.0  
      )
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: SafeArea(
        child: Column(
          children: [
            HorizontalScroll(
              spacing: 48,
              verticalPadding: 16,
              selectedIndex: _selectedMonth == null ? null : months.indexOf(_selectedMonth!),
              children: [
                for (final month in months)
                  Semantics(
                    selected: _selectedMonth == month,
                    button: true,
                    child: InkWell(
                      onTap: () => setState(() => _selectedMonth = month),
                      child: Text(
                        month,
                        style: TextStyle(
                          fontWeight: _selectedMonth == month
                            ? FontWeight.bold
                            : FontWeight.normal
                        )
                      )
                    )
                  )
              ]
            ),
            TransactionBalanceHeader(expense: totalExpense, income: totalIncome),
            Expanded(
              child: ListView.builder(
                itemCount: transactionsGroupByDates.length,
                itemBuilder: (context, index) {
                  final group = transactionsGroupByDates[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateTimeFormatter(group.key, [
                          DateFormatElement.weekday,
                          DateTimeFormatSeparator.comma,
                          DateFormatElement.month,
                          DateFormatElement.dd,
                        ]),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      ...group.value.map(
                        (transaction) => TransactionBox(transaction: transaction),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
