import 'package:frudence/features/transaction/domain/entities/transaction.dart';

final sampleTransactions = [
  Transaction(
    id: "txn_001",
    categoryId: 'cat_salary',
    subCategoryId: 'cat_building',
    transactionType: TransactionType.income,
    name: "Monthly salary",
    occurredAt: DateTime(2026, 9, 7, 17, 30),
    amount: 4200.23,
    note: 'This is node'
  ),
  Transaction(
    id: "txn_002",
    categoryId: 'cat_shopping',
    transactionType: TransactionType.expense,
    name: "Laptop",
    occurredAt: DateTime(2026, 9, 3, 17, 30),
    amount: 1200.56
  ),
  Transaction(
    id: "txn_003",
    categoryId: 'cat_bank',
    transactionType: TransactionType.income,
    name: "Reimbursement",
    occurredAt: DateTime(2026, 9, 3, 17, 30),
    amount: 367.98,
    note: 'This is node'
  ),
  Transaction(
    id: "txn_004",
    categoryId: 'cat_foot',
    transactionType: TransactionType.expense,
    name: "McDonald's",
    occurredAt: DateTime(2026, 9, 7, 17, 30),
    amount: 12.90
  )
];
