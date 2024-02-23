import 'package:compareprice/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> selectedWebsites = []; // List to store selected websites

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Apptheme.dark,
        title: const Text(
          'Search to look for products',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter options',
            onPressed: () {
              // Open filter drawer
              _openFilterDrawer(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCategoryButton(context, 'Electronics'),
                buildCategoryButton(context, 'Fashion'),
                buildCategoryButton(context, 'Home & Garden'),
              ],
            ),
            const SizedBox(height: 10.0),
            // Your product listing or other app content here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          // Handle navigation based on selected index
        },
      ),
    );
  }

  void _openFilterDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 300, // Adjust height as needed
              child: ListView(
                children: [
                  const ListTile(
                    title: Text('Select Websites',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  for (String website in _websites)
                    ListTile(
                      title: Text(website),
                      trailing: Checkbox(
                        value: selectedWebsites.contains(website),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null && value) {
                              selectedWebsites.add(website);
                            } else {
                              selectedWebsites.remove(website);
                            }
                          });
                        },
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      // Apply filter with selected websites
                      Navigator.pop(context);
                      // You can use selectedWebsites list for further processing
                    },
                    child: const Text('Apply Filter'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildCategoryButton(BuildContext context, String category) {
    return TextButton(
      onPressed: () {
        // Handle category selection
      },
      child: Text(category, style: const TextStyle(color: Colors.black87)),
    );
  }

  // List of websites for comparison
  final List<String> _websites = [
    'Amazon',
    'FlipKart',
    'Ebay',
    'Alibaba',
    // Add more websites as needed
  ];
}
