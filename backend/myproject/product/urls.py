from rest_framework.routers import DefaultRouter
from django.urls import path, include
from .views import ProductDetailAPIView, ProductViewSet, CategoryViewSet, BrandViewSet

router = DefaultRouter()
router.register(r'products', ProductViewSet, basename='product')
router.register(r'categories', CategoryViewSet, basename='category')
router.register(r'brands', BrandViewSet, basename='brand')

urlpatterns = [
    path('', include(router.urls)),
    path('products/<uuid:id>/', ProductDetailAPIView.as_view(), name='product-detail'),
]
