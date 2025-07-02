import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyProfile(),
              SizedBox(height: screenWidth * 0.02),
              _buildQuickActionsSection(context, screenWidth),
              SizedBox(height: screenWidth * 0.02),
              _buildOrdersSection(context, screenWidth),
              SizedBox(height: screenWidth * 0.02),
              _buildBuyAgainSection(context, screenWidth),
              SizedBox(height: screenWidth * 0.02),
              _buildListsSection(context, screenWidth),
              SizedBox(height: screenWidth * 0.02),
              _buildAccountSection(context, screenWidth),
              SizedBox(height: screenWidth * 0.02),
              _buildRewardsSection(context, screenWidth),
              SizedBox(height: screenWidth * 0.02),
              _buildHelpSection(context, screenWidth),
              SizedBox(height: screenWidth * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection(BuildContext context, double screenWidth) {
    final isWide = screenWidth > 500;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: isWide
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildActionButton(
                    context,
                    'Your Orders',
                    Icons.shopping_bag_outlined,
                    screenWidth,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    context,
                    'Buy Again',
                    Icons.refresh_outlined,
                    screenWidth,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    context,
                    'Account',
                    Icons.person_outline,
                    screenWidth,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    context,
                    'Lists',
                    Icons.list_alt_outlined,
                    screenWidth,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        context,
                        'Your Orders',
                        Icons.shopping_bag_outlined,
                        screenWidth,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildActionButton(
                        context,
                        'Buy Again',
                        Icons.refresh_outlined,
                        screenWidth,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        context,
                        'Account',
                        Icons.person_outline,
                        screenWidth,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildActionButton(
                        context,
                        'Lists',
                        Icons.list_alt_outlined,
                        screenWidth,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    IconData icon,
    double screenWidth,
  ) {
    return SizedBox(
      height: screenWidth * 0.13,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade400, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: screenWidth * 0.045, color: Colors.white),
            SizedBox(width: 8),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'Goldman',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionContainer({
    required Widget child,
    EdgeInsets? margin,
    required double screenWidth,
  }) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    required double screenWidth,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: screenWidth * 0.06, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Goldman',
                  color: Colors.white,
                ),
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
        if (subtitle != null) ...[
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 36),
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
                fontFamily: 'Goldman',
                fontSize: screenWidth * 0.032,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildOrdersSection(BuildContext context, double screenWidth) {
    return _buildSectionContainer(
      screenWidth: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.shopping_cart_outlined,
            title: 'Your Orders',
            subtitle: 'Hi! You have no recent orders.',
            screenWidth: screenWidth,
          ),
          SizedBox(height: screenWidth * 0.05),
          _buildActionButtonFull(
            context,
            'Return to the Homepage',
            screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildBuyAgainSection(BuildContext context, double screenWidth) {
    return _buildSectionContainer(
      screenWidth: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.refresh_outlined,
            title: 'Buy Again',
            subtitle: 'See what others are reordering',
            screenWidth: screenWidth,
          ),
          SizedBox(height: screenWidth * 0.05),
          _buildActionButtonFull(
            context,
            'Return to the Homepage',
            screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildListsSection(BuildContext context, double screenWidth) {
    return _buildSectionContainer(
      screenWidth: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.format_list_numbered_outlined,
            title: 'Your lists',
            subtitle: 'Create and manage your shopping lists',
            trailing: TextButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontFamily: 'Goldman',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            screenWidth: screenWidth,
          ),
          SizedBox(height: screenWidth * 0.05),
          _buildActionButtonFull(
            context,
            'Create Your First List',
            screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection(BuildContext context, double screenWidth) {
    return _buildSectionContainer(
      screenWidth: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.account_box_outlined,
            title: 'Your Account',
            trailing: TextButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontFamily: 'Goldman',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            screenWidth: screenWidth,
          ),
          SizedBox(height: screenWidth * 0.04),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
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
    );
  }

  Widget _buildRewardsSection(BuildContext context, double screenWidth) {
    return _buildSectionContainer(
      screenWidth: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.card_giftcard,
            title: 'Rewards',
            screenWidth: screenWidth,
          ),
          SizedBox(height: screenWidth * 0.04),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(screenWidth * 0.05),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildRewardItem(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Cashback\nearned',
                      value: '₹0.00',
                      screenWidth: screenWidth,
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey.shade600,
                    ),
                    _buildRewardItem(
                      icon: Icons.local_offer_outlined,
                      title: 'Collected\noffers',
                      value: '0',
                      screenWidth: screenWidth,
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.04),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.shade600,
                ),
                SizedBox(height: screenWidth * 0.04),
                _buildRewardItem(
                  icon: Icons.wallet_giftcard_outlined,
                  title: 'Scratch cards',
                  value: '0',
                  screenWidth: screenWidth,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardItem({
    required IconData icon,
    required String title,
    required String value,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.032,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'Goldman',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: screenWidth * 0.04),
              SizedBox(width: 4),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Goldman',
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(BuildContext context, double screenWidth) {
    return _buildSectionContainer(
      screenWidth: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.help_center_outlined,
            title: 'Need more help?',
            screenWidth: screenWidth,
          ),
          SizedBox(height: screenWidth * 0.05),
          _buildActionButtonFull(
            context,
            'Visit Customer Service',
            screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtonFull(
    BuildContext context,
    String text,
    double screenWidth,
  ) {
    return SizedBox(
      width: double.infinity,
      height: screenWidth * 0.13,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade400, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontFamily: 'Goldman',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// MyProfile - Responsive and animated
class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(screenWidth * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade400, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: screenWidth * 0.085,
                    backgroundImage: const AssetImage(
                      'assets/images/profile_pic.png',
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ayan Haldar',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Goldman',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'ayan@example.com',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Goldman',
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: screenWidth * 0.06,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                ),
              ],
            ),
            if (isExpanded) ...[
              SizedBox(height: screenWidth * 0.05),
              Container(height: 1, color: Colors.grey.shade700),
              SizedBox(height: screenWidth * 0.04),
              _buildContactInfo(
                Icons.phone,
                '9876543210',
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenWidth * 0.03),
              _buildContactInfo(
                Icons.home,
                '123, Flutter Street, Developer Nagar, Code City',
                isAddress: true,
                screenWidth: screenWidth,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(
    IconData icon,
    String text, {
    bool isAddress = false,
    required double screenWidth,
  }) {
    return Row(
      crossAxisAlignment: isAddress
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.015),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: screenWidth * 0.045),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Goldman',
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// CustomTextButton for horizontal scroll in Account section
class CustomTextButton extends StatelessWidget {
  final String label;
  const CustomTextButton({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.025),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade400, width: 1.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.02,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.032,
            fontFamily: 'Goldman',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
