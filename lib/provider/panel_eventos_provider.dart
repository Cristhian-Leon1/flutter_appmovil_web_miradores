import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/modelos/evento_modelo.dart';

import '../servicios/mirador_service.dart';
import '../utils/funciones/funcion_galeria_modelo.dart';
import 'iniciar_sesion_provider.dart';

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
  final MiradorService _miradorService = MiradorService();

  bool isLoading = false;

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

  Future<void> actualizarEvento(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      final sesionProvider = Provider.of<IniciarSesionProvider>(context, listen: false);

      evento.actualizarNombre(nombreController.text);
      evento.actualizarPrecio(double.parse(precioController.text));
      evento.actualizarHora(horaController.text);
      evento.actualizarDescripcion(descripcionController.text);

      await _miradorService.actualizarEvento(sesionProvider.mirador.userId, evento);
      evento.image = null;
      limpiarCampos();
    } catch (e) {
      print('Error al actualizar evento: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void limpiarCampos() {
    nombreController.clear();
    precioController.clear();
    horaController.clear();
    descripcionController.clear();
  }
}