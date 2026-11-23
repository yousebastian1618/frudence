import 'package:flutter/material.dart';
import 'package:frudence/app/theme/app_colors.dart';
import 'package:frudence/core/utils/color_utils.dart';
import 'package:frudence/core/utils/formatter.dart';
import 'package:frudence/core/utils/list_utils.dart';
import 'package:frudence/core/widgets/tappable_note.dart';
import 'package:frudence/features/category/data/dummy/sample_categories.dart';
import 'package:frudence/features/category/presentation/widgets/category_icon.dart';
import 'package:frudence/features/transaction/domain/entities/transaction.dart';

class TransactionBox extends StatelessWidget {
  final Transaction transaction;

  const TransactionBox({
    super.key,
    required this.transaction
  });

  @override
  Widget build(BuildContext context) {

    final colors = AppColors.of(context);
    final category = fetchById(sampleCategories, transaction.categoryId, (category) => category.id);
    final subCategory = fetchById(sampleCategories, transaction.subCategoryId ?? '', (category) => category.id);
    
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (category != null) ...[
                  CategoryIcon(category: category),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nameFormatter(transaction.name),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis
                      ),
                      if (subCategory != null) ...[
                        Container(
                          decoration: BoxDecoration(
                            color: colorFromHex(subCategory.backgroundColor),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                subCategory.imageUrl,
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain
                              ),
                              Flexible(
                                child: Text(
                                  nameFormatter(subCategory.name),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12
                                  )
                                )
                              )
                            ]
                          )
                        )
                      ]
                    ]
                  )
                ),
              ],
            ),
          ),
          if (transaction.note != null) ...[
            TappableNote(note: transaction.note!)
          ],
          const SizedBox(width: 12),
          Text(
            currencyFormatter(transaction.amount),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: transaction.transactionType == TransactionType.income
                ? colors.income
                : colors.expense
            )
          )
        ]
      )
    );
  }
}
