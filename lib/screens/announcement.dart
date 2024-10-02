import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcement Details'),
        backgroundColor: Colors.redAccent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Full announcement details will be shown here.',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
