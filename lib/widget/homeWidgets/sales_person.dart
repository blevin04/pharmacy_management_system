import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesCharts extends StatelessWidget {
  const SalesCharts({super.key});

  @override
  Widget build(BuildContext context) {
    double w;
    if (kIsWeb) {
      w = (MediaQuery.of(context).size.width - 300) / 2;
      //   h = (MediaQuery.of(context).size.width - 300) / 2;
    } else {
      w = (MediaQuery.of(context).size.width) - 50;
      //  h = (MediaQuery.of(context).size.width) - 50;
    }
    return Container(
      margin: const EdgeInsets.all(16.0),
      //width: MediaQuery.of(context).size.width - 180,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: w,
              //height: h,
              child: const Card(
                elevation: 6.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      Text(
                        "Sales Person Chart",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      Center(child: SfCartesianChart()),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: w,
              // height: h,
              child: const Card(
                elevation: 6.0,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Sales Person Chart",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      Center(child: SfCartesianChart()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
