import 'package:flutter/material.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/fragmentos/secciones/calendario_interactivo.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/fragmentos/secciones/formulario_eventos.dart';

class PanelEventos extends StatelessWidget {
  const PanelEventos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          flex: 10,
          child: Row(
            children: [
              Expanded(
                child: CalendarioInteractivo()
              ),
              Expanded(
                child: FormularioEventos()
              ),
            ],
          )
        ),
      ],
    );
  }
}
