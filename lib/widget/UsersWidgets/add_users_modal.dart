import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddUsersModal extends StatefulWidget {
  const AddUsersModal({super.key});

  @override
  State<AddUsersModal> createState() => _AddUsersModalState();
}

class _AddUsersModalState extends State<AddUsersModal> {
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

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    // dimensions
    var textFieldMaxWidth = 180.0;
    return SizedBox(
      height: kIsWeb ? 230.0 : MediaQuery.of(context).size.height / 3,
      width: kIsWeb ? 400.0 : MediaQuery.of(context).size.width - 100,
      child: kIsWeb
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: _addCategoryController,
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
                    TextField(
                      controller: _supplierContactController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Supplier Contact",
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
                      controller: _supplierEmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Supplier Email",
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
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
                        enabledBorder: inputBorder,
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
                      onPressed: () {},
                      child: const Text("Add Supplier"),
                    ),
                  ],
                )
              ],
            )
          : SingleChildScrollView(
              child: Column(
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _addCategoryController,
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
                          height: 20,
                        ),
                        TextField(
                          controller: _supplierContactController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Supplier Contact",
                            border: inputBorder,
                            focusedBorder: inputBorder,
                            enabledBorder: inputBorder,
                            constraints:
                                BoxConstraints(maxWidth: textFieldMaxWidth),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _supplierEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Supplier Email",
                            border: inputBorder,
                            focusedBorder: inputBorder,
                            enabledBorder: inputBorder,
                            constraints:
                                BoxConstraints(maxWidth: textFieldMaxWidth),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _dateJoinedController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: "Date Joined",
                            border: inputBorder,
                            focusedBorder: inputBorder,
                            enabledBorder: inputBorder,
                            constraints:
                                BoxConstraints(maxWidth: textFieldMaxWidth),
                          ),
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
                              onPressed: () {},
                              child: const Text("Add Supplier"),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
