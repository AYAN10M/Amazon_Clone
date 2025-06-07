import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isSelected; // Add this for selection state

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.blue[100]
            : Colors.grey[200], // Change color based on selection
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!, // Add border
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Stack(
        children: [
          TextButton(
            onPressed: () => onPressed(),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? Colors.blue[700]
                    : Colors.grey[700], // Change text color
              ),
            ),
          ),
          if (isSelected) // Show checkmark only when selected
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 14),
              ),
            ),
        ],
      ),
    );
  }
}
