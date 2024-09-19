import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/responsive/mobile_screen_layout.dart';
import 'package:pharmacy_management_system/responsive/responsive.dart';
import 'package:pharmacy_management_system/responsive/web_screen_layout.dart';
import 'package:pharmacy_management_system/utils/global_variables.dart';
import 'screens/AuthScreens/login_screen.dart';
import 'utils/colors.dart';
import 'utils/utils.dart';

/// This is a Pharmacy Management System, build and owned by
/// Simon Kamangaru Munyiri.

void main() async {
  // Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // initialize app for web
  if (kIsWeb) {
    await Firebase.initializeApp(
        name: "pharmacy",
        options: const FirebaseOptions(
            apiKey: "AIzaSyDpE5U8kIoHxWWX7q_SsSTDrr0ywln98n4",
            authDomain: "pharmacy-182b8.firebaseapp.com",
            projectId: "pharmacy-182b8",
            storageBucket: "pharmacy-182b8.appspot.com",
            messagingSenderId: "543124166256",
            appId: "1:543124166256:web:d6edaf47db66aba28bc6b5",
            measurementId: "G-0CJHM34SBY"));
  }
  // initialize app for mobile devices
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBsuW50x-WJ9f0Nxtl_E5FNTYf_jV5AVqA",
          appId: "1:543124166256:android:c7420e381d2ee0758bc6b5",
          messagingSenderId: "543124166256",
          projectId: "pharmacy-182b8"));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      //theme: ThemeData.dark()
      //.copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // check if user logged in
          // If user is logged in, redirect the user to the
          // home screen
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const Responsive(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout());
            } else if (snapshot.hasError) {
              return showSnackBar(context, "${snapshot.error}");
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          // If the user is not logged in,
          // show the login screen so that the user can log in
          // or create a new account
          return const LoginScreen();
        },
      ),
    );
  }
}
