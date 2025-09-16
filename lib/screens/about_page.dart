import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About This App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: const [
            SizedBox(height: 20),
            Center(
              child: Icon(
                Icons.pets,
                size: 80,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Bird Guide App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This app is designed to assist bird watchers and enthusiasts by helping them identify bird species using photos, explore detailed bird information, and promote awareness about birdlife conservation.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Key Features:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Bird identification using AI and images'),
            Text('• Detailed bird profiles with habitat, range, and diet'),
            Text('• Educational guide for beginners and experts alike'),
            SizedBox(height: 20),
            Text(
              'Credits:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Built by:'),
            Text(
              'Ryan Roy & Jatin Saraogi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Students of MCA,\nDepartment of MCA, RV College of Engineering, Bengaluru'),
            SizedBox(height: 20),
            Divider(),
            Text(
              'Version: 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '© 2025 All rights reserved.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
