import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/provider/fragmento_miradores_provider.dart';
import 'package:pueblito_viajero/provider/iniciar_sesion_provider.dart';
import 'package:pueblito_viajero/vistas/android/home/widgets/card_miradores.dart';

class FavoritosFragmento extends StatelessWidget {
  const FavoritosFragmento({super.key});

  @override
  Widget build(BuildContext context) {
    final sesionProvider = Provider.of<IniciarSesionProvider>(context);
    final miradoresProvider = Provider.of<MiradoresFragmentoProvider>(context);
    final userId = sesionProvider.usuario.id;
    final favoritos = miradoresProvider.obtenerFavoritos(userId);

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'FAVORITOS',
            style: GoogleFonts.inter(
              fontSize: 33,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                return CardMirador(mirador: favoritos[index], tipo: 'user');
              },
            ),
          ),
        ),
      ],
    );
  }
}
