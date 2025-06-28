import 'package:flutter/material.dart';

class HomePageCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomePageCustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(210);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFfceabb), // Light yellow
              Color(0xFFf8b500), // Golden
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TopButton(
                      label: 'Pay',
                      icon: Icons.account_balance_wallet_outlined,
                      onTap: () {},
                      gradientColors: [
                        Colors.yellow.shade200,
                        Colors.orange.shade300,
                      ],
                    ),
                    TopButton(
                      label: 'Bazaar',
                      icon: Icons.shopping_basket_outlined,
                      onTap: () {},
                      gradientColors: [
                        Colors.pink.shade100,
                        Colors.pink.shade200,
                      ],
                    ),
                    TopButton(
                      label: 'MX Player',
                      icon: Icons.play_circle_outline,
                      onTap: () {},
                      gradientColors: [
                        Colors.blue.shade100,
                        Colors.blue.shade300,
                      ],
                    ),
                    TopButton(
                      label: 'Medical',
                      icon: Icons.medical_services_outlined,
                      onTap: () {},
                      gradientColors: [
                        Colors.green.shade100,
                        Colors.green.shade300,
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Search Bar Row
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 1.5),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(Icons.search, color: Colors.black),
                            const SizedBox(width: 5),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 0,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.mic_none_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.qr_code_scanner_outlined,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                // Location Row
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Delivering to Bardhaman 713321',
                        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Update',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final List<Color>? gradientColors;

  const TopButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              gradient: gradientColors != null
                  ? LinearGradient(
                      colors: gradientColors!,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: gradientColors == null ? Colors.white : null,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(20),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(child: Icon(icon, color: Colors.black, size: 26)),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
