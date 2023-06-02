import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'training_mode/training_home.dart';
import 'vocabulary_screen.dart';

class BottomNavBarController extends StatefulWidget {
  static String routeName = '/main_screen';

  const BottomNavBarController({Key? key}) : super(key: key);

  @override
  State<BottomNavBarController> createState() => _BottomNavBarControllerState();
}

class _BottomNavBarControllerState extends State<BottomNavBarController> {
  int _selectedIndex = 0;

  late final _screens = <Widget>[
    const HomeScreen(),
    // VocabularyScreen(),
    const TrainingHome(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
