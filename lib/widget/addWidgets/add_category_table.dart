import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddCategoryTable extends StatefulWidget {
  const AddCategoryTable({super.key});

  @override
  State<AddCategoryTable> createState() => _AddCategoryTableState();
}

class _AddCategoryTableState extends State<AddCategoryTable> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: kIsWeb ? const EdgeInsets.all(32.0) : const EdgeInsets.all(10.0),
      child: Container(
        // padding: const EdgeInsets.all(6.0),
        width: kIsWeb
            ? MediaQuery.of(context).size.width - 180.0
            : MediaQuery.of(context).size.width - 80,
        height: kIsWeb ? 300.0 : MediaQuery.of(context).size.height / 2,
        child: StreamBuilder(
            stream: _firestore.collection("category").snapshots(),
            builder: (context, categorySnapshots) {
              if (categorySnapshots.connectionState ==
                  ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              int itemCount = categorySnapshots
                  .data!.docs.length; // number of items to display

              return ListView.builder(
                  itemCount: itemCount,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    String category =
                        categorySnapshots.data!.docs[index].data()["category"];

                    // display the date fetched in ListTile() widget
                    return ListTile(
                      title: Text(
                        category,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
