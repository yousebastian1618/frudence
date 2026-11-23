class Category {
  final String id;
  final String name;
  final String imageUrl;
  final String backgroundColor;
  final bool isSubCategory;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.backgroundColor,
    this.isSubCategory = false
  });
}
