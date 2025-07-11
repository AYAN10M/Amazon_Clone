import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: const BodySection());
  }
}

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Flash Deals - Full Width
          FullWidthCard(
            title: 'Flash Sale',
            icon: Icons.flash_on,
            isLargeScreen: isLargeScreen,
          ),
          const SizedBox(height: 16),

          // Row 1: Electronics (Big) + Deal Cards (Small Stack)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: VerticalCard(
                  title: 'Electronics',
                  icon: Icons.phone_android,
                  isLargeScreen: isLargeScreen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SmallCard(
                      title: 'Today\'s Deals',
                      icon: Icons.local_offer,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 12),
                    SmallCard(
                      title: 'Best Sellers',
                      icon: Icons.star,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 12),
                    SmallCard(
                      title: 'New Items',
                      icon: Icons.new_releases,
                      isLargeScreen: isLargeScreen,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Recommendations - Full Width
          FullWidthCard(
            title: 'Recommended',
            icon: Icons.auto_awesome,
            isLargeScreen: isLargeScreen,
          ),
          const SizedBox(height: 16),

          // Row 2: Small Cards Stack + Fashion (Big)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SmallCard(
                      title: 'Fashion',
                      icon: Icons.checkroom,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 12),
                    SmallCard(
                      title: 'Home & Kitchen',
                      icon: Icons.home,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 12),
                    SmallCard(
                      title: 'Sports',
                      icon: Icons.fitness_center,
                      isLargeScreen: isLargeScreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: VerticalCard(
                  title: 'Books & Learning',
                  icon: Icons.menu_book,
                  isLargeScreen: isLargeScreen,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Recently Viewed - Full Width
          FullWidthCard(
            title: 'Recently Viewed',
            icon: Icons.history,
            isLargeScreen: isLargeScreen,
          ),
          const SizedBox(height: 16),

          // Row 3: Grocery (Big) + Service Cards (Small Stack)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: VerticalCard(
                  title: 'Groceries',
                  icon: Icons.shopping_cart,
                  isLargeScreen: isLargeScreen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SmallCard(
                      title: 'Sell Here',
                      icon: Icons.storefront,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 12),
                    SmallCard(
                      title: 'Gift Cards',
                      icon: Icons.card_giftcard,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 12),
                    SmallCard(
                      title: 'Support',
                      icon: Icons.support_agent,
                      isLargeScreen: isLargeScreen,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Trending Now - Full Width
          FullWidthCard(
            title: 'Trending Now',
            icon: Icons.trending_up,
            isLargeScreen: isLargeScreen,
          ),
          const SizedBox(height: 16),

          // Grid Section - Categories
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: screenWidth < 600 ? 2 : 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: screenWidth < 600 ? 0.85 : 0.78,
            children: [
              GridCard(
                title: 'Baby & Kids',
                icon: Icons.child_care,
                isLargeScreen: isLargeScreen,
              ),
              GridCard(
                title: 'Automotive',
                icon: Icons.directions_car,
                isLargeScreen: isLargeScreen,
              ),
              GridCard(
                title: 'Health Care',
                icon: Icons.medical_services,
                isLargeScreen: isLargeScreen,
              ),
              GridCard(
                title: 'Office',
                icon: Icons.work,
                isLargeScreen: isLargeScreen,
              ),
              GridCard(
                title: 'Pet Care',
                icon: Icons.pets,
                isLargeScreen: isLargeScreen,
              ),
              GridCard(
                title: 'Tools',
                icon: Icons.construction,
                isLargeScreen: isLargeScreen,
              ),
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
                  children: [
                    SmallCard(
                      title: 'Track Order',
                      icon: Icons.local_shipping,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 12),
                    SmallCard(
                      title: 'Wishlist',
                      icon: Icons.favorite,
                      isLargeScreen: isLargeScreen,
                    ),
                    const SizedBox(height: 12),
                    SmallCard(
                      title: 'Coupons',
                      icon: Icons.discount,
                      isLargeScreen: isLargeScreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: VerticalCard(
                  title: 'Digital',
                  icon: Icons.computer,
                  isLargeScreen: isLargeScreen,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Special Offers - Full Width
          FullWidthCard(
            title: 'Special Offers',
            icon: Icons.celebration,
            isLargeScreen: isLargeScreen,
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
  final bool isLargeScreen;

  const FullWidthCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isLargeScreen ? 24 : 18),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: Row(
          children: [
            Icon(icon, size: isLargeScreen ? 44 : 36, color: Colors.white),
            SizedBox(width: isLargeScreen ? 24 : 18),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isLargeScreen ? 20 : 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Goldman',
                  color: Colors.white,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: isLargeScreen ? 22 : 18,
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
  final bool isLargeScreen;

  const VerticalCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: isLargeScreen ? 280 : 250,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade800),
        ),
        padding: EdgeInsets.all(isLargeScreen ? 20 : 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: isLargeScreen ? 60 : 48, color: Colors.white),
            SizedBox(height: isLargeScreen ? 20 : 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isLargeScreen ? 18 : 15,
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
  final bool isLargeScreen;

  const SmallCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: isLargeScreen ? 85 : 75,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade800),
        ),
        padding: EdgeInsets.all(isLargeScreen ? 16 : 12),
        child: Row(
          children: [
            Icon(icon, size: isLargeScreen ? 32 : 26, color: Colors.white),
            SizedBox(width: isLargeScreen ? 16 : 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isLargeScreen ? 15 : 12,
                  fontFamily: 'Goldman',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
  final bool isLargeScreen;

  const GridCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isLargeScreen,
  });

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
        padding: EdgeInsets.all(isLargeScreen ? 20 : 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: isLargeScreen ? 48 : 36, color: Colors.white),
            SizedBox(height: isLargeScreen ? 16 : 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isLargeScreen ? 16 : 13,
                fontWeight: FontWeight.w600,
                fontFamily: 'Goldman',
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
