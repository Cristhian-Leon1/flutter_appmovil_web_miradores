import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../servicios/mirador_service.dart';
class HomeProvider with ChangeNotifier {
  int screens = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final MiradorService _miradorService = MiradorService();

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

  Future<List<String>> obtenerOfertasLaborales() async {
    return await _miradorService.obtenerOfertasLaborales();
  }
}