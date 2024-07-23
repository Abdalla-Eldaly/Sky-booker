import 'package:flutter/material.dart';
import 'package:sky_booker/presentation/favourite_screen/view/favourite_view.dart';
import 'package:sky_booker/presentation/profile_screen/view/profile_view.dart';

import '../../home_screen/view/home_viewModel.dart';

class MainLayoutViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  int get selectedIndex => _selectedIndex;
  Widget get currentScreen => _screens[_selectedIndex];

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
