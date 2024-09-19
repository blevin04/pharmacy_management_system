import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Profile info of the owner of a pharmacy

class AdminsProfile extends StatefulWidget {
  const AdminsProfile({super.key});

  @override
  State<AdminsProfile> createState() => _AdminsProfileState();
}

class _AdminsProfileState extends State<AdminsProfile> {
  // firebase
  final FirebaseAuth _auth = FirebaseAuth.instance; // auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // firestore
  @override
  Widget build(BuildContext context) {

    // dimensions
    var screenHeight = MediaQuery.of(context).size.height; // full screen height 
    var screenWidth = double.infinity; // full screen width

    // uid of the user who is currently logged in
    String loggedInUserUID = _auth.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin's Profile"),
        centerTitle: true, // center title for all devices
      ),
      // fetch admin's profile data using StreamBuilder() widget
      body: StreamBuilder(
        stream: _firestore.collection("users").doc(loggedInUserUID).snapshots(),
        builder: (context, adminsProfileSnapshot) {
          // before the data loads from the database,
          // display a circular progress indicator to
          // avoid displaying an error message on the 
          // screen.
          if(adminsProfileSnapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          // details of the user
          // email of the user
          String email = adminsProfileSnapshot.data!.data()!['email'];
          // user full name
          String fullName = adminsProfileSnapshot.data!.data()!['fullName'];
          // Phone
          String phone = adminsProfileSnapshot.data!.data()!['phone'];
          // user title
          String userTitle = adminsProfileSnapshot.data!.data()!['userTitle'];
          // user ID NUMBER
          String idNumber = adminsProfileSnapshot.data!.data()!['idNumber'];
          // age
          String age = adminsProfileSnapshot.data!.data()!['age'];

          return Container(
            height: screenHeight, // full height of the screen
            width: screenWidth, // full width of the screen
            color: Colors.grey, // color of the whole screen 
            child: Container(
              color: Colors.white, // color of the container that holds the profile info
              width: screenWidth / 2.0,
              padding: const EdgeInsets.all(32.0),
              margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: ListView(
                children: [
                  ListTile(
                    leading: const Text("Full Name: "),
                    title: Text(fullName, overflow: TextOverflow.ellipsis,),
                  ),
                  ListTile(
                    leading: const Text("Phone Number: "),
                    title: Text(phone),
                  ),
                  ListTile(
                    leading: const Text("Email: "),
                    title: Text(email, overflow: TextOverflow.ellipsis,),
                  ),
                   ListTile(
                    leading: const Text("ID Number: "),
                    title: Text(idNumber, overflow: TextOverflow.ellipsis,),
                  ),
                  ListTile(
                    leading: const Text("Title: "),
                    title: Text(userTitle),
                  ),
                  ListTile(
                    leading: const Text("Age: "),
                    title: Text(age),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}