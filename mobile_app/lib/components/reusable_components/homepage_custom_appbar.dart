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
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TopButton(
                    label: 'Pay',
                    icon: Icons.account_balance_wallet_outlined,
                    onTap: () {},
                    bgColor: Colors.yellow[100],
                  ),
                  TopButton(
                    label: 'Bazaar',
                    icon: Icons.shopping_basket_outlined,
                    onTap: () {},
                    bgColor: Colors.pink[50],
                  ),
                  TopButton(
                    label: 'MX Player',
                    icon: Icons.play_circle_outline,
                    onTap: () {},
                    bgColor: Colors.blue[50],
                  ),
                  TopButton(
                    label: 'Medical',
                    icon: Icons.medical_services_outlined,
                    onTap: () {},
                    bgColor: Colors.green[50],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Search Bar Row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
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
                                hintText: 'Search or ask a question...',
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ),
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

              const SizedBox(height: 6),

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
                    child: const Text('Update', style: TextStyle(fontSize: 13)),
                  ),
                ],
              ),
            ],
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
  final Color? bgColor;

  const TopButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.bgColor,
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
              color: bgColor ?? Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.black,
                size: 26,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
