import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Software"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(32.0),
          child: SizedBox(height: 200.0,
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    //Software name
                    Text(
                      "Pharmacy Management System",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
          
                    SizedBox(
                      height: 20.0,
                    ),
          
                    Text("Software version : 1.0.0"),
          
                     SizedBox(
                      height: 20.0,
                    ),
                    // software developer
                    Text("Software build and owned by Dev Kyan"),
          
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
