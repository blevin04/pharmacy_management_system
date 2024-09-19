import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SuppliersTable extends StatefulWidget {
  const SuppliersTable({super.key});

  @override
  State<SuppliersTable> createState() => _SuppliersTableState();
}

class _SuppliersTableState extends State<SuppliersTable> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool web = false;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      web = true;
    } else {
      web = false;
    }
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(32.0),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        width: web
            ? MediaQuery.of(context).size.width - 180.0
            : MediaQuery.of(context).size.width - 50,
        height: 300.0,
        child: StreamBuilder(
            stream: _firestore.collection("suppliers").snapshots(),
            builder: (context, supplierSnapshots) {
              if (supplierSnapshots.connectionState ==
                  ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              int itemCount = supplierSnapshots
                  .data!.docs.length; // number of items to display
              return ListView.builder(
                  itemCount: itemCount,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // data from the db
                    String category =
                        supplierSnapshots.data!.docs[index].data()['category'];

                    String email =
                        supplierSnapshots.data!.docs[index].data()['email'];

                    // display the date fetched in ListTile() widget
                    return ListTile(
                      title: Text(
                        category,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        email,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
