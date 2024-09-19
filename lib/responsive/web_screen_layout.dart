import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/screens/about.dart';
import 'package:pharmacy_management_system/screens/add_category_screen.dart';
import 'package:pharmacy_management_system/screens/home_screen.dart';
import 'package:pharmacy_management_system/utils/global_variables.dart';
import 'package:pharmacy_management_system/widget/DrugsWidgets/drugs_table.dart';
import '../screens/add_drugs_screen.dart';
import '../screens/add_stock_screen.dart';
import '../screens/add_supplier_screen.dart';
import '../screens/admins_profile_screen.dart';
import '../screens/notifications_screen.dart';
import '../widget/UsersWidgets/add_users.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({
    super.key,
  });

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  bool _isAddOpen = false;
  bool _isUserOpen = false;

  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: "Search",
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 6.0,
          ),
          IconButton(
            onPressed: () {
              // navigate the user to the notif's screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreens(),
                ),
              );
            },
            tooltip: "Notifications",
            icon: const Icon(Icons.notifications),
          ),
          const SizedBox(
            width: 6.0,
          ),
          IconButton(
            onPressed: () {
              // navigate the user to the admin's account
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AdminsProfile(),
                ),
              );
            },
            tooltip: "Admin's account",
            icon: const Icon(Icons.person),
          ),
          const SizedBox(
            width: 6.0,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              );
            },
            tooltip: "About software",
            icon: const Icon(Icons.info),
          ),
          const SizedBox(
            width: 6.0,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 4, 11, 17),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Row(
              children: [
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: 250.0,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              setState(() {
                                _selectedPage = 0;
                              });
                            },
                            leading: Icon(
                              Icons.home,
                              color: _selectedPage == 0
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            title: Text(
                              "Home",
                              style: TextStyle(
                                  color: _selectedPage == 0
                                      ? Colors.yellow
                                      : Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _isAddOpen
                                    ? _isAddOpen = false
                                    : _isAddOpen = true;
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
                                          setState(() {
                                            _selectedPage = 1;
                                          });
                                        },
                                        leading: Icon(
                                          Icons.remove,
                                          color: _selectedPage == 1
                                              ? Colors.yellow
                                              : Colors.white,
                                          size: 14.0,
                                        ),
                                        title: Text(
                                          "Category",
                                          style: TextStyle(
                                              color: _selectedPage == 1
                                                  ? Colors.yellow
                                                  : Colors.white,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          setState(() {
                                            _selectedPage = 2;
                                          });
                                        },
                                        leading: Icon(
                                          Icons.remove,
                                          color: _selectedPage == 2
                                              ? Colors.yellow
                                              : Colors.white,
                                          size: 14.0,
                                        ),
                                        title: Text(
                                          "Supplier",
                                          style: TextStyle(
                                              color: _selectedPage == 2
                                                  ? Colors.yellow
                                                  : Colors.white,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _selectedPage = 3;
                              });
                            },
                            leading: Icon(
                              Icons.add_box_outlined,
                              color: _selectedPage == 3
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            title: Text(
                              "Add Drug",
                              style: TextStyle(
                                color: _selectedPage == 3
                                    ? Colors.yellow
                                    : Colors.white,
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _selectedPage = 4;
                              });
                            },
                            leading: Icon(
                              Icons.shopping_basket,
                              color: _selectedPage == 4
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            title: Text(
                              "Add Stock",
                              style: TextStyle(
                                  color: _selectedPage == 4
                                      ? Colors.yellow
                                      : Colors.white),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _selectedPage = 5;
                              });
                            },
                            leading: Icon(
                              Icons.shopping_cart,
                              color: _selectedPage == 5
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                            title: Text(
                              "All Drugs",
                              style: TextStyle(
                                color: _selectedPage == 5
                                    ? Colors.yellow
                                    : Colors.white,
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _isUserOpen
                                    ? _isUserOpen = false
                                    : _isUserOpen = true;
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
                                            _selectedPage = 6;
                                          });
                                        },
                                        leading: Icon(
                                          Icons.person_add,
                                          color: _selectedPage == 6
                                              ? Colors.yellow
                                              : Colors.white,
                                          size: 14.0,
                                        ),
                                        title: Text(
                                          "Add user",
                                          style: TextStyle(
                                              color: _selectedPage == 6
                                                  ? Colors.yellow
                                                  : Colors.white,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      ListTile(
                                        onTap: () {},
                                        leading: const Icon(
                                          Icons.group,
                                          color: Colors.white,
                                          size: 14.0,
                                        ),
                                        title: const Text(
                                          "All Users",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0),
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
                            onTap: () {},
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
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width - 250.0,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 20.0,
            width: MediaQuery.of(context).size.width - 250.0,
            margin: const EdgeInsets.only(left: 250.0, top: 20.0),
            child: _selectedPage == 0
                ? const HomeScreen()
                : _selectedPage == 1
                    ? const AddScreen()
                    : _selectedPage == 2
                        ? const AddSupplierScreen()
                        : _selectedPage == 3
                            ? const AddDrugsScreen()
                            : _selectedPage == 4
                                ? const AddStockScreen()
                                : _selectedPage == 5
                                    ? const DrugsTable()
                                    : _selectedPage == 6
                                        ? const AddUsers()
                                        : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
