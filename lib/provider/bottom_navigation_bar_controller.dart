import 'package:flutter/widgets.dart';

class BottomNavigationBarController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex({required int index}) {
    _selectedIndex = index;
    print("SELECTED INDEX : ${_selectedIndex}");
    notifyListeners();
  }
}
