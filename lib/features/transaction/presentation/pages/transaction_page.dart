import 'package:flutter/material.dart';
import 'package:frudence/core/utils/constants/date_time_constants.dart';
import 'package:frudence/core/utils/formatter.dart';
import 'package:frudence/core/utils/list_utils.dart';
import 'package:frudence/features/transaction/data/dummy/sample_transactions.dart';
import 'package:frudence/features/transaction/domain/entities/transaction.dart';
import 'package:frudence/features/transaction/presentation/pages/transaction_balance_header.dart';
import 'package:frudence/features/transaction/presentation/widgets/transaction_box.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

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
