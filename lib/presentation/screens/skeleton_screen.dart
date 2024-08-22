import 'package:flutter/material.dart';
import 'package:real_diploma/presentation/widgets/bottom_nav_bar.dart';

import 'home_screen.dart';
import 'profile_screen.dart';
import 'training_mode/training_home.dart';
import 'vocabulary_screen.dart';

class SkeletonScreen extends StatefulWidget {
  static String routeName = '/main_screen';

  const SkeletonScreen({Key? key}) : super(key: key);

  @override
  State<SkeletonScreen> createState() => _SkeletonScreenState();
}

class _SkeletonScreenState extends State<SkeletonScreen> {
  int _selectedIndex = 0;

  late final _screens = <Widget>[
    HomeScreen(),
    VocabularyScreen(),
    const TrainingHome(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
