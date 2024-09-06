import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/provider/panel_mirador_provider.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/widgets/card_meses.dart';
import 'package:pueblito_viajero/vistas/widgets/grafica.dart';
import 'package:pueblito_viajero/vistas/widgets/grafica_pie.dart';

import '../../../../utils/custom/custom_colors.dart';

class PanelCentralFragmento extends StatelessWidget {
  const PanelCentralFragmento({super.key});

  @override
  Widget build(BuildContext context) {
    final miradorProvider = Provider.of<PanelMiradorProvider>(context);
    final image = miradorProvider.imagenUrl;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Center(
                          child: image == ''
                          ? const Icon(Icons.account_balance_rounded, color: AppColors.azulClaro, size: 120)
                          : Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.azulClaro,
                                width: 4.0,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.network(image, fit: BoxFit.cover),
                            ),
                          ),
                        )
                    ),
                    const Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'NOMBRE DE MIRADOR',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: screenWidth >= 730
            ? const Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: CardMeses(text: 'Enero')),
                      Expanded(child: CardMeses(text: 'Febrero')),
                      Expanded(child: CardMeses(text: 'Marzo')),
                      Expanded(child: CardMeses(text: 'Abril')),
                      Expanded(child: CardMeses(text: 'Mayo')),
                      Expanded(child: CardMeses(text: 'Junio')),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: CardMeses(text: 'Julio')),
                      Expanded(child: CardMeses(text: 'Agosto')),
                      Expanded(child: CardMeses(text: 'Septiembre')),
                      Expanded(child: CardMeses(text: 'Octubre')),
                      Expanded(child: CardMeses(text: 'Noviembre')),
                      Expanded(child: CardMeses(text: 'Diciembre')),
                    ],
                  ),
                ),
              ],
            )
            : const Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: CardMeses(text: 'Enero')),
                      Expanded(child: CardMeses(text: 'Febrero')),
                      Expanded(child: CardMeses(text: 'Marzo')),
                      Expanded(child: CardMeses(text: 'Abril')),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: CardMeses(text: 'Mayo')),
                      Expanded(child: CardMeses(text: 'Junio')),
                      Expanded(child: CardMeses(text: 'Julio')),
                      Expanded(child: CardMeses(text: 'Agosto')),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: CardMeses(text: 'Septiembre')),
                      Expanded(child: CardMeses(text: 'Octubre')),
                      Expanded(child: CardMeses(text: 'Noviembre')),
                      Expanded(child: CardMeses(text: 'Diciembre')),
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
        Expanded(
          flex: 2,
          child: screenWidth >= 730
          ? Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(child: Grafica()),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(child: GraficaPie()),
                  ),
                ),
              ),
            ],
          )
          : Padding(
            padding: const EdgeInsets.all(3),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: Grafica()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: GraficaPie()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ],
    );
  }
}
