class ProductModel {
  final String id;
  final String title;
  final double price;
  final String imageCover;
  final String categoryID;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageCover,
    required this.categoryID,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? json['_id'] ?? '',
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      imageCover: json['imageCover'] ?? '',
      categoryID: json['category']?['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'imageCover': imageCover,
    'categoryID': categoryID,
  };
}
