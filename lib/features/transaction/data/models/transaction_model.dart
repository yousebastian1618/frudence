import 'package:frudence/features/transaction/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.id,
    required super.categoryId,
    required super.subCategoryId,
    required super.transactionType,
    required super.name,
    required super.occurredAt,
    required super.amount,
    required super.note
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      subCategoryId: json['subCategoryId'] as String?,
      // transactionType: TransactionType.expense,
      transactionType: TransactionType.values.byName(
        json['transactionType'] as String
      ),
      name: json['name'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      amount: (json['amount'] as num).toDouble(),
      note: json['note'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
      'transactionType': transactionType.name,
      'name': name,
      'occurredAt': occurredAt,
      'amount': amount,
      'note': note
    };
  }
}