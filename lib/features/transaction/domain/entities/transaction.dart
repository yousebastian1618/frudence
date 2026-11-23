enum TransactionType {
  income,
  expense
}

class Transaction {
  final String id;
  final String categoryId;
  final String? subCategoryId;
  final TransactionType transactionType;
  final String name;
  final DateTime occurredAt;
  final double amount;
  final String? note;

  const Transaction({
    required this.id,
    required this.categoryId,
    this.subCategoryId,
    required this.transactionType,
    required this.name,
    required this.occurredAt,
    required this.amount,
    this.note
  });
}
