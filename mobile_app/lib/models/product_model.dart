class Product {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String shortDescription;
  final String price;
  final String comparePrice;
  final String costPrice;
  final Category? category;
  final Brand? brand;
  final String sku;
  final String barcode;
  final String modelNumber;
  final String condition;
  final int stockQuantity;
  final int lowStockThreshold;
  final bool trackInventory;
  final bool allowBackorders;
  final double? weight;
  final double? length;
  final double? width;
  final double? height;
  final String metaTitle;
  final String metaDescription;
  final String keywords;
  final String status;
  final bool isFeatured;
  final bool isDigital;
  final bool requiresShipping;
  final int viewCount;
  final int soldCount;
  final double rating;
  final int reviewCount;
  final List<ProductImage>? images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? publishedAt;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.comparePrice,
    required this.costPrice,
    this.category,
    this.brand,
    required this.sku,
    required this.barcode,
    required this.modelNumber,
    required this.condition,
    required this.stockQuantity,
    required this.lowStockThreshold,
    required this.trackInventory,
    required this.allowBackorders,
    this.weight,
    this.length,
    this.width,
    this.height,
    required this.metaTitle,
    required this.metaDescription,
    required this.keywords,
    required this.status,
    required this.isFeatured,
    required this.isDigital,
    required this.requiresShipping,
    required this.viewCount,
    required this.soldCount,
    required this.rating,
    required this.reviewCount,
    this.images,
    required this.createdAt,
    required this.updatedAt,
    this.publishedAt,
  });

  String get imageUrl {
    if (images?.isNotEmpty == true) {
      return images!.first.image;
    }
    return '';
  }

  String get categoryName => category?.name ?? '';
  String get brandName => brand?.name ?? '';

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      price: json['price']?.toString() ?? '0',
      comparePrice: json['compare_price']?.toString() ?? '',
      costPrice: json['cost_price']?.toString() ?? '',
      category: json['category'] != null
          ? Category.fromJson(json['category'])
          : null,
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      sku: json['sku'] ?? '',
      barcode: json['barcode'] ?? '',
      modelNumber: json['model_number'] ?? '',
      condition: json['condition'] ?? '',
      stockQuantity: json['stock_quantity'] ?? 0,
      lowStockThreshold: json['low_stock_threshold'] ?? 0,
      trackInventory: json['track_inventory'] ?? true,
      allowBackorders: json['allow_backorders'] ?? false,
      weight: json['weight'] != null
          ? double.tryParse(json['weight'].toString())
          : null,
      length: json['length'] != null
          ? double.tryParse(json['length'].toString())
          : null,
      width: json['width'] != null
          ? double.tryParse(json['width'].toString())
          : null,
      height: json['height'] != null
          ? double.tryParse(json['height'].toString())
          : null,
      metaTitle: json['meta_title'] ?? '',
      metaDescription: json['meta_description'] ?? '',
      keywords: json['keywords'] ?? '',
      status: json['status'] ?? 'draft',
      isFeatured: json['is_featured'] ?? false,
      isDigital: json['is_digital'] ?? false,
      requiresShipping: json['requires_shipping'] ?? true,
      viewCount: json['view_count'] ?? 0,
      soldCount: json['sold_count'] ?? 0,
      rating: json['rating'] != null
          ? double.tryParse(json['rating'].toString()) ?? 0.0
          : 0.0,
      reviewCount: json['review_count'] ?? 0,
      images: json['images'] != null
          ? (json['images'] as List)
                .map((item) => ProductImage.fromJson(item))
                .toList()
          : null,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      publishedAt: json['published_at'] != null
          ? DateTime.tryParse(json['published_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'short_description': shortDescription,
      'price': price,
      'compare_price': comparePrice,
      'cost_price': costPrice,
      'category': category?.toJson(),
      'brand': brand?.toJson(),
      'sku': sku,
      'barcode': barcode,
      'model_number': modelNumber,
      'condition': condition,
      'stock_quantity': stockQuantity,
      'low_stock_threshold': lowStockThreshold,
      'track_inventory': trackInventory,
      'allow_backorders': allowBackorders,
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
      'meta_title': metaTitle,
      'meta_description': metaDescription,
      'keywords': keywords,
      'status': status,
      'is_featured': isFeatured,
      'is_digital': isDigital,
      'requires_shipping': requiresShipping,
      'view_count': viewCount,
      'sold_count': soldCount,
      'rating': rating,
      'review_count': reviewCount,
      'images': images?.map((item) => item.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'published_at': publishedAt?.toIso8601String(),
    };
  }

  bool get isInStock => !trackInventory || stockQuantity > 0;
  bool get isLowStock => trackInventory && stockQuantity <= lowStockThreshold;

  double get discountPercentage {
    final compareVal = double.tryParse(comparePrice) ?? 0.0;
    final priceVal = double.tryParse(price) ?? 0.0;
    if (compareVal > priceVal && compareVal > 0) {
      return ((compareVal - priceVal) / compareVal) * 100;
    }
    return 0.0;
  }
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({required this.id, required this.name, required this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'slug': slug};
  }
}

class Brand {
  final int id;
  final String name;
  final String slug;

  Brand({required this.id, required this.name, required this.slug});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'slug': slug};
  }
}

class ProductImage {
  final int id;
  final String image;
  final String altText;
  final bool isPrimary;
  final int sortOrder;

  ProductImage({
    required this.id,
    required this.image,
    required this.altText,
    required this.isPrimary,
    required this.sortOrder,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      altText: json['alt_text'] ?? '',
      isPrimary: json['is_primary'] ?? false,
      sortOrder: json['sort_order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'alt_text': altText,
      'is_primary': isPrimary,
      'sort_order': sortOrder,
    };
  }
}
