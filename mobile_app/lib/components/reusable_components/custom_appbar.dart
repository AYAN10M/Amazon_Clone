import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? hintText;
  final VoidCallback? onSearchTap;
  final VoidCallback? onMicTap;
  final VoidCallback? onCameraTap;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onSearchSubmitted;
  final TextEditingController? searchController;

  final bool showBackButton;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    this.hintText = 'Search products',
    this.onSearchTap,
    this.onMicTap,
    this.onCameraTap,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.searchController,
    this.showBackButton = false,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72); // Slightly taller

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.of(context).size.width * 0.04;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        12,
        horizontalPadding,
        12,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showBackButton) _buildBackButton(context),
            Expanded(child: _buildSearchField()),
            const SizedBox(width: 10),
            _buildCameraButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 0.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(Icons.search, size: 20, color: Colors.grey.shade400),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,
              onSubmitted: onSearchSubmitted,
              onTap: onSearchTap,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(fontSize: 15, color: Colors.white),
              cursorColor: Colors.white,
              textInputAction: TextInputAction.search,
            ),
          ),
          _buildMicButton(),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildMicButton() {
    return InkWell(
      onTap: onMicTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(
          Icons.mic_none_outlined,
          size: 20,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  Widget _buildCameraButton() {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 0.5),
      ),
      child: InkWell(
        onTap: onCameraTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Icon(
            Icons.camera_alt_outlined,
            size: 20,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: onBack ?? () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        tooltip: 'Back',
      ),
    );
  }
}
