
import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class Responsive extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const Responsive({super.key, required this.mobileScreenLayout, required this.webScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth < webScreenSize)
      {
        //mobile screen layout
        //works for mobile and small tablet devices
        return mobileScreenLayout;
      }

    // web screen layout
     return webScreenLayout;
    });
  }
}