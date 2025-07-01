import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: const BodySection(),
    );
  }
}

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar Card - Full Width
          const FullWidthCard(
            title: 'Search Products & Brands',
            icon: Icons.search,
          ),
          const SizedBox(height: 16),

          // Flash Deals - Full Width
          const FullWidthCard(
            title: 'Flash Sale - Limited Time Offers',
            icon: Icons.flash_on,
          ),
          const SizedBox(height: 16),

          // Row 1: Electronics (Big) + Deal Cards (Small Stack)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: VerticalCard(
                  title: 'Mobiles & Electronics',
                  icon: Icons.phone_android,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    SmallCard(
                      title: 'Deals of the Day',
                      icon: Icons.local_offer,
                    ),
                    SizedBox(height: 12),
                    SmallCard(title: 'Best Sellers', icon: Icons.star),
                    SizedBox(height: 12),
                    SmallCard(title: 'New Arrivals', icon: Icons.new_releases),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Recommendations - Full Width
          const FullWidthCard(
            title: 'Recommended For You',
            icon: Icons.auto_awesome,
          ),
          const SizedBox(height: 16),

          // Row 2: Small Cards Stack + Fashion (Big)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    SmallCard(title: 'Fashion & Beauty', icon: Icons.checkroom),
                    SizedBox(height: 12),
                    SmallCard(title: 'Home & Kitchen', icon: Icons.home),
                    SizedBox(height: 12),
                    SmallCard(
                      title: 'Sports & Fitness',
                      icon: Icons.fitness_center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                flex: 3,
                child: VerticalCard(
                  title: 'Books & Education',
                  icon: Icons.menu_book,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Recently Viewed - Full Width
          const FullWidthCard(
            title: 'Continue Shopping - Recently Viewed',
            icon: Icons.history,
          ),
          const SizedBox(height: 16),

          // Row 3: Grocery (Big) + Service Cards (Small Stack)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: VerticalCard(
                  title: 'Groceries & Daily Needs',
                  icon: Icons.shopping_cart,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    SmallCard(
                      title: 'Sell on Our Site',
                      icon: Icons.storefront,
                    ),
                    SizedBox(height: 12),
                    SmallCard(title: 'Gift Cards', icon: Icons.card_giftcard),
                    SizedBox(height: 12),
                    SmallCard(
                      title: 'Customer Service',
                      icon: Icons.support_agent,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Trending Now - Full Width
          const FullWidthCard(
            title: 'Trending Now - Hot Products',
            icon: Icons.trending_up,
          ),
          const SizedBox(height: 16),

          // Grid Section - Categories
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: screenWidth < 600 ? 2 : 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.78,
            children: const [
              GridCard(title: 'Baby & Kids', icon: Icons.child_care),
              GridCard(title: 'Automotive', icon: Icons.directions_car),
              GridCard(
                title: 'Health & Personal Care',
                icon: Icons.medical_services,
              ),
              GridCard(title: 'Office Supplies', icon: Icons.work),
              GridCard(title: 'Pet Supplies', icon: Icons.pets),
              GridCard(title: 'Tools & Hardware', icon: Icons.construction),
            ],
          ),

          const SizedBox(height: 16),

          // Row 4: Service Cards Stack + Digital (Big)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    SmallCard(
                      title: 'Track Your Order',
                      icon: Icons.local_shipping,
                    ),
                    SizedBox(height: 12),
                    SmallCard(title: 'Your Wishlist', icon: Icons.favorite),
                    SizedBox(height: 12),
                    SmallCard(title: 'Coupons & Offers', icon: Icons.discount),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                flex: 3,
                child: VerticalCard(
                  title: 'Digital & Software',
                  icon: Icons.computer,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Special Offers - Full Width
          const FullWidthCard(
            title: 'Special Offers Just For You',
            icon: Icons.celebration,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class FullWidthCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const FullWidthCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Goldman',
                  color: Colors.white,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const VerticalCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade800),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Goldman',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const SmallCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade800),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, size: 28, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'Goldman',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const GridCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade800),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Goldman',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
