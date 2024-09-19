import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// page that displays search results for the categories

class CategoriesSearchResults extends StatefulWidget {
  final String searchString;
  const CategoriesSearchResults({
    Key? key,
    required this.searchString,
  }) : super(key: key);

  @override
  State<CategoriesSearchResults> createState() =>
      _CategoriesSearchResultsState();
}

class _CategoriesSearchResultsState extends State<CategoriesSearchResults> {
  // firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // firestore

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // display the search results.
      // Fetch the results from database using
      // Streambuilder() widget
      body: StreamBuilder(
          stream: _firestore
              .collection("category")
              .where(
                "category",
                isGreaterThanOrEqualTo: widget.searchString,
              )
              .snapshots(),
          builder: (index, categorySnapshot) {
            // before displaying the search results,
            // display a loading indicator on the screen
            // to avoid displaying an null error message
            // before data is displayed from the database
            if (categorySnapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // Display the search result after the
            // data is loaded from the database
            // Search results are displayed in a ListView.builder() widget
            // scroll direction of the widget set to vertical

            // number of items to display
            int itemCount = categorySnapshot.data!.docs.length;

            return ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  // variables holding the data fetched
                  // from the database.
                  // Data fetched from the database to be
                  // displayed using a ListTile() widget
                  String category =
                      categorySnapshot.data!.docs[index].data()['category'];

                  // display the fetched data in a ListTile()
                  // widget
                  return ListTile(
                    title: Text(category),
                  );
                });
          }),
    );
  }
}
