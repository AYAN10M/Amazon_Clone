import 'package:flutter/material.dart';
import 'package:mobile_app/screen/layout.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Widget buildAmazonLogo() {
      return Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.03),
        child: Center(
          child: Image.asset(
            'assets/images/amazon_logo.png',
            width: screenWidth * 0.4,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    Widget buildHeadline() {
      return const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text(
          'Sign in to your account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, // reduced
            fontWeight: FontWeight.bold,
            fontFamily: 'Goldman',
            color: Colors.black,
          ),
        ),
      );
    }

    Widget buildDescription() {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Text(
          'View your wish list\n'
          'Find & reorder past purchases\n'
          'Track your purchases',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14, // reduced
            fontWeight: FontWeight.w500,
            fontFamily: 'Goldman',
            color: Colors.black,
            height: 1.5,
          ),
        ),
      );
    }

    Widget buildButton({
      required String text,
      required Color backgroundColor,
      required VoidCallback onPressed,
    }) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 12), // reduced
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14, // reduced
              fontWeight: FontWeight.w600,
              fontFamily: 'Goldman',
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildAmazonLogo(),

              buildHeadline(),

              buildDescription(),

              SizedBox(height: screenHeight * 0.035),

              buildButton(
                text: 'Already a customer? Sign in',
                backgroundColor: Colors.amber,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MyLayout()),
                    (route) => false,
                  );
                },
              ),

              const SizedBox(height: 10),

              buildButton(
                text: 'New to Amazon? Create an account',
                backgroundColor: Colors.grey[300]!,
                onPressed: () {},
              ),

              const SizedBox(height: 10),

              buildButton(
                text: 'Skip sign in',
                backgroundColor: Colors.grey[300]!,
                onPressed: () {},
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
