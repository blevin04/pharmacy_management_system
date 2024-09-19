import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/screens/add_stock_screen.dart';
import 'package:pharmacy_management_system/widget/DrugsWidgets/add_drugs.dart';
import 'package:pharmacy_management_system/widget/DrugsWidgets/drugs_table.dart';
import 'package:pharmacy_management_system/widget/UsersWidgets/add_users.dart';
import 'package:pharmacy_management_system/widget/addWidgets/add_catergory.dart';
import 'package:pharmacy_management_system/widget/addWidgets/add_supplier.dart';

// ignore: must_be_immutable
class MobileLayoutMenu extends StatefulWidget {
  int currentTab; // tab that is currently open
  Widget currentScreen; // screen that is currently open
  MobileLayoutMenu(
      {super.key, required this.currentTab, required this.currentScreen});

  @override
  State<MobileLayoutMenu> createState() => _MobileLayoutMenuState();
}

class _MobileLayoutMenuState extends State<MobileLayoutMenu> {
  bool _isAddOpen = false;
  bool _isUserOpen = false;

  @override
  Widget build(BuildContext context) {
    // dimensions
    var screenHeight = MediaQuery.of(context)
        .size
        .height; // full screen height for mobile devices
    var screenWidth = MediaQuery.of(context)
        .size
        .width; // full screen width for mobile devices
    return Container(
      color: const Color.fromARGB(255, 4, 11, 17), // screen background-color
      height: screenHeight, // full screen height
      width: screenWidth, // full screen width
      padding: const EdgeInsets.only(
          bottom: 60.0, left: 20, right: 35), // content padding
      child: Container(
        color: Colors.transparent, // color of the container
        height: screenHeight, // full height of the screen
        width: 250.0, // container width
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0), // content padding
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      _isAddOpen ? _isAddOpen = false : _isAddOpen = true;
                    });
                  },
                  leading: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    _isAddOpen
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: Colors.white,
                  ),
                ),
                _isAddOpen
                    ? Container(
                        margin: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  widget.currentTab = 5;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddCategory()));
                                  // widget.currentScreen = const AddCategory();
                                });
                              },
                              leading: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              title: const Text(
                                "Category",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddSupplier()));
                                  widget.currentTab = 6;
                                });
                              },
                              leading: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              title: const Text(
                                "Supplier",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddDrugs()));
                      widget.currentTab = 7;
                    });
                  },
                  leading: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Add Drug",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddStockScreen()));
                      widget.currentTab = 8;
                    });
                  },
                  leading: const Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Add Stock",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DrugsTable()));
                      // widget.currentScreen = const DrugsTable();
                      widget.currentTab = 9;
                    });
                  },
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "All Drugs",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _isUserOpen ? _isUserOpen = false : _isUserOpen = true;
                    });
                  },
                  leading: const Icon(
                    Icons.person_2,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "User",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    _isUserOpen
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: Colors.white,
                  ),
                ),
                _isUserOpen
                    ? Container(
                        margin: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddUsers()));
                                  //widget.currentScreen = const AddUsers();
                                  widget.currentTab = 10;
                                });
                              },
                              leading: const Icon(
                                Icons.person_add,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              title: const Text(
                                "Add user",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.0),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading: const Icon(
                                Icons.group,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              title: const Text(
                                "All Users",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                const Divider(
                  color: Colors.white,
                  height: 20.0,
                  thickness: 0.2,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Log Out"),
                            content:
                                const Text("Are you sure you want to log out"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              const SizedBox(
                                width: 60,
                              ),
                              TextButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("LOG OUT")),
                            ],
                          );
                        });
                  },
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Log out",
                    style: TextStyle(color: Colors.white),
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
