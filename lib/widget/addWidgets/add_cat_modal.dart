import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/resources/firestore_methods.dart';

class AddCategoryModal extends StatefulWidget {
  const AddCategoryModal({super.key});

  @override
  State<AddCategoryModal> createState() => _AddCategoryModalState();
}

class _AddCategoryModalState extends State<AddCategoryModal> {
  // controllers
  final TextEditingController _addCategoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return SizedBox(
      //height: web ? 130.0 : MediaQuery.of(context).size.height / 4,
      width: 120.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add New Category of Drugs",
              style: TextStyle(color: Colors.blue, fontSize: 16.0),
            ),
            const Divider(),
            TextField(
              controller: _addCategoryController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Add Category",
                border: inputBorder,
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
              ),
            ),
            const SizedBox(
              height: 12.0,
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
                    await FirestoreMethods()
                        .addCategory(_addCategoryController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Add"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
