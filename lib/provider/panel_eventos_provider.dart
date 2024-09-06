import 'package:flutter/material.dart';
import 'package:pueblito_viajero/modelos/evento_modelo.dart';

import '../utils/funciones/funcion_galeria_modelo.dart';

class EventosProvider with ChangeNotifier {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController horaController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();

  final FocusNode nombreFocusNode = FocusNode();
  final FocusNode precioFocusNode = FocusNode();
  final FocusNode horaFocusNode = FocusNode();
  final FocusNode descripcionFocusNode = FocusNode();

  final ImagePickerService _imagePickerService = ImagePickerService();

  EventoModel evento = EventoModel(
    nombre: '',
    precio: 0,
    hora: '',
    descripcion: '',
  );

  void agregarValor(TextEditingController controller, String tipo) {
    String valor = controller.text;
    if (valor.isNotEmpty) {
      switch (tipo) {
        case 'nombre':
          evento.actualizarNombre(valor);
          break;
        case 'precio':
          evento.actualizarPrecio(valor as double);
          break;
        case 'hora':
          evento.actualizarHora(valor);
          break;
        case 'descripcion':
          evento.actualizarDescripcion(valor);
      }
      controller.clear();
    }
  }

  Future<void> pickImageFromGallery() async {
    await _imagePickerService.pickImageFromGallery(evento);
    notifyListeners();
  }
}