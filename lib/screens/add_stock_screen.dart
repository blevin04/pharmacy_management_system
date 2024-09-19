import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/resources/firestore_methods.dart';
import 'package:pharmacy_management_system/utils/colors.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({super.key});

  @override
  State<AddStockScreen> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  // controllers
  final TextEditingController _supplierNameController = TextEditingController();
  final TextEditingController _productSuppliedController =
      TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _supplierNameController.dispose();
    _productSuppliedController.dispose();
    _totalAmountController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    // dimensions
    var textFieldMaxWidth = 400.0;
    return kIsWeb
        ? Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(32.0),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(60, 32, 60, 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "ADD STOCK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(),
                  TextField(
                    controller: _supplierNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Supplier Name",
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      constraints: BoxConstraints(maxWidth: textFieldMaxWidth),
                    ),
                  ),
                  TextField(
                    controller: _productSuppliedController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Product Supplied",
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      constraints: BoxConstraints(maxWidth: textFieldMaxWidth),
                    ),
                  ),
                  TextField(
                    controller: _numberController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Number",
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      constraints: BoxConstraints(maxWidth: textFieldMaxWidth),
                    ),
                  ),
                  TextField(
                    controller: _totalAmountController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Total Amount",
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      constraints: BoxConstraints(maxWidth: textFieldMaxWidth),
                    ),
                  ),

                  const Divider(),

                  // add stock button

                  InkWell(
                    onTap: () async {
                      // send the data to firebase
                      FirestoreMethods().addStock(
                        _supplierNameController.text,
                        _productSuppliedController.text,
                        _numberController.text,
                        _totalAmountController.text,
                      );
                    },
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                      child: Container(
                        width: textFieldMaxWidth,
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        decoration:
                            const BoxDecoration(gradient: drugsAddedColors),
                        child: const Text(
                          "Add Stock",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Card(
                elevation: 8.0,
                margin: const EdgeInsets.only(
                    top: 40, right: 20, left: 20, bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_sharp)),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text(
                            "ADD STOCK",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _supplierNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Supplier Name",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _productSuppliedController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Product Supplied",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _numberController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Number",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _totalAmountController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Total Amount",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),

                      const Divider(),

                      // add stock button
                      const SizedBox(
                        height: 40,
                      ),

                      InkWell(
                        onTap: () async {
                          // send the data to firebase
                          FirestoreMethods().addStock(
                            _supplierNameController.text,
                            _productSuppliedController.text,
                            _numberController.text,
                            _totalAmountController.text,
                          );
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                          child: Container(
                            width: textFieldMaxWidth,
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            decoration:
                                const BoxDecoration(gradient: drugsAddedColors),
                            child: const Text(
                              "Add Stock",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
