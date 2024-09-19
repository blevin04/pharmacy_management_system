import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/utils/utils.dart';

import 'search_results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // controllers
  final TextEditingController _searchController = TextEditingController();

  // dispose the controller
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // dimensions
    var screenHeight = MediaQuery.of(context).size.height; // full height
    var screenWidth = double.infinity; // full width

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"), // page title
        centerTitle: false, // do not center the title for all screens
      ),
      body: Container(
        height: screenHeight, // full height of the screen
        width: screenWidth, // full width of the screen
        padding: const EdgeInsets.all(32.0), // content padding
        child: Column(
          children: [
            // text
            const Text("search drugs"),
            const SizedBox(
              height: 32.0,
            ),
            // search bar
            TextField(
              controller: _searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefix: const Icon(Icons.search),
                suffix: TextButton(
                  onPressed: () {
                    // validation - ensure that the search field is not empty
                    if (_searchController.text.isEmpty) {
                      // Display a snackbar showing the error message
                      showSnackBar(context, "Search field empty!");
                    } else {
                      // if the search field is not empty, proceed
                      // with searching the database
                      // call a widget that displays the search result
                      // Results are displayed on another screen.
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchResults(searchText: _searchController.text),
                        ),
                      );
                    }
                  },
                  child: const Text("Search"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
