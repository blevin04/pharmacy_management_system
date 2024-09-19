import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/widget/DrugsWidgets/drugs_table.dart';

import 'add_drug_modal.dart';
import 'upload_with_excel.dart';

bool web = false;

class AddDrugs extends StatelessWidget {
  const AddDrugs({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      web = true;
    } else {
      web = false;
    }
    return web
        ? Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(32.0),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ADD DRUGS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                      content: UploadWithExcel());
                                });
                          },
                          child: const Text("Add With Excel")),
                      const SizedBox(
                        width: 12.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                      content: AddDrugModal());
                                });
                          },
                          child: const Text("Add Drugs")),
                    ],
                  )
                ],
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 8.0,
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        children: [
                          IconButton(
                              alignment: Alignment.topLeft,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_sharp)),
                          const SizedBox(
                            width: 100,
                          ),
                          const Center(
                            child: Text(
                              "ADD DRUGS",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                          content: UploadWithExcel());
                                    });
                              },
                              child: const Text("Add With Excel")),
                          const SizedBox(
                            width: 12.0,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                          content: AddDrugModal());
                                    });
                              },
                              child: const Text("Add Drugs")),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      )
                    ],
                  ),
                ),
                const DrugsTable()
              ],
            ),
          );
  }
}
