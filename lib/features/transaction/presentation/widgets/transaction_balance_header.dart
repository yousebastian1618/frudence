import 'package:flutter/material.dart';
import 'package:frudence/app/theme/app_colors.dart';
import 'package:frudence/core/utils/formatter.dart';

class TransactionBalanceHeader extends StatelessWidget {
  final double expense;
  final double income;

  const TransactionBalanceHeader({
    super.key,
    required this.expense,
    required this.income
  });

  @override
  Widget build(BuildContext context) {

    final colors = AppColors.of(context);
    final finalAmount = income - expense;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            currencyFormatter(expense),
            style: TextStyle(
              color: colors.expense
            )
          ),
          Text(
            currencyFormatter(income),
            style: TextStyle(
              color: colors.income
            )
          ),
          Text(
            currencyFormatter(finalAmount)
          )
        ]
      )
    );
  }
}