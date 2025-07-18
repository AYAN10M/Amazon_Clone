import 'package:flutter/material.dart';
import 'package:mobile_app/components/reusable_components/custom_appbar.dart';
import 'package:mobile_app/screen/cart_page.dart';
import 'package:mobile_app/screen/dashboard.dart';
import 'package:mobile_app/screen/homepage.dart';
import 'package:mobile_app/screen/my_account_page.dart';
import 'package:mobile_app/screen/search_result_page.dart';

class MyLayout extends StatefulWidget {
  const MyLayout({super.key});

  @override
  State<MyLayout> createState() => _MyLayoutState();
}

class _MyLayoutState extends State<MyLayout> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  Widget? _searchPage;

  final List<Widget> _pages = [
    const HomePage(),
    const MyAccountPage(),
    const MyCartPage(),
    const MyDashboard(),
  ];

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.shopping_cart_outlined,
    Icons.menu,
  ];

  void _handleTabTap(int index) {
    setState(() {
      _selectedIndex = index;
      _searchPage = null;
      _searchController.clear();
    });
  }

  void _handleSearchSubmitted(String query) {
    if (query.trim().isEmpty) return;

    setState(() {
      _searchPage = SearchResultsPage(
        query: query.trim(),
        onClearSearch: () {
          setState(() {
            _searchPage = null;
            _searchController.clear();
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: CustomAppBar(
        searchController: _searchController,
        onCameraTap: () {},
        onMicTap: () {},
        onSearchSubmitted: _handleSearchSubmitted,
        showBackButton: _searchPage != null,
        onBack: () {
          setState(() {
            _searchPage = null;
            _searchController.clear();
          });
        },
      ),
      body: _searchPage ?? _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 56,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_icons.length, (index) {
            final bool isSelected = _selectedIndex == index;
            return Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _handleTabTap(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _icons[index],
                      size: 24,
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 3,
                      width: 24,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
