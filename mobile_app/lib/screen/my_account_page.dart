import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const DashboardCustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyProfile(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: buttonStyle,
                          child: const Text('Your Orders'),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: buttonStyle,
                          child: const Text('Buy Again'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: buttonStyle,
                          child: const Text('Account'),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: buttonStyle,
                          child: const Text('Lists'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Icon(Icons.shopping_cart_outlined, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Your Orders',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Hi! You have no recent orders.',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: buttonStyle,
                      child: const Text(
                        'Return to the Homepage',
                        style: TextStyle(fontSize: 14, fontFamily: 'Goldman'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Icon(Icons.shopify_outlined, size: 30),
                      SizedBox(width: 8),
                      Text(
                        'Buy Again',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'See what others are reordering',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: buttonStyle,
                      child: const Text(
                        'Return to the Homepage',
                        style: TextStyle(fontSize: 14, fontFamily: 'Goldman'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.format_list_numbered_outlined, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Your lists',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.blue.shade700,

                            fontFamily: 'Goldman',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'See what others are reordering',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: buttonStyle,
                      child: const Text(
                        'Return to the Homepage',
                        style: TextStyle(fontSize: 14, fontFamily: 'Goldman'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.account_box_outlined, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Your Account',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.blue.shade700,

                            fontFamily: 'Goldman',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: const [
                        CustomTextButton(label: 'Your Orders'),
                        CustomTextButton(label: 'Your Addresses'),
                        CustomTextButton(label: 'Amazon Pay UPI'),
                        CustomTextButton(label: 'Subscribe and Save'),
                        CustomTextButton(label: 'Your Wish List'),
                        CustomTextButton(label: 'Your Messages'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.card_giftcard, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Rewards',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Cashback earned',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Goldman',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_balance_wallet_outlined,
                                        size: 16,
                                      ),
                                      Text(
                                        ' ₹0.00',
                                        style: TextStyle(
                                          fontFamily: 'Goldman',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Text(
                                    'Collected offers',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Goldman',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_offer_outlined,
                                        size: 16,
                                      ),
                                      Text(
                                        ' 0',
                                        style: TextStyle(fontFamily: 'Goldman'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                'Scratch card',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Goldman',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.wallet_giftcard_outlined,
                                    size: 16,
                                  ),
                                  Text(
                                    ' 0',
                                    style: TextStyle(fontFamily: 'Goldman'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.help_center_outlined, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Need more help?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Goldman',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: buttonStyle,
                      child: const Text(
                        'Visit Customer Service',
                        style: TextStyle(fontSize: 14, fontFamily: 'Goldman'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DashboardCustomAppBar

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

// MyProfile

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
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile_pic.png'),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ayan Haldar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Goldman',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'ayan@example.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Goldman',
                        fontSize: 12,
                      ),
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
          if (isExpanded) ...[
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.phone, size: 18, color: Colors.grey),
                SizedBox(width: 8),
                Text('9876543210'),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

class CustomTextButton extends StatelessWidget {
  final String label;

  const CustomTextButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: MediaQuery.of(context).size.height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Goldman',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
