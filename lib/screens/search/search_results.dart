import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/utils/colors.dart';

import 'categories_search_results.dart';
import 'drugs_search_results.dart';
import 'suppliers_search_results.dart';

// page that displays the search results
// for drugs, category and suppliers
// Results displated in three different tabs.

class SearchResults extends StatefulWidget {
  final String searchText; // text that is entered in the search field
  const SearchResults({super.key, required this.searchText});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    // a default tabbar controller
    // holds a number of three tabs
    // to display all the results at once
    // This allows the UI to load data from the db
    // once per search
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search Results"), // page title
          centerTitle: false, // do not center the title for all devices
          bottom: const TabBar(
              indicatorColor: primaryColor,
              labelPadding: EdgeInsets.all(6.0),
              tabs: [
                Text("DRUGS"),
                Text("CATEGORIES"),
                Text("SUPPLIERS"),
              ]),
        ),
        body: TabBarView(children: [
          DrugsSearchResults(
            searchText: widget.searchText,
          ),
          CategoriesSearchResults(searchString: widget.searchText),
          SuppliersSearchResults(
            searchText: widget.searchText,
          ),
        ]),
      ),
    );
  }
}
