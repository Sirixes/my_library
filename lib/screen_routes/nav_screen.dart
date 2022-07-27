import 'package:flutter/material.dart';
import 'package:my_library/screen_routes/my_area.dart';
import 'package:my_library/screen_routes/search_screen.dart';
import 'package:my_library/widgets/snack_bar_page.dart';

import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const MyArea()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'My Area')
        ],
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: _onItemTapped,
      ),
    );
  }

  //Function for tap on bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  
}
