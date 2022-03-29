class ProductCategory {
  ProductCategory({
    this.id = 0,
    this.name = "",
    this.slug = "",
    this.parentId = 0,
    this.productsCount = 0,
  });

  int id;
  String name;
  String slug;
  int parentId;
  int productsCount;

  factory ProductCategory.fromJson(dynamic json) {
    return ProductCategory(
        id: json["id"] as int,
        name: json["name"] as String,
        slug: json["slug"] as String,
        parentId: json["parent"] as int,
        productsCount: json["count"] as int);
  }
}
