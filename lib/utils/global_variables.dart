import 'package:firebase_auth/firebase_auth.dart';

import 'package:pharmacy_management_system/screens/about.dart';
import 'package:pharmacy_management_system/screens/admins_profile_screen.dart';
import 'package:pharmacy_management_system/screens/home_screen.dart';
import 'package:pharmacy_management_system/screens/notifications_screen.dart';

import '../screens/search/search_screen.dart';

// uid of the logged in user
String currentUserUid = FirebaseAuth.instance.currentUser!.uid;

// uid of the company
String companysId = "";

// name of the product|company name|name of the app.
String appName = "Pharmacy";

// default name displayed to users when the users they wanna view
// have blocked them. Normally displayed on the message screen.
String defaultUserName = "$appName user";

// app version
String appVersion = "1.0.0";

// items displayed on the bottom navigation bar of the home screen
var navigationItems = [
  const HomeScreen(), // home screen
  const SearchScreen(), // search screen
  const About(), // about
  const NotificationsScreens(), // notifications screens
  const AdminsProfile(), // profile screen
];

// dimensions

const webScreenSize =
    800; // the screen size for  web version of this product|app

const subTitlesFontSize =
    16.0; // font used on most sub titles in the product|app
