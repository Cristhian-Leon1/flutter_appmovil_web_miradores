import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../modelos/evento_modelo.dart';
import '../../../../provider/iniciar_sesion_provider.dart';
import '../../../../provider/panel_eventos_provider.dart';
import '../../../../utils/custom/custom_colors.dart';

class CardEvento extends StatelessWidget {
  final EventoModel event;

  const CardEvento({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final eventosProvider = Provider.of<EventosProvider>(context);
    final sesionProvider = Provider.of<IniciarSesionProvider>(context, listen: false);

    bool coincidenIds = event.userId == sesionProvider.usuario.id;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Card(
          color: Colors.grey[200],
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (event.image != null)
                          Image.network(event.image!),
                        const SizedBox(height: 10),
                        Text(
                          event.nombre.toUpperCase(),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(event.descripcion, textAlign: TextAlign.center),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Precio: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: event.precio,
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Hora: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: event.hora,
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Fecha: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: event.fecha?.toIso8601String(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (coincidenIds)
                      TextButton(
                        onPressed: () async {
                          await eventosProvider.eliminarEvento(sesionProvider.usuario.id);
                          eventosProvider.clearSelectedEvent();
                        },
                        child: const Text('Eliminar', style: TextStyle(color: AppColors.azulClaro)),
                      ),
                    TextButton(
                      onPressed: () {
                        eventosProvider.clearSelectedEvent();
                      },
                      child: const Text('OK', style: TextStyle(color: AppColors.azulClaro)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}