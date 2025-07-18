import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
    'https://picsum.photos/1080/600?image=10',
    'https://picsum.photos/1080/600?image=20',
    'https://picsum.photos/1080/600?image=30',
    'https://picsum.photos/1080/600?image=40',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final carouselHeight = screenHeight * 0.28;

    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: imageUrls.length,
                options: CarouselOptions(
                  height: carouselHeight,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: screenWidth,
                      height: carouselHeight,
                      child: Image.network(imageUrls[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageUrls.asMap().entries.map((entry) {
                    final isActive = _currentIndex == entry.key;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: isActive ? 12 : 8,
                      height: isActive ? 12 : 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? Colors.white : Colors.white54,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          // Additional content...
        ],
      ),
    );
  }
}
