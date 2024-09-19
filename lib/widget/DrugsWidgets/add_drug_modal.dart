import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/resources/firestore_methods.dart';

class AddDrugModal extends StatefulWidget {
  const AddDrugModal({super.key});

  @override
  State<AddDrugModal> createState() => _AddDrugModalState();
}

class _AddDrugModalState extends State<AddDrugModal> {
  // controllers
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _productCategoryController =
      TextEditingController();
  final TextEditingController _costPriceController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _manufacturingDateController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _barcodeNumberController =
      TextEditingController();
  final TextEditingController _productsQuantityController =
      TextEditingController();

  @override
  void dispose() {
    _productController.dispose();
    _productCategoryController.dispose();
    _costPriceController.dispose();
    _sellingPriceController.dispose();
    _manufacturingDateController.dispose();
    _expiryDateController.dispose();
    _barcodeNumberController.dispose();
    _productsQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    // dimensions
    var textFieldMaxWidth = 180.0;
    return SizedBox(
      height: 400.0,
      width: 400.0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add Drug Modal",
                  style: TextStyle(color: Colors.blue, fontSize: 16.0),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt),
                        label: const Text("Select image"),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      TextField(
                        controller: _productsQuantityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Products Quantity",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: _productController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Product Name",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      TextField(
                        controller: _productCategoryController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Product Category",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: _costPriceController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Cost Price",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      TextField(
                        controller: _sellingPriceController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Selling Price",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: _manufacturingDateController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Manufacturing Date",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      TextField(
                        controller: _expiryDateController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: "Expiry Date",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: TextField(
                      controller: _barcodeNumberController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Barcode Number",
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
                        constraints: const BoxConstraints(maxWidth: 380.0),
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await FirestoreMethods().addDrugs(
                      "",
                      _productController.text,
                      _costPriceController.text,
                      _manufacturingDateController.text,
                      _productsQuantityController.text,
                      _productCategoryController.text,
                      _sellingPriceController.text,
                      _expiryDateController.text,
                      _barcodeNumberController.text,
                    );
                  },
                  child: const Text("Add Drug"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
