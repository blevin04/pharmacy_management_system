import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/widget/DrugsWidgets/tr.dart';

class DrugsTable extends StatefulWidget {
  const DrugsTable({super.key});

  @override
  State<DrugsTable> createState() => _DrugsTableState();
}

bool web = false;

class _DrugsTableState extends State<DrugsTable> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: kIsWeb
          ? Card(
              elevation: 6.0,
              margin: const EdgeInsets.all(32.0),
              child: Container(
                padding: const EdgeInsets.all(6.0),
                width: kIsWeb
                    ? MediaQuery.of(context).size.width - 180.0
                    : MediaQuery.of(context).size.width - 45,
                height: 300.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6.0,
                    ),
                    // title
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => fetch()));
                      },
                      child: const Text(
                        "List Of Drugs",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    StreamBuilder(
                        stream: _firestore.collection("drugs").snapshots(),
                        builder: (context, drugsSnapshots) {
                          if (drugsSnapshots.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          int itemCount = drugsSnapshots
                              .data!.docs.length; // number of drugs to show
                          return ListView.builder(
                              itemCount: itemCount,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                // drugs data variables
                                String nameOfDrug = drugsSnapshots
                                    .data!.docs[index]
                                    .data()['productName']; // product name
                                String imageUri = drugsSnapshots
                                    .data!.docs[index]
                                    .data()['image']; // image uri

                                String productsCategory = drugsSnapshots
                                        .data!.docs[index]
                                        .data()[
                                    'productsCategory']; // Products Category

                                // display the date fetched in ListTile() widget
                                return ListTile(
                                  leading: CircleAvatar(
                                      backgroundImage: NetworkImage(imageUri)),
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
                        }),

                    const SizedBox(
                      height: 6.0,
                    ),

                    const Divider()
                  ],
                ),
              ),
            )
          : Container(
              // padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_sharp)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => fetch()));
                        },
                        child: const Text(
                          "List Of Drugs",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  // StreamBuilder(
                  //     stream: _firestore.collection("drugs").snapshots(),
                  //     builder: (context, drugsSnapshots) {
                  //       if (drugsSnapshots.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return const CircularProgressIndicator();
                  //       }
                  //       int itemCount = drugsSnapshots
                  //           .data!.docs.length; // number of drugs to show
                  //       return ListView.builder(
                  //           itemCount: itemCount,
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           itemBuilder: (context, index) {
                  //             // drugs data variables
                  //             String nameOfDrug = drugsSnapshots.data!.docs[index]
                  //                 .data()['productName']; // product name
                  //             String imageUri = drugsSnapshots.data!.docs[index]
                  //                 .data()['image']; // image uri

                  //             String productsCategory =
                  //                 drugsSnapshots.data!.docs[index].data()[
                  //                     'productsCategory']; // Products Category

                  //             // display the date fetched in ListTile() widget
                  //             return ListTile(
                  //               leading: CircleAvatar(
                  //                   backgroundImage: NetworkImage(imageUri)),
                  //               title: Text(
                  //                 nameOfDrug,
                  //                 overflow: TextOverflow.ellipsis,
                  //               ),
                  //               subtitle: Text(
                  //                 productsCategory,
                  //                 overflow: TextOverflow.ellipsis,
                  //               ),
                  //             );
                  //           });
                  //     }),
                ],
              ),
            ),
    );
  }
}
