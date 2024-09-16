import '../modelos/mirador_modelo.dart';
import '../servicios/mirador_service.dart';
import 'package:flutter/material.dart';

class MiradoresFragmentoProvider with ChangeNotifier {
  List<MiradorModel> _miradores = [];
  final MiradorService _miradorService = MiradorService();

  List<MiradorModel> get miradores => _miradores;

  Future<void> cargarMiradores() async {
    _miradores = await _miradorService.obtenerMiradores();
    notifyListeners();
  }
}