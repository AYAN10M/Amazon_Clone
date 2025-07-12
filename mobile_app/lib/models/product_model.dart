import 'dart:convert';

class Product {
  final String id;
  final String title;
  final String description;
  final String price;
  final String comparePrice;
  final String brand;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.comparePrice,
    required this.brand,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      price: json['price']?.toString() ?? '0.00',
      comparePrice: json['compare_price']?.toString() ?? '',
      brand: json['brand'] is String
          ? json['brand']
          : json['brand']?['name'] ?? 'No brand',
      imageUrl:
          (json['images'] != null &&
              json['images'] is List &&
              json['images'].isNotEmpty)
          ? json['images'][0]['image']
          : 'https://via.placeholder.com/300',
    );
  }

  static Product fromJsonString(String body) {
    final Map<String, dynamic> jsonData = jsonDecode(body);
    return Product.fromJson(jsonData);
  }
}
