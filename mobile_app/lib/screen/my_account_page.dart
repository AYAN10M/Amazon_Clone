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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Row(
            children: [
              const SizedBox(width: 8),
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
              _iconCircle(Icons.qr_code_scanner),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildSearchBar() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey, size: 20),
          const SizedBox(width: 8),
          const Expanded(
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
          const SizedBox(width: 8),
          _inlineIcon(Icons.camera_alt_outlined),
          const SizedBox(width: 6),
          _inlineIcon(Icons.mic_none_outlined),
        ],
      ),
    );
  }

  static Widget _inlineIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: Colors.black54),
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

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          // Top row with avatar, name, email, arrow
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile_pic.png'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ayan Haldar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'ayan@example.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ],
          ),

          // Expandable content
          if (isExpanded) ...[
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.phone, size: 18, color: Colors.grey),
                SizedBox(width: 8),
                Text('9876543210'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.home, size: 18, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '123, Flutter Street, Developer Nagar, Code City',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}
