import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

// Import your screens
import '../screens/home_page.dart';
import '../pages/predict_page.dart'; // PredictScreen
import '../screens/bird_guide_page.dart';
import '../screens/settings_page.dart';
import '../pages/map_page.dart'; // Import your MapPage

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _pages(BuildContext context) => [
        const HomePage(),
        const PredictScreen(),
        const BirdsScreen(),
        // Remove SettingsPage from bottom nav tabs
      ];

  final List<String> _titles = [
    'Home',
    'Discover Birds',
    'Bird Guide',
    // Removed 'Settings' title because it's now in app bar button
  ];

  @override
  Widget build(BuildContext context) {
    // Settings access is via app bar now, so always show location icon for other tabs
    bool showLocationIcon = _selectedIndex != 4; // this check can be simplified, now no index 4

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on_outlined),
            tooltip: 'Select Location',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MapPage()),
              );
            },
          ),
          // Add Settings icon button here:
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
        ],
        backgroundColor: Colors.green.shade700,
      ),
      body: _pages(context)[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        backgroundColor: Colors.green.shade700,
        iconSize: 26,
        animationDuration: const Duration(milliseconds: 350),
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.photo_camera, color: Colors.white),
            title:
                const Text('Discover Birds', style: TextStyle(color: Colors.white)),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.menu_book, color: Colors.white),
            title: const Text('Bird Guide', style: TextStyle(color: Colors.white)),
          ),
          // Settings tab removed from bottom nav bar
        ],
      ),
    );
  }
}
