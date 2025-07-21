import 'package:flutter/material.dart';
import 'package:mobile_app/screen/layout.dart';
import 'package:mobile_app/screen/language_selection_page.dart';
import 'package:mobile_app/screen/login_page.dart';
import 'package:mobile_app/screen/product_page.dart';
import 'package:mobile_app/screen/signup_page.dart';
import 'package:mobile_app/screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LanguageSelectionPage(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const MyLoginPage(),
        '/signup': (context) => const MySignupPage(),
        '/languageSelection': (context) => const LanguageSelectionPage(),
        '/productDetail': (context) => const ProductPage(),
        '/home': (context) => const MyLayout(),
      },
    );
  }
}
