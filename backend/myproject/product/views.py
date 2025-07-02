from django.shortcuts import render
from rest_framework import viewsets
from .models import Product, Category, Brand
from .serializers import ProductSerializer, CategorySerializer, BrandSerializer

class ProductViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Product.objects.filter(status='active')
    serializer_class = ProductSerializer

class CategoryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class BrandViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
