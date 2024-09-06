import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/vistas/widgets/boton_personalizable.dart';

import '../../../../../provider/panel_oferta_laboral_provider.dart';
import '../../../../../utils/custom/custom_colors.dart';

class FormularioOfertaLaboral extends StatelessWidget {
  const FormularioOfertaLaboral({super.key});

  @override
  Widget build(BuildContext context) {
    final ofertaProvider = Provider.of<OfertaLaboralProvider>(context);
    var image = ofertaProvider.image;

    return Card(
      color: Colors.grey[300],
      elevation: 3,
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: image == null
              ? const Icon(
                Icons.post_add_outlined,
                color: AppColors.azulClaro,
                size: 200
              )
              : Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: AppColors.azulClaro,
                    width: 4.0,
                  ),
                ),
                child: ClipRect(
                  child: Image.memory(image as Uint8List, fit: BoxFit.cover)
                ),
              ),
            )
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: BotonComun(
                      color: AppColors.azulClaro,
                      text: 'Cargar imagen',
                      onPressed: (){
                        ofertaProvider.pickImageFromGallery();
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: BotonComun(
                      color: AppColors.azulClaro,
                      text: 'Actualizar oferta',
                      onPressed: (){
              
                      }
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
