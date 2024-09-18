import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeProvider with ChangeNotifier {
  int screens = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  GlobalKey<CurvedNavigationBarState> get bottomNavigationKey => _bottomNavigationKey;

  void cambiarFragmento(int screen) {
    screens = screen;
    notifyListeners();
  }

  void setPage(int index) {
    final state = _bottomNavigationKey.currentState;
    state?.setPage(index);
    screens = index;
    notifyListeners();
  }

  void resetVariables() {
    screens = 0;
    notifyListeners();
  }
}