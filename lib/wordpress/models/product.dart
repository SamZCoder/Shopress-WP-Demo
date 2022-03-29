class Product {
  Product({
    this.id = 0,
    this.name = "",
    this.featured = false,
    this.sku = "",
    this.price = 0,
    this.regularPrice = 0,
    this.onSale = false,
    this.purchasable = true,
    this.totalSales = 0,
    this.virtual = false,
    this.downloadable = false,
    this.averageRating = 0,
    this.imageSource = "",
    this.stockQuantity = 0,
  });

  int id;
  String name;
  bool featured;
  String sku;
  double price;
  double regularPrice;
  bool onSale;
  bool purchasable;
  double totalSales;
  bool virtual;
  bool downloadable;
  double stockQuantity;
  double averageRating;
  String imageSource;

  factory Product.fromJson(dynamic json) {
    return Product(
      id: json["id"] as int,
      name: json["name"] as String,
      featured: json["featured"] as bool,
      sku: json["sku"] as String,
      averageRating: double.parse(json["average_rating"].toString()),
      downloadable: json["downloadable"] as bool,
      imageSource: (json["images"] as List).isNotEmpty
          ? (json["images"] as List)[0]["src"]
          : "",
      onSale: json["on_sale"] as bool,
      price: double.parse(json["price"].toString()),
      regularPrice: double.parse(json["regular_price"].toString() == ""
          ? "0"
          : json["regular_price"].toString()),
      purchasable: json["purchasable"] as bool,
      stockQuantity: json["stock_quantity"] == null
          ? 0
          : double.parse(json["stock_quantity"].toString()),
      totalSales: double.parse(json["total_sales"].toString()),
      virtual: json["virtual"] as bool,
    );
  }
}
