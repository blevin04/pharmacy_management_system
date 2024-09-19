import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurrentMonthSales extends StatefulWidget {
  const CurrentMonthSales({super.key});

  @override
  State<CurrentMonthSales> createState() => _CurrentMonthSalesState();
}

class _CurrentMonthSalesState extends State<CurrentMonthSales> {
  @override
  Widget build(BuildContext context) {
    double screenwidth;
    if (kIsWeb) {
      screenwidth = MediaQuery.of(context).size.width - 180.0;
    } else {
      screenwidth = MediaQuery.of(context).size.width - 60.0;
    }
    return Card(
      margin: const EdgeInsets.all(32.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          color: Colors.white,
          //  height: 300.0,
          width: screenwidth,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Month Sale",
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
