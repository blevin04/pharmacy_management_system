import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/screens/about.dart';
import 'package:pharmacy_management_system/widget/DrugsWidgets/drugs_table.dart';
import 'package:pharmacy_management_system/widget/homeWidgets/copyright.dart';
import 'package:pharmacy_management_system/widget/homeWidgets/sales_person.dart';

import '../utils/colors.dart';
import '../widget/homeWidgets/best_selling_products.dart';
import '../widget/homeWidgets/current_month_sales.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // variables
  var buttonCardWidth = 180.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 120.0,
            color: Colors.transparent,
            child: const Center(
              child: Text(
                "Home Page",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DrugsTable()));
                    },
                    child: Container(
                      height: 100.0,
                      width: buttonCardWidth,
                      decoration:
                          const BoxDecoration(gradient: drugsAddedColors),
                      child: const Center(
                        child: Text(
                          "Drugs added",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 100.0,
                      width: buttonCardWidth,
                      decoration: const BoxDecoration(
                          gradient: lowStockDrugsGradientColors),
                      child: const Center(
                        child: Text(
                          "Low stock drugs",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 100.0,
                      width: buttonCardWidth,
                      decoration: const BoxDecoration(
                          gradient: expiredProductsGradientColors),
                      child: const Center(
                        child: Text(
                          "Expired Products",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 100.0,
                      width: buttonCardWidth,
                      decoration: const BoxDecoration(
                          gradient: totalSalesMadeGradientColors),
                      child: const Center(
                        child: Text(
                          "Total sales made",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 5),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 100.0,
                      width: buttonCardWidth,
                      decoration: const BoxDecoration(
                          gradient: profitCurrentMonthGradientColors),
                      child: const Center(
                        child: Text(
                          "Profit current month",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 100.0,
                      width: buttonCardWidth,
                      decoration: const BoxDecoration(
                          gradient: lowStockDrugsGradientColors),
                      child: const Center(
                        child: Text(
                          "Total profit made",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const About(),
                        ),
                      );
                    },
                    child: Container(
                      height: 100.0,
                      width: buttonCardWidth,
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Center(
                        child: Text(
                          "About software",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Log Out"),
                              content: const Text(
                                  "Are you sure you want to log out"),
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
                    child: Container(
                      height: 100.0,
                      width: buttonCardWidth,
                      decoration: const BoxDecoration(color: Colors.black),
                      child: const Center(
                        child: Text(
                          "Log out",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
          ),

          const SizedBox(
            height: 24.0,
          ),

          const Divider(
            indent: 40.0,
            endIndent: 40.0,
          ),

          const SizedBox(
            height: 24.0,
          ),

          // sales person charts
          const SalesCharts(),

          const BestSellingProducts(),

          const CurrentMonthSales(),

          const Copyright(),
        ],
      ),
    );
  }
}
