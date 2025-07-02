import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About App'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Help & Feedback'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
