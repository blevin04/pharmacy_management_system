import 'package:flutter/material.dart';

class UploadWithExcel extends StatefulWidget {
  const UploadWithExcel({super.key});

  @override
  State<UploadWithExcel> createState() => _UploadWithExcelState();
}

class _UploadWithExcelState extends State<UploadWithExcel> {
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: 100.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "UPLOAD WITH EXCEL",
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            const Divider(),
            const Text("Select The Excel File."),
            const SizedBox(
              height: 12.0,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Upload File"),
            ),
          ],
        ),
      ),
    );
  }
}
