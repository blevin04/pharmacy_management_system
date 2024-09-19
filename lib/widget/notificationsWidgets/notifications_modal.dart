import 'package:flutter/material.dart';

class NotificationsModal extends StatelessWidget {
  const NotificationsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(32.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          color: Colors.white,
          height: 300.0,
          width: MediaQuery.of(context).size.width - 180.0,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Open Notification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Divider(
                height: 12.0,
              ),
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