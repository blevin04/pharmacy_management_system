import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BestSellingProducts extends StatefulWidget {
  const BestSellingProducts({super.key});

  @override
  State<BestSellingProducts> createState() => _BestSellingProductsState();
}

class _BestSellingProductsState extends State<BestSellingProducts> {
  @override
  Widget build(BuildContext context) {
    // dimensions
    double screenWidth;
    if (kIsWeb) {
      screenWidth = MediaQuery.of(context).size.width - 180;
    } else {
      screenWidth = MediaQuery.of(context).size.width - 60;
    }
    // full screen width
    return Card(
      margin: const EdgeInsets.all(32.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          color: Colors.white,
          // height: 300.0,
          width: screenWidth,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top 5 Best Selling Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Divider(
                height: 12.0,
              ),
              Center(child: SfCartesianChart()),
              SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
