import 'package:flutter/material.dart';
import 'package:pueblito_viajero/vistas/android/home/fragmentos/secciones/mirador_contacto.dart';
import 'package:pueblito_viajero/vistas/android/home/fragmentos/secciones/mirador_horario.dart';
import 'package:pueblito_viajero/vistas/android/home/fragmentos/secciones/mirador_mapa.dart';
import 'package:pueblito_viajero/vistas/android/home/fragmentos/secciones/mirador_servicios.dart';
import 'package:pueblito_viajero/vistas/android/home/fragmentos/secciones/mirador_titulo_slider_descripcion.dart';
import '../../../../../modelos/mirador_modelo.dart';

class InformacionMirador extends StatelessWidget {
  final MiradorModel mirador;

  const InformacionMirador({required this.mirador, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: MiradorTituloSliderDescripcion(mirador: mirador),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MiradorContacto(mirador: mirador),
                    const MiradorMapa(),
                    MiradorHorario(mirador: mirador),
                    MiradorServicios(mirador: mirador)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
