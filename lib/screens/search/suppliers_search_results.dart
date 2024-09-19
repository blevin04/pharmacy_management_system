import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 

class SuppliersSearchResults extends StatefulWidget {
  final String searchText;
  const SuppliersSearchResults({super.key, required this.searchText});

  @override
  State<SuppliersSearchResults> createState() => _SuppliersSearchResultsState();
}

class _SuppliersSearchResultsState extends State<SuppliersSearchResults> {
  // firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // firestore
  @override
  Widget build(BuildContext context) {
    // display a list of drugs that closesly matches the drugs
    // searched by the user
    return Scaffold(
      // display the search results.
      // Fetch the results from database using
      // Streambuilder() widget
      body: StreamBuilder(
          stream: _firestore
              .collection("suppliers")
              .where(
                "supplierContact",
                isGreaterThanOrEqualTo: widget.searchText,
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
                  String supplierContact =
                      categorySnapshot.data!.docs[index].data()['supplierContact'];
                  String category =
                      categorySnapshot.data!.docs[index].data()['category'];
                 
                  // display the fetched data in a ListTile()
                  // widget
                  return ListTile(
                    
                    title: Text(supplierContact),
                    subtitle: Text(category)
                  );
                });
          }),
    );
  }
}