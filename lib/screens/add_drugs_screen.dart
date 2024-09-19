import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/widget/DrugsWidgets/drugs_table.dart';

import '../widget/DrugsWidgets/add_drugs.dart';

import '../widget/homeWidgets/copyright.dart';

class AddDrugsScreen extends StatelessWidget {
  const AddDrugsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 180.0,
      height: MediaQuery.of(context).size.height,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            AddDrugs(),
            DrugsTable(),
            SizedBox(
              height: 80.0,
            ),
            Copyright(),
          ],
        ),
      ),
    );
  }
}
