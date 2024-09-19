import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/widget/UsersWidgets/users_available.dart';

import 'add_users_modal.dart';

class AddUsers extends StatelessWidget {
  const AddUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(32.0),
            child: Container(
              height: 100.0,
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ADD USERS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Add users to your database",
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
                                content: AddUsersModal(),
                              );
                              //const AddCategoryModal();
                            });
                      },
                      child: const Text("Add Users"))
                ],
              ),
            ),
          )
        : Material(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_sharp)),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(top: 30)),
                            Text(
                              "ADD USERS",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Add new users to your database",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Card(
                      elevation: 8.0,
                      child: Availabe_users(),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: AddUsersModal(),
                                );
                                //const AddCategoryModal();
                              });
                        },
                        child: const Text("Add Users"))
                  ],
                ),
              ),
            ),
          );
  }
}
