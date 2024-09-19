import 'package:flutter/material.dart';

import '../widget/notificationsWidgets/notifications_modal.dart';

class NotificationsScreens extends StatelessWidget {
  const NotificationsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    // dimensions
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = double.infinity;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: false,
      ),
      body: Container(
        height: screenHeight, // full height of the screen
        width: screenWidth, // full width of the screen
        color: Colors.grey, // color of the whole screen
        child: Container(
          color: const Color.fromARGB(255, 194, 103,
              103), // color of the container that holds the profile info
          width: screenWidth / 2.0,
          padding: const EdgeInsets.all(32.0),
          margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
          // Notification list appears here
          child: ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(content: NotificationsModal());
                  });
            },
            leading: const Icon(Icons.notifications),
            title: const Text("Panadol Extra expiry date reached!"),
          ),
        ),
      ),
    );
  }
}
