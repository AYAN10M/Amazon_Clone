import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final fontScale = width < 350
        ? 0.85
        : width < 400
        ? 0.95
        : 1.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyProfile(fontScale: fontScale),
              SizedBox(height: 8),
              _buildQuickActionsSection(context, fontScale),
              SizedBox(height: 8),
              _buildOrdersSection(context, fontScale),
              SizedBox(height: 8),
              _buildBuyAgainSection(context, fontScale),
              SizedBox(height: 8),
              _buildListsSection(context, fontScale),
              SizedBox(height: 8),
              _buildAccountSection(context, fontScale),
              SizedBox(height: 8),
              _buildRewardsSection(context, fontScale),
              SizedBox(height: 8),
              _buildHelpSection(context, fontScale),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection(BuildContext context, double fontScale) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildActionButton(
                context,
                'Your Orders',
                Icons.shopping_bag_outlined,
                fontScale,
              ),
              SizedBox(width: 8),
              _buildActionButton(
                context,
                'Buy Again',
                Icons.refresh_outlined,
                fontScale,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              _buildActionButton(
                context,
                'Account',
                Icons.person_outline,
                fontScale,
              ),
              SizedBox(width: 8),
              _buildActionButton(
                context,
                'Lists',
                Icons.list_alt_outlined,
                fontScale,
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
    double fontScale,
  ) {
    return Expanded(
      child: Container(
        height: 44,
        margin: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 1.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16 * fontScale, color: Colors.white),
              SizedBox(width: 6),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 12 * fontScale,
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
      ),
    );
  }

  Widget _buildSectionContainer({required Widget child, EdgeInsets? margin}) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
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
    double fontScale = 1.0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20 * fontScale, color: Colors.white),
            SizedBox(width: 8),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16 * fontScale,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Goldman',
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
        if (subtitle != null) ...[
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
                fontFamily: 'Goldman',
                fontSize: 11 * fontScale,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildOrdersSection(BuildContext context, double fontScale) {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.shopping_cart_outlined,
            title: 'Your Orders',
            subtitle: 'Hi! You have no recent orders.',
            fontScale: fontScale,
          ),
          SizedBox(height: 12),
          _buildActionButtonFull(context, 'Return to the Homepage', fontScale),
        ],
      ),
    );
  }

  Widget _buildBuyAgainSection(BuildContext context, double fontScale) {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.refresh_outlined,
            title: 'Buy Again',
            subtitle: 'See what others are reordering',
            fontScale: fontScale,
          ),
          SizedBox(height: 12),
          _buildActionButtonFull(context, 'Return to the Homepage', fontScale),
        ],
      ),
    );
  }

  Widget _buildListsSection(BuildContext context, double fontScale) {
    return _buildSectionContainer(
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
                  fontSize: 12 * fontScale,
                ),
              ),
            ),
            fontScale: fontScale,
          ),
          SizedBox(height: 12),
          _buildActionButtonFull(context, 'Create Your First List', fontScale),
        ],
      ),
    );
  }

  Widget _buildAccountSection(BuildContext context, double fontScale) {
    return _buildSectionContainer(
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
                  fontSize: 12 * fontScale,
                ),
              ),
            ),
            fontScale: fontScale,
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomTextButton(label: 'Your Orders', fontScale: fontScale),
                CustomTextButton(label: 'Your Addresses', fontScale: fontScale),
                CustomTextButton(label: 'Amazon Pay UPI', fontScale: fontScale),
                CustomTextButton(
                  label: 'Subscribe and Save',
                  fontScale: fontScale,
                ),
                CustomTextButton(label: 'Your Wish List', fontScale: fontScale),
                CustomTextButton(label: 'Your Messages', fontScale: fontScale),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardsSection(BuildContext context, double fontScale) {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.card_giftcard,
            title: 'Rewards',
            fontScale: fontScale,
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildRewardItem(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'Cashback earned',
                        value: '₹0.00',
                        fontScale: fontScale,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 36,
                      color: Colors.grey.shade600,
                    ),
                    Expanded(
                      child: _buildRewardItem(
                        icon: Icons.local_offer_outlined,
                        title: 'Collected offers',
                        value: '0',
                        fontScale: fontScale,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.shade600,
                ),
                SizedBox(height: 8),
                _buildRewardItem(
                  icon: Icons.wallet_giftcard_outlined,
                  title: 'Scratch cards',
                  value: '0',
                  fontScale: fontScale,
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
    double fontScale = 1.0,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 10 * fontScale,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Goldman',
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 13 * fontScale),
              SizedBox(width: 2),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Goldman',
                  fontSize: 13 * fontScale,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(BuildContext context, double fontScale) {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.help_center_outlined,
            title: 'Need more help?',
            fontScale: fontScale,
          ),
          SizedBox(height: 12),
          _buildActionButtonFull(context, 'Visit Customer Service', fontScale),
        ],
      ),
    );
  }

  Widget _buildActionButtonFull(
    BuildContext context,
    String text,
    double fontScale,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade400, width: 1.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12 * fontScale,
              fontFamily: 'Goldman',
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

// MyProfile - Responsive and overflow-safe
class MyProfile extends StatefulWidget {
  final double fontScale;
  const MyProfile({required this.fontScale, super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final fontScale = widget.fontScale;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
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
                    radius: 26 * fontScale,
                    backgroundImage: const AssetImage(
                      'assets/images/profile_pic.png',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Ayan Haldar',
                          style: TextStyle(
                            fontSize: 16 * fontScale,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Goldman',
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 4),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'ayan@example.com',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Goldman',
                            fontSize: 11 * fontScale,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                      size: 20 * fontScale,
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
              SizedBox(height: 12),
              Container(height: 1, color: Colors.grey.shade700),
              SizedBox(height: 10),
              _buildContactInfo(
                Icons.phone,
                '9876543210',
                fontScale: fontScale,
              ),
              SizedBox(height: 8),
              _buildContactInfo(
                Icons.home,
                '123, Flutter Street, Developer Nagar, Code City',
                isAddress: true,
                fontScale: fontScale,
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
    double fontScale = 1.0,
  }) {
    return Row(
      crossAxisAlignment: isAddress
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5 * fontScale),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 14 * fontScale),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Goldman',
              fontSize: 12 * fontScale,
              fontWeight: FontWeight.w500,
            ),
            maxLines: isAddress ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// CustomTextButton for horizontal scroll in Account section
class CustomTextButton extends StatelessWidget {
  final String label;
  final double fontScale;
  const CustomTextButton({
    required this.label,
    required this.fontScale,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade400, width: 1.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11 * fontScale,
              fontFamily: 'Goldman',
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
