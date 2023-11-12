import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> allItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    // Add more items as needed
  ];

  List<String> displayedItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize displayedItems with all items initially
    displayedItems.addAll(allItems);
  }

  void _filterSearchResults(String query) {
    List<String> searchResults = [];

    if (query.isNotEmpty) {
      for (String item in allItems) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      }
    } else {
      // If the query is empty, display all items
      searchResults.addAll(allItems);
    }

    setState(() {
      displayedItems.clear();
      displayedItems.addAll(searchResults);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/nurse.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterSearchResults,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 173, 227, 251),
                    labelText: 'Search',
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: displayedItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(displayedItems[index]),
                        // Add more card content as needed
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
