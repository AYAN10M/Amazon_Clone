import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F5),
      body: Column(
        children: const [
          DashboardCustomAppBar(),
          Expanded(child: BodySection()),
        ],
      ),
    );
  }
}

// ===================== CUSTOM APP BAR =====================

class DashboardCustomAppBar extends StatelessWidget {
  const DashboardCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 6),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search or ask a question...',
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic_none_outlined, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_scanner, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const HorizontalNavBar(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

// ===================== HORIZONTAL NAV BAR =====================

class HorizontalNavBar extends StatelessWidget {
  const HorizontalNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: const [
            NavItem(icon: Icons.list_alt, label: 'Orders'),
            NavItem(icon: Icons.refresh, label: 'Buy Again'),
            NavItem(icon: Icons.person_outline, label: 'Account'),
            NavItem(icon: Icons.bookmark_border, label: 'Lists'),
            NavItem(icon: Icons.shopping_cart_outlined, label: 'Cart'),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const NavItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 90,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 26, color: Color(0xFF333366)),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================= BODY SECTION =========================

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: screenWidth < 600 ? 2 : 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
            children: const [
              GridCard(
                title: "Top Picks",
                icon: Icons.auto_awesome,
                backgroundImage: "assets/images/plant_background.jpeg",
              ),
              GridCard(
                title: "Amazon Pay",
                icon: Icons.payment,
                backgroundImage: "assets/images/plant_background.jpeg",
              ),
              GridCard(
                title: "Mobiles & Electronics",
                icon: Icons.phone_android,
                backgroundImage: "assets/images/plant_background.jpeg",
              ),
              GridCard(
                title: "Amazon Bazaar",
                icon: Icons.shopping_bag,
                backgroundImage: "assets/images/plant_background.jpeg",
              ),
              GridCard(
                title: "Deals & Savings",
                icon: Icons.local_offer,
                backgroundImage: "assets/images/plant_background.jpeg",
              ),
              GridCard(
                title: "Groceries & Pet Supplies",
                icon: Icons.pets,
                backgroundImage: "assets/images/plant_background.jpeg",
              ),
              GridCard(
                title: "Account & Help",
                icon: Icons.help_center,
                backgroundImage: "assets/images/plant_background.jpeg",
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ========================= GRID CARD =========================

class GridCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String backgroundImage;

  const GridCard({
    super.key,
    required this.title,
    required this.icon,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.6),
                Colors.black.withValues(alpha: 0.3),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
                child: Icon(icon, size: 32, color: Colors.deepPurple),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black38,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
