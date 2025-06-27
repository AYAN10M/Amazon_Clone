import 'package:flutter/material.dart';
import 'package:mobile_app/screen/cart_page.dart';
import 'package:mobile_app/screen/dashboard.dart';
import 'package:mobile_app/screen/homepage.dart';
import 'package:mobile_app/screen/my_account_page.dart';

class MyLayout extends StatefulWidget {
  const MyLayout({super.key});

  @override
  State<MyLayout> createState() => _MyLayoutState();
}

class _MyLayoutState extends State<MyLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(),
    const MyAccountPage(),
    const MyCartPage(),
    const MyDashboard(),
  ];

  final List<String> _labels = ['Home', 'Account', 'Cart', 'Menu'];
  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.shopping_cart_outlined,
    Icons.menu,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),

          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withAlpha(50),
          //     spreadRadius: 0,
          //     blurRadius: 10,
          //     offset: const Offset(0, -0.5),
          //   ),
          // ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey[800],
            backgroundColor: Colors.white,
            iconSize: 26,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (int index) => setState(() => _selectedIndex = index),
            items: List.generate(_labels.length, (index) {
              return BottomNavigationBarItem(
                icon: Icon(_icons[index]),
                label: _labels[index],
              );
            }),
          ),
        ),
      ),
    );
  }
}
