import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/screens/about.dart';
import 'package:pharmacy_management_system/screens/admins_profile_screen.dart';
import 'package:pharmacy_management_system/screens/home_screen.dart';
import 'package:pharmacy_management_system/screens/notifications_screen.dart';
import 'package:pharmacy_management_system/screens/search/search_screen.dart';

import '../menus/mobile_layout_menu.dart';
import '../utils/colors.dart';
import '../utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  // index of the tab that opens first when the user
  // opens the app
  int currentTab = 0;

  // list of widgets that holds the screens used for
  // navigation in the main screen
  final List<Widget> screens = navigationItems;

  // page storage bucket
  final PageStorageBucket bucket = PageStorageBucket();

  // current screen which is the screen that is currently open
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          overflow: TextOverflow.ellipsis,
        ), //  app title
        actions: [
          // menu icon
          IconButton(
            onPressed: () {
              // open the navigation menu for mobile app layout
              // The menu is contained in a modal bottom sheet
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return MobileLayoutMenu(
                      currentTab: currentTab,
                      currentScreen: currentScreen,
                    );
                  });
            },
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: PageStorage(bucket: bucket, child: currentScreen),
      // floating action button which displays the "add"
      // button at the bottom center of the screen
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(208, 33, 243, 1), // button's bg
        hoverColor: redColor, // hover color for the button
        foregroundColor: primaryColor, // text color
        child: const Icon(Icons.add), // icon to display inside the button
        // function to navigate to add post screen
        onPressed: () {
          setState(() {
            currentScreen = const About(); // set the current screen to About()
            currentTab = 3; // set the current open tab to 3 -> add post screen
          });
        },
      ),
      // center the floating action button.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottom navigation bar that holds other navigation buttons
      bottomNavigationBar: BottomAppBar(
        color: Colors.white12, // color of the icons displayed.
        shape:
            const CircularNotchedRectangle(), // creates a notch at the center for the
        // floating action button
        notchMargin: 10, // margin of the notch
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color.fromARGB(203, 131, 200, 235),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        // display news home screen
                        currentScreen = const HomeScreen();
                        currentTab = 0; // set the currently open tab to 0
                      });
                    },
                    child: Icon(
                      Icons.home,

                      // make sure that the selected icon has a white color and other icons
                      // have a grey color. The primary and secondary colors might change
                      // the future
                      color: currentTab == 0 ? primaryColor : secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        // display search screen
                        currentScreen = const SearchScreen();
                        currentTab = 1; // set the currently open tab to 1
                      });
                    },
                    child: Icon(
                      Icons.search,
                      // make sure that the selected icon has a white color and other icons
                      // have a grey color. The primary and secondary colors might change
                      // the future
                      color: currentTab == 1 ? primaryColor : secondaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        // display notifications screen
                        currentScreen = const NotificationsScreens();
                        currentTab = 2; // set the currently open tab to 2
                      });
                    },
                    child: Icon(
                      Icons.notifications,
                      // make sure that the selected icon has a white color and other icons
                      // have a grey color. The primary and secondary colors might change
                      // the future
                      color: currentTab == 2 ? primaryColor : secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        // display profile screen
                        currentScreen = const AdminsProfile();
                        currentTab = 4; // set the currently open tab to 4
                      });
                    },
                    child: Icon(
                      Icons.person,
                      // make sure that the selected icon has a white color and other icons
                      // have a grey color. The primary and secondary colors might change
                      // the future
                      color: currentTab == 4 ? primaryColor : secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
