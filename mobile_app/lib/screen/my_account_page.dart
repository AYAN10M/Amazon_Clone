import 'dart:ui';
import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardCustomAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyProfile(),
            SizedBox(height: 24),
            // Add more account widgets or cards here
          ],
        ),
      ),
    );
  }
}

// =================== APP BAR ===================

class DashboardCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DashboardCustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(112);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/amazon_logo.png', height: 24),
                const Spacer(),
                _topBarIcon(Icons.settings_outlined),
                const SizedBox(width: 12),
                _topBarIcon(Icons.notifications_none_outlined),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildSearchBar()),
                const SizedBox(width: 8),
                _iconCircle(Icons.camera_alt_outlined),
                _iconCircle(Icons.mic_none_outlined),
                _iconCircle(Icons.qr_code_scanner),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildSearchBar() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.grey, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Search products, brands and more...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _topBarIcon(IconData icon) {
    return Icon(icon, size: 22, color: Colors.black87);
  }

  static Widget _iconCircle(IconData icon) {
    return Container(
      height: 36,
      width: 36,
      margin: const EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IconButton(
        icon: Icon(icon, size: 18, color: Colors.black54),
        onPressed: () {},
        splashRadius: 20,
      ),
    );
  }
}

// =================== PROFILE CARD ===================

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 400;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/background_img.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage(
                      'assets/images/profile_pic.png',
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Name & Email
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ayan Haldar',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 18 : 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ayan@example.com',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 13 : 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                // Settings Icon
                const Icon(Icons.settings, color: Colors.white70, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
