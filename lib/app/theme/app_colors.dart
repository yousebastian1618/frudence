import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color income;
  final Color expense;

  const AppColors({
    required this.income,
    required this.expense
  });

  static AppColors of(BuildContext context) =>
    Theme.of(context).extension<AppColors>()!;

  @override
  AppColors copyWith({
    Color? income,
    Color? expense
  }) {
    return AppColors(
      income: income ?? this.income,
      expense: expense ?? this.expense
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      income: Color.lerp(income, other.income, t)!,
      expense: Color.lerp(expense, other.expense, t)!
    );
  }
}