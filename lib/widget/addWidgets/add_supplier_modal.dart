import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/resources/firestore_methods.dart';

class AddSupplierModal extends StatefulWidget {
  const AddSupplierModal({super.key});

  @override
  State<AddSupplierModal> createState() => _AddSupplierModalState();
}

class _AddSupplierModalState extends State<AddSupplierModal> {
  // controllers
  final TextEditingController _addCategoryController = TextEditingController();
  final TextEditingController _supplierContactController =
      TextEditingController();
  final TextEditingController _supplierEmailController =
      TextEditingController();
  final TextEditingController _dateJoinedController = TextEditingController();

  @override
  void dispose() {
    _addCategoryController.dispose();
    _supplierContactController.dispose();
    _supplierEmailController.dispose();
    _dateJoinedController.dispose();
    super.dispose();
  }

  bool web = false;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      web = true;
    } else {
      web = false;
    }
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context, color: Colors.white));

    // dimensions
    var textFieldMaxWidth = 180.0;
    return SizedBox(
      height: web ? 230.0 : MediaQuery.of(context).size.height / 2.5,
      width: 400.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add Supplier Modal",
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
            const Divider(),
            web
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: _addCategoryController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Supplier Name",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      TextField(
                        controller: _supplierContactController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Supplier Contact",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      TextField(
                        controller: _addCategoryController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Supplier Name",
                          focusedBorder: inputBorder,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      TextField(
                        controller: _supplierContactController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Supplier Contact",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                    ],
                  ),
            web
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: _supplierEmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Supplier Email",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      TextField(
                        controller: _dateJoinedController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: "Date Joined",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      TextField(
                        controller: _supplierEmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Supplier Email",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                      TextField(
                        controller: _dateJoinedController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: "Date Joined",
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          constraints:
                              BoxConstraints(maxWidth: textFieldMaxWidth),
                        ),
                      ),
                    ],
                  ),
            const Divider(),
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
                    await FirestoreMethods().addSupplier(
                      _addCategoryController.text,
                      _supplierEmailController.text,
                      _supplierContactController.text,
                    );
                    Navigator.pop(context);
                    SnackBar(
                        content: Container(
                      child: Text(
                          "${_addCategoryController.text} was added to list of suppliers"),
                    ));
                  },
                  child: const Text("Add Supplier"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
