import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/widget/addWidgets/add_catergory.dart';
import 'package:pharmacy_management_system/widget/homeWidgets/copyright.dart';

import '../widget/addWidgets/add_category_table.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 180.0,
      height: MediaQuery.of(context).size.height,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            AddCategory(),
            AddCategoryTable(),
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
