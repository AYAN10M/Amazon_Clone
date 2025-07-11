import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.shape_line_outlined, color: Colors.white),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            'Brand Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View Brand Deatails',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),

                      // Put the 5 star rating system here
                      IconButton(
                        icon: Icon(Icons.rate_review_outlined, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
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
