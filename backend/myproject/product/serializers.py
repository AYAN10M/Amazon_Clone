from rest_framework import serializers
from .models import Product, Category, Brand, ProductImage

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'slug']

class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ['id', 'name', 'slug']

class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductImage
        fields = ['id', 'image', 'alt_text', 'is_primary', 'sort_order']

class ProductSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    brand = BrandSerializer(read_only=True)
    images = ProductImageSerializer(many=True, read_only=True)

    class Meta:
        model = Product
        fields = [
            'id', 'title', 'slug', 'description', 'short_description',
            'category', 'brand', 'sku', 'barcode', 'model_number',
            'condition', 'price', 'compare_price', 'cost_price',
            'stock_quantity', 'low_stock_threshold', 'track_inventory', 'allow_backorders',
            'weight', 'length', 'width', 'height',
            'meta_title', 'meta_description', 'keywords',
            'status', 'is_featured', 'is_digital', 'requires_shipping',
            'view_count', 'sold_count', 'rating', 'review_count',
            'created_at', 'updated_at', 'published_at',
            'images',
        ]
