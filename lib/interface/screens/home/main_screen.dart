import 'package:alse/configuration/app_colors.dart';
import 'package:alse/interface/screens/home/home_screen.dart';
import 'package:alse/interface/screens/learning/category_screen.dart';
import 'package:alse/interface/screens/level/level_screen.dart';
import 'package:alse/interface/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const name = 'main-screen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    LevelScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   automaticallyImplyLeading: false,
      // ),
      body: _screens[_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColor,
          selectedItemColor: AppColors.selectedItem,
          unselectedItemColor: AppColors.tertiaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.psychology),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ]),
      )
    );
  }
}
