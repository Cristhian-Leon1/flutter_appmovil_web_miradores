import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/fragmentos/secciones/calendario_interactivo.dart';

class EventosFragmento extends StatelessWidget {
  const EventosFragmento({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'PRÓXIMOS EVENTOS',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.inter(
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: CalendarioInteractivo(),
          ),
        ),
      ]
    );
  }
}
