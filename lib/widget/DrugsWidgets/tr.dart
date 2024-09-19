import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class fetch extends StatefulWidget {
  const fetch({super.key});

  @override
  State<fetch> createState() => _fetchState();
}

class _fetchState extends State<fetch> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore.collection("drugs").snapshots(),
        builder: (context, drugsSnapshots) {
          if (drugsSnapshots.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          int itemCount =
              drugsSnapshots.data!.docs.length; // number of drugs to show
          return ListView.builder(
              itemCount: itemCount,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // drugs data variables
                String nameOfDrug = drugsSnapshots.data!.docs[index]
                    .data()['productName']; // product name
                String imageUri = drugsSnapshots.data!.docs[index]
                    .data()['image']; // image uri

                String productsCategory = drugsSnapshots.data!.docs[index]
                    .data()['productsCategory']; // Products Category

                // display the date fetched in ListTile() widget
                return ListTile(
                  leading:
                      CircleAvatar(backgroundImage: NetworkImage(imageUri)),
                  title: Text(
                    nameOfDrug,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    productsCategory,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              });
        });
  }
}
