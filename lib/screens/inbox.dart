import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text('Inbox messages will be displayed here.'),
      ),
    );
  }
}
