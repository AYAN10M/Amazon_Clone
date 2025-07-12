from django.db import models

from django.contrib.auth.models import User

# Importing necessary validators for fields like price and stock quantity
from django.core.validators import MinValueValidator, MaxValueValidator

# Importing timezone for handling date and time fields
from django.utils import timezone

# uuid is used to generate unique identifiers for products
import uuid


class Category(models.Model):
    """Product categories like Electronics, Books, Clothing etc."""
    name = models.CharField(max_length=100, unique=True)

    # Slug field for SEO-friendly URLs and categorization
    slug = models.SlugField(max_length=100, unique=True)
    description = models.TextField(blank=True)
    image = models.ImageField(upload_to='categories/', blank=True, null=True)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, blank=True, null=True, related_name='subcategories')
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = "Categories"
        ordering = ['name']

    def __str__(self):
        return self.name


class Brand(models.Model):
    """Product brands like Apple, Samsung, Nike etc."""
    name = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(max_length=100, unique=True)
    logo = models.ImageField(upload_to='brands/', blank=True, null=True)
    description = models.TextField(blank=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


"""
    class Seller(models.Model):
        user = models.OneToOneField(User, on_delete=models.CASCADE)
        business_name = models.CharField(max_length=200)
        business_email = models.EmailField()
        business_phone = models.CharField(max_length=20)
        business_address = models.TextField()
        tax_id = models.CharField(max_length=50, blank=True)
        is_verified = models.BooleanField(default=False)
        is_active = models.BooleanField(default=True)
        rating = models.DecimalField(max_digits=3, decimal_places=2, default=0.00)
        total_sales = models.PositiveIntegerField(default=0)
        created_at = models.DateTimeField(auto_now_add=True)

        def __str__(self):
            return self.business_name
"""


class Product(models.Model):
    """Main Product model"""
    CONDITION_CHOICES = [
        ('new', 'New'),
        ('used', 'Used'),
        ('refurbished', 'Refurbished'),
    ]

    STATUS_CHOICES = [
        ('draft', 'Draft'),
        ('active', 'Active'),
        ('inactive', 'Inactive'),
        ('out_of_stock', 'Out of Stock'),
    ]

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, unique=True)
    description = models.TextField()
    short_description = models.CharField(max_length=500, blank=True)

    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products')
    brand = models.ForeignKey(Brand, on_delete=models.SET_NULL, null=True, blank=True)
    # seller = models.ForeignKey(Seller, on_delete=models.CASCADE, related_name='products')

    sku = models.CharField(max_length=100, unique=True)
    barcode = models.CharField(max_length=50, blank=True)
    model_number = models.CharField(max_length=100, blank=True)
    condition = models.CharField(max_length=20, choices=CONDITION_CHOICES, default='new')

    price = models.DecimalField(max_digits=10, decimal_places=2)
    compare_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    cost_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    stock_quantity = models.PositiveIntegerField(default=0)
    low_stock_threshold = models.PositiveIntegerField(default=5)
    track_inventory = models.BooleanField(default=True)
    allow_backorders = models.BooleanField(default=False)

    weight = models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)
    length = models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)
    width = models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)
    height = models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)

    meta_title = models.CharField(max_length=200, blank=True)
    meta_description = models.CharField(max_length=300, blank=True)
    keywords = models.CharField(max_length=500, blank=True)

    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='draft')
    is_featured = models.BooleanField(default=False)
    is_digital = models.BooleanField(default=False)
    requires_shipping = models.BooleanField(default=True)

    view_count = models.PositiveIntegerField(default=0)
    sold_count = models.PositiveIntegerField(default=0)
    rating = models.DecimalField(max_digits=3, decimal_places=2, default=0.00)
    review_count = models.PositiveIntegerField(default=0)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    published_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['category', 'status']),
            # models.Index(fields=['seller', 'status']),
            models.Index(fields=['brand']),
            models.Index(fields=['price']),
            models.Index(fields=['created_at']),
        ]

    def __str__(self):
        return self.title

    @property
    def is_in_stock(self):
        if not self.track_inventory:
            return True
        return self.stock_quantity > 0

    @property
    def is_low_stock(self):
        if not self.track_inventory:
            return False
        return self.stock_quantity <= self.low_stock_threshold

    @property
    def discount_percentage(self):
        if self.compare_price and self.compare_price > self.price:
            return round(((self.compare_price - self.price) / self.compare_price) * 100, 2)
        return 0

    def save(self, *args, **kwargs):
        if self.status == 'active' and not self.published_at:
            self.published_at = timezone.now()
        super().save(*args, **kwargs)


class ProductImage(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images')
    image = models.URLField()
    alt_text = models.CharField(max_length=200, blank=True)
    is_primary = models.BooleanField(default=False)
    sort_order = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['sort_order', 'created_at']

    def __str__(self):
        return f"{self.product.title} - Image {self.sort_order}"


class ProductAttribute(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length=100)
    type = models.CharField(max_length=20, choices=[
        ('text', 'Text'),
        ('number', 'Number'),
        ('boolean', 'Boolean'),
        ('select', 'Select'),
    ], default='text')
    is_required = models.BooleanField(default=False)
    is_variation = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ['name', 'slug']

    def __str__(self):
        return self.name


class ProductAttributeValue(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='attributes')
    attribute = models.ForeignKey(ProductAttribute, on_delete=models.CASCADE)
    value = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ['product', 'attribute']

    def __str__(self):
        return f"{self.product.title} - {self.attribute.name}: {self.value}"


class ProductVariation(models.Model):
    parent_product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='variations')
    sku = models.CharField(max_length=100, unique=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    stock_quantity = models.PositiveIntegerField(default=0)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.parent_product.title} - {self.sku}"


class ProductVariationAttribute(models.Model):
    variation = models.ForeignKey(ProductVariation, on_delete=models.CASCADE, related_name='attributes')
    attribute = models.ForeignKey(ProductAttribute, on_delete=models.CASCADE)
    value = models.CharField(max_length=200)

    class Meta:
        unique_together = ['variation', 'attribute']

    def __str__(self):
        return f"{self.variation.sku} - {self.attribute.name}: {self.value}"


"""
    class ProductReview(models.Model):
        product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='reviews')
        user = models.ForeignKey(User, on_delete=models.CASCADE)
        rating = models.PositiveIntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])
        title = models.CharField(max_length=200, blank=True)
        comment = models.TextField(blank=True)
        is_verified_purchase = models.BooleanField(default=False)
        is_approved = models.BooleanField(default=True)
        helpful_count = models.PositiveIntegerField(default=0)
        created_at = models.DateTimeField(auto_now_add=True)
        updated_at = models.DateTimeField(auto_now=True)

        class Meta:
            unique_together = ['product', 'user']
            ordering = ['-created_at']

        def __str__(self):
            return f"{self.product.title} - {self.rating} stars by {self.user.username}"
"""


class ProductTag(models.Model):
    name = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(max_length=50, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class ProductTagRelation(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='product_tags')
    tag = models.ForeignKey(ProductTag, on_delete=models.CASCADE, related_name='tagged_products')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ['product', 'tag']

    def __str__(self):
        return f"{self.product.title} - {self.tag.name}"


"""
    class Wishlist(models.Model):
        user = models.ForeignKey(User, on_delete=models.CASCADE)
        product = models.ForeignKey(Product, on_delete=models.CASCADE)
        created_at = models.DateTimeField(auto_now_add=True)

        class Meta:
            unique_together = ['user', 'product']

        def __str__(self):
            return f"{self.user.username} - {self.product.title}"
"""


"""
    class ProductComparison(models.Model):
        user = models.ForeignKey(User, on_delete=models.CASCADE)
        product = models.ForeignKey(Product, on_delete=models.CASCADE)
        created_at = models.DateTimeField(auto_now_add=True)

        class Meta:
            unique_together = ['user', 'product']

        def __str__(self):
            return f"{self.user.username} comparing {self.product.title}"
"""
