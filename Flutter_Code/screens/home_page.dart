import 'package:flutter/material.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF81C784), Color(0xFF4CAF50)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(Icons.flutter_dash, color: Colors.white, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'Bird Identifier',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              
              // Main Content
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Discover Birds Around You',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Identify birds by photo or sound using AI',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 30),
                        
                        // Quick Action Cards
                        Row(
                          children: [
                            Expanded(
                              child: _buildQuickActionCard(
                                context,
                                'Take Photo',
                                Icons.camera_alt,
                                Color(0xFF42A5F5),
                                () => _navigateToPage(context, 1),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: _buildQuickActionCard(
                                context,
                                'Record Sound',
                                Icons.mic,
                                Color(0xFFEF5350),
                                () => _navigateToPage(context, 2),
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 30),
                        
                        // Recent Identifications
                        Text(
                          'Recent Identifications',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 15),
                        
                        Expanded(
                          child: ListView(
                            children: [
                              _buildRecentCard('Robin', 'Turdus migratorius', '2 hours ago'),
                              _buildRecentCard('Blue Jay', 'Cyanocitta cristata', 'Yesterday'),
                              _buildRecentCard('Cardinal', 'Cardinalis cardinalis', '3 days ago'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentCard(String name, String scientific, String time) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green[100],
          child: Icon(Icons.flutter_dash, color: Colors.green),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(scientific),
        trailing: Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to page $index')),
    );
  }
}

