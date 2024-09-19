import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/widget/addWidgets/suppliers_table.dart';
import 'add_supplier_modal.dart';

class AddSupplier extends StatefulWidget {
  const AddSupplier({super.key});

  @override
  State<AddSupplier> createState() => _AddSupplierState();
}

class _AddSupplierState extends State<AddSupplier> {
  bool web = false;

  @override
  Widget build(BuildContext context) {
    kIsWeb ? web = true : web = false;
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ADD SUPPLIER",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Add a new supplier",
                        style: TextStyle(color: Colors.blue, fontSize: 12.0),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: AddSupplierModal(),
                              );
                              //const AddCategoryModal();
                            });
                      },
                      child: const Text("Add Supplier"))
                ],
              ),
            ),
          )
        : Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  Card(
                    elevation: 8.0,
                    margin: const EdgeInsets.only(top: 45, left: 32, right: 32),
                    child: Row(
                      children: [
                        IconButton(
                            alignment: Alignment.topLeft,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              "ADD SUPPLIER",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              "Add a new supplier",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12.0),
                            ),
                            //Add the list of available Suppliers
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SuppliersTable(),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: AddSupplierModal(),
                              );
                              //const AddCategoryModal();
                            });
                      },
                      child: const Text("Add Supplier"))
                ],
              ),
            ),
          );
  }
}
