import 'package:frudence/features/category/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.backgroundColor,
    super.isSubCategory = false
    
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      backgroundColor: json['backgroundColor'] as String,
      isSubCategory: json['isSubCategory'] as bool? ?? false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'backgroundColor': backgroundColor,
      'isSubCategory': isSubCategory
    };
  }
}
