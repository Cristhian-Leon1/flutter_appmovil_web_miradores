import 'package:flutter/material.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/fragmentos/secciones/formulario_oferta_laboral.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/fragmentos/secciones/slider_oferta_laboral.dart';

class PanelOfertaLaboral extends StatelessWidget {
  const PanelOfertaLaboral({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: SliderOfertaLaboral()
              ),
              Expanded(
                child: FormularioOfertaLaboral()
              ),
            ],
          )
        ),
      ],
    );
  }
}
