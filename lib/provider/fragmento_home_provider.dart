import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../servicios/mirador_service.dart';
import 'iniciar_sesion_provider.dart';

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

  Future<List<String>> obtenerOfertasLaborales(BuildContext context) async {
    final sesionProvider = Provider.of<IniciarSesionProvider>(context, listen: false);
    return await _miradorService.obtenerOfertasLaborales(sesionProvider.usuario.id);
  }
}