import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/provider/iniciar_sesion_provider.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/fragmentos/secciones/seleccion_opciones_perfil.dart';

import '../../../../provider/panel_perfil_provider.dart';
import '../../../web/panel_screen/fragmentos/secciones/formulario_perfil.dart';

class PerfilFragmento extends StatelessWidget {
  const PerfilFragmento({super.key});

  @override
  Widget build(BuildContext context) {
    final sesionProvider = Provider.of<IniciarSesionProvider>(context);
    final perfilProvider = Provider.of<PerfilProvider>(context);
    final usuario = sesionProvider.usuario;

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'PERFIL',
                style: GoogleFonts.inter(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              usuario.image == '' || usuario.image == null
              ? const Icon(Icons.person_2_outlined, size: 100)
              : CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(usuario.image)
              ),
              const SizedBox(height: 15),
              Text(
                usuario.name == '' || usuario.name.isEmpty
                ? 'Nombre del usuario'
                : usuario.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
            child: perfilProvider.selectedOption == 0
            ? const SeleccionOpcionesPerfil()
            : const FormularioPerfil()
          )
        ),
      ],
    );
  }
}
