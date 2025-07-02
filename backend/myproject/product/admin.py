from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Category, Brand, Product, ProductImage, ProductAttribute, ProductAttributeValue, ProductVariation, ProductVariationAttribute, ProductTag, ProductTagRelation

admin.site.register(Category)
admin.site.register(Brand)
admin.site.register(Product)
admin.site.register(ProductImage)
admin.site.register(ProductAttribute)
admin.site.register(ProductAttributeValue)
admin.site.register(ProductVariation)
admin.site.register(ProductVariationAttribute)
admin.site.register(ProductTag)
admin.site.register(ProductTagRelation)
