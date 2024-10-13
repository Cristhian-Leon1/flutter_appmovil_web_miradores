import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/fragmentos/secciones/formulario_oferta_laboral.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/fragmentos/secciones/slider_oferta_laboral.dart';

import '../../../../provider/panel_oferta_laboral_provider.dart';
import '../../../../utils/custom/custom_colors.dart';

class PanelOfertaLaboral extends StatelessWidget {
  const PanelOfertaLaboral({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OfertaLaboralProvider(context),
      child: const Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: SliderOfertaLaboral()
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CardMensajeGuia()
                      ),
                      Expanded(
                        flex: 5,
                          child: FormularioOfertaLaboral()
                      ),
                    ],
                  )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}

class CardMensajeGuia extends StatelessWidget {
  const CardMensajeGuia({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColors.gris,
      child: const Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              'En esta sección podrás publicar ofertas laborales para tu empresa, carga una imagen con toda la información necesaria para que los interesados puedan postularse.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      )
    );
  }
}