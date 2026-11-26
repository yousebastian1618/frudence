import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frudence/features/transaction/domain/entities/transaction.dart';

class TransactionState {
  TransactionState({
    required this.selectedMonth,
    required Iterable<Transaction> transactions
  }) : transactions = List.unmodifiable(transactions);

  final DateTime? selectedMonth;
  final List<Transaction> transactions;
}

class TransactionCubit extends Cubit<TransactionState> {
  factory TransactionCubit(Iterable<Transaction> transactions) {
    return TransactionCubit._(List<Transaction>.unmodifiable(transactions));
  }

  TransactionCubit._(this._allTransactions)
    : super(TransactionState(
      selectedMonth: null,
      transactions: _allTransactions
    ));

  final List<Transaction> _allTransactions;

  void selectMonth(int year, int month) {
    final selectedMonth = DateTime(year, month);
    if (state.selectedMonth == selectedMonth) return;

    emit(TransactionState(
      selectedMonth: selectedMonth,
      transactions: _allTransactions.where(
        (transaction) =>
          transaction.occurredAt.year == year &&
          transaction.occurredAt.month == month
      )
    ));
  }
}