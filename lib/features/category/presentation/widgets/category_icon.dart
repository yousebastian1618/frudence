import 'package:flutter/material.dart';
import 'package:frudence/core/utils/color_utils.dart';
import 'package:frudence/features/category/domain/entities/category.dart';

class CategoryIcon extends StatelessWidget {
  final Category category;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CategoryIcon({
    super.key,
    required this.category,
    this.width = 32,
    this.height = 32,
    this.fit = BoxFit.contain
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorFromHex(category.backgroundColor),
        shape: BoxShape.circle
      ),
      child:  Image.asset(
        category.imageUrl,
        width: width,
        height: height,
        fit: fit
      )
    );
  }
}