import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/product_model.dart';

class ProductPage extends StatefulWidget {
  final String? productId;
  const ProductPage({super.key, this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  late Future<Product> productFuture;
  int selectedImageIndex = 0;
  int quantity = 1;
  bool isInWishlist = false;
  final PageController pageController = PageController(viewportFraction: 0.9);
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  bool _isAppBarExpanded = true;

  @override
  void initState() {
    super.initState();
    productFuture = fetchProduct();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    pageController.dispose();
    super.dispose();
  }

  Future<Product> fetchProduct() async {
    final String productId =
        widget.productId ?? '470b112b-3517-44ce-a8a4-ffd9ea6aa697';
    final response = await http.get(
      Uri.parse('http://192.168.29.92:8000/api/products/$productId/'),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<Product>(
        future: productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          } else if (snapshot.hasError) {
            return _buildError(snapshot.error.toString());
          } else if (!snapshot.hasData) {
            return _buildEmptyState();
          }

          final product = snapshot.data!;
          return Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  setState(() {
                    _isAppBarExpanded = notification.metrics.pixels < 100;
                  });
                  return false;
                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    _buildSliverAppBar(product),
                    _buildImageCarousel(product),
                    _buildProductInfo(product),
                    _buildDescriptionSection(product),
                    _buildSpecsSection(product),
                    _buildReviewsSection(product),
                    const SliverToBoxAdapter(child: SizedBox(height: 120)),
                  ],
                ),
              ),
              _buildStickyBottomBar(product),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSliverAppBar(Product product) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Colors.black.withValues(alpha: .95),
      elevation: 0,
      expandedHeight: 60,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: AnimatedOpacity(
        opacity: _isAppBarExpanded ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            if (product.brand?.name.isNotEmpty ?? false)
              Text(
                product.brand!.name,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => _showShareOptions(context),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 20),
            onPressed: () => _showMoreOptions(context),
          ),
        ),
      ],
    );
  }

  Widget _buildImageCarousel(Product product) {
    final images = (product.images?.isNotEmpty ?? false)
        ? product.images!.map((img) => img.image).toList()
        : [product.imageUrl];

    if (selectedImageIndex >= images.length) selectedImageIndex = 0;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() => selectedImageIndex = index);
                _scaleController.reset();
                _scaleController.forward();
              },
              itemBuilder: (context, index) {
                final isActive = index == selectedImageIndex;
                return AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: isActive ? 1.0 : 0.95,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withValues(alpha: 0.02),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.1),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildImageError(),
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress == null
                                ? child
                                : _buildImageLoading(),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            if (images.length > 1) _buildImageIndicators(images.length),
            if (images.length > 1) _buildImageCounter(images.length),
          ],
        ),
      ),
    );
  }

  Widget _buildImageIndicators(int imageCount) {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(imageCount, (index) {
          final isActive = index == selectedImageIndex;
          return GestureDetector(
            onTap: () => pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: isActive ? 24 : 8,
              decoration: BoxDecoration(
                color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildImageCounter(int imageCount) {
    return Positioned(
      top: 30,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Text(
          '${selectedImageIndex + 1} / $imageCount',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo(Product product) {
    final price = double.tryParse(product.price) ?? 0.0;
    final comparePrice = double.tryParse(product.comparePrice) ?? 0.0;
    final hasDiscount = comparePrice > price && comparePrice > 0;

    return SliverToBoxAdapter(
      child: FadeTransition(
        opacity: _fadeController,
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product title and brand
              Text(
                product.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 8),
              if (product.brand?.name.isNotEmpty ?? false)
                Text(
                  'by ${product.brand!.name}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              const SizedBox(height: 16),

              // Rating and reviews
              Row(
                children: [
                  _buildRatingStars(product.rating),
                  const SizedBox(width: 8),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '(${product.reviewCount}+ reviews)',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  _buildStockBadge(product),
                ],
              ),
              const SizedBox(height: 20),

              // Price section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '₹${price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (hasDiscount) ...[
                    Text(
                      '₹${comparePrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${((comparePrice - price) / comparePrice * 100).round()}% OFF',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(Product product) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.description.isEmpty
                  ? 'No description available.'
                  : product.description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecsSection(Product product) {
    final specs = <MapEntry<String, String>>[];
    if (product.sku.isNotEmpty) specs.add(MapEntry('SKU', product.sku));
    if (product.condition.isNotEmpty) {
      specs.add(MapEntry('Condition', product.condition));
    }
    if (product.modelNumber.isNotEmpty) {
      specs.add(MapEntry('Model', product.modelNumber));
    }
    if (product.weight != null) {
      specs.add(MapEntry('Weight', '${product.weight}g'));
    }

    if (specs.isEmpty) return const SliverToBoxAdapter(child: SizedBox());

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Specifications',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...specs
                .map(
                  (spec) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            spec.key,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            spec.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                ,
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsSection(Product product) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _showAllReviews(context),
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildRatingStars(product.rating),
                const SizedBox(width: 12),
                Text(
                  '${product.rating.toStringAsFixed(1)} out of 5',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${product.reviewCount}+ customer reviews',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockBadge(Product product) {
    final inStock = product.stockQuantity > 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: inStock
            ? Colors.green.withOpacity(0.2)
            : Colors.red.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: inStock
              ? Colors.green.withOpacity(0.5)
              : Colors.red.withOpacity(0.5),
        ),
      ),
      child: Text(
        inStock ? 'In Stock' : 'Out of Stock',
        style: TextStyle(
          color: inStock ? Colors.green : Colors.red,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStickyBottomBar(Product product) {
    final inStock = product.stockQuantity > 0;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
        ),
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              _buildQuantitySelector(product),
              const SizedBox(width: 12),
              _buildWishlistButton(),
              const SizedBox(width: 12),
              Expanded(flex: 2, child: _buildAddToCartButton(inStock)),
              const SizedBox(width: 8),
              Expanded(flex: 2, child: _buildBuyNowButton(inStock)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantitySelector(Product product) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: quantity > 1
                  ? Colors.white
                  : Colors.white.withOpacity(0.3),
              size: 18,
            ),
            onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$quantity',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: quantity < product.stockQuantity
                  ? Colors.white
                  : Colors.white.withOpacity(0.3),
              size: 18,
            ),
            onPressed: quantity < product.stockQuantity
                ? () => setState(() => quantity++)
                : null,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {
          setState(() => isInWishlist = !isInWishlist);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isInWishlist ? 'Added to wishlist' : 'Removed from wishlist',
                style: const TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: Icon(
          isInWishlist ? Icons.favorite : Icons.favorite_border,
          color: isInWishlist ? Colors.red : Colors.white,
          size: 20,
        ),
        constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
      ),
    );
  }

  Widget _buildAddToCartButton(bool inStock) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: inStock ? Colors.white : Colors.white.withOpacity(0.1),
        foregroundColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: inStock ? () => _addToCart() : null,
      child: Text(
        'Add to Cart',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: inStock ? Colors.black : Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildBuyNowButton(bool inStock) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withOpacity(inStock ? 1.0 : 0.3)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: inStock ? () => _buyNow() : null,
      child: Text(
        'Buy Now',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: inStock ? Colors.white : Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star, color: Colors.amber, size: 16);
        } else if (index < rating) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 16);
        }
        return Icon(
          Icons.star_border,
          color: Colors.amber.withOpacity(0.3),
          size: 16,
        );
      }),
    );
  }

  // Helper widgets for loading states
  Widget _buildLoading() =>
      const Center(child: CircularProgressIndicator(color: Colors.white));

  Widget _buildImageLoading() => Container(
    color: Colors.white.withOpacity(0.05),
    child: const Center(child: CircularProgressIndicator(color: Colors.white)),
  );

  Widget _buildImageError() => Container(
    color: Colors.white.withOpacity(0.05),
    child: Icon(
      Icons.broken_image_outlined,
      color: Colors.white.withOpacity(0.3),
      size: 60,
    ),
  );

  Widget _buildEmptyState() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.inventory_2_outlined,
          color: Colors.white.withOpacity(0.3),
          size: 80,
        ),
        const SizedBox(height: 16),
        Text(
          'No product data available',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
        ),
      ],
    ),
  );

  Widget _buildError(String error) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, color: Colors.red, size: 60),
        const SizedBox(height: 16),
        Text(
          'Error loading product',
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          error,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () => setState(() => productFuture = fetchProduct()),
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ],
    ),
  );

  // Action methods
  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added $quantity item(s) to cart'),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _buyNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Proceeding to checkout'),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showShareOptions(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Share feature coming soon!')));
  }

  void _showAllReviews(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reviews feature coming soon!')),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black.withOpacity(0.95),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.report_outlined, color: Colors.white),
              title: const Text(
                'Report Product',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Report feature coming soon!')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.white),
              title: const Text(
                'Help & Support',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Help feature coming soon!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
