import 'package:compareprice/utils/app_styles.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart'; // Import for BottomNavigationBar

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Apptheme.dark, // Adjust based on your app theme
          // Consider using a leading icon for navigation drawer
          title: const Text(
            'Search to look for products',
            style: TextStyle(color: Colors.white),
          )
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.more_vert),
          //     tooltip: 'More options',
          //     onPressed: () {
          //       // Handle additional options menu
          //     },
          //   ),
          // ],
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Adjust padding as needed
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'What are you looking for?',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  IconButton(
                    icon: const Icon(Icons.filter_list), // Use filter icon
                    tooltip: 'Filter options',
                    onPressed: () {
                      // Handle filter functionality
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 10.0), // Add spacing between search bar and categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCategoryButton('Electronics'),
                buildCategoryButton('Fashion'),
                buildCategoryButton('Home & Garden'),
                // Add more category buttons as needed
              ],
            ),
            const SizedBox(
                height: 10.0), // Add spacing between categories and products
            // Your product listing or other app content here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Consider using BottomNavigationBar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Set initial selected index
        selectedItemColor: Colors.blue, // Adjust color as needed
        onTap: (int index) {
          // Handle navigation based on selected index
        },
      ),
    );
  }

  Widget buildCategoryButton(String category) {
    return TextButton(
      onPressed: () {
        // Handle category selection
      },
      child: Text(category, style: const TextStyle(color: Colors.black87)),
    );
  }
}
