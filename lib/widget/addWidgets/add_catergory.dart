import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmacy_management_system/widget/addWidgets/add_cat_modal.dart';
import 'package:pharmacy_management_system/widget/addWidgets/add_category_table.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  bool web = false;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      web = true;
    }
    return web
        ? Card(
            elevation: web ? 4.0 : 8.0,
            shadowColor: Colors.black,
            margin: const EdgeInsets.all(32.0),
            child: Container(
              //height: MediaQuery.of(context).size.height / 2,

              color: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ADD CATEGORY",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Add a new Category",
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
                                content: AddCategoryModal(),
                              );
                              //const AddCategoryModal();
                            });
                      },
                      child: const Text("Add Category"))
                ],
              ),
            ),
          )
        : Material(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 251, 251, 252),
              ),
              // height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_sharp)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Text(
                              "ADD CATEGORY",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              "Add a new Category",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Center(child: AddCategoryTable()),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: AddCategoryModal(),
                                );
                                //const AddCategoryModal();
                              });
                        },
                        child: const Text("Add Category"))
                  ],
                ),
              ),
            ),
          );
  }
}
