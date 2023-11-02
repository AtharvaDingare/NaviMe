import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[800], // Dark background color
          borderRadius: BorderRadius.circular(30), // Circular border
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Row(
          children: [
            Icon(
              Icons.pin_drop,
              color: Colors.white,
              fill: 1.0,
            ), // Search icon
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white), // Text color
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(color: Colors.white70), // Placeholder color
                  border: InputBorder.none, // Remove the default border
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
