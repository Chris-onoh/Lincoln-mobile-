import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Results'),
        backgroundColor: Colors.redAccent,
      ),
      body: _buildResultsList(),
    );
  }

  Widget _buildResultsList() {
    // Example student results data
    final List<Map<String, String>> studentResults = [
      {'subject': 'Mathematics', 'grade': 'A+'},
      {'subject': 'Science', 'grade': 'A'},
      {'subject': 'History', 'grade': 'B+'},
      {'subject': 'English', 'grade': 'A-'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: studentResults.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildResultCard(studentResults[index]);
      },
    );
  }

  Widget _buildResultCard(Map<String, String> result) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4.0,
      child: ListTile(
        title: Text(
          result['subject'] ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        trailing: Text(
          result['grade'] ?? '',
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
