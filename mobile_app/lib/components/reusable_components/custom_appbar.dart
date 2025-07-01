import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(66); // Adjusted height

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 20, color: Colors.white70),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search products',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white54,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ),
                    const Icon(
                      Icons.mic_none_outlined,
                      size: 20,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: Colors.white70,
                ),
                onPressed: () {},
                padding: EdgeInsets.zero,
                splashRadius: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
