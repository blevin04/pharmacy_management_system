import 'package:flutter/material.dart';

import '../widget/addWidgets/add_supplier.dart';
import '../widget/addWidgets/suppliers_table.dart';
import '../widget/homeWidgets/copyright.dart';

class AddSupplierScreen extends StatelessWidget {
  const AddSupplierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 180.0,
      height: MediaQuery.of(context).size.height,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            AddSupplier(),
           SuppliersTable(),
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