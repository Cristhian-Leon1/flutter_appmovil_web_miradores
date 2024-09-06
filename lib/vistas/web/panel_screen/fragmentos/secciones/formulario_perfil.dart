import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/utils/custom/custom_colors.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/widgets/text_contacto.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/widgets/textfield_mirador.dart';
import 'package:pueblito_viajero/vistas/widgets/boton_personalizable.dart';

import '../../../../../provider/panel_perfil_provider.dart';

class FormularioPerfil extends StatelessWidget {
  const FormularioPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final perfilProvider = Provider.of<PerfilProvider>(context);

    return Card(
      elevation: 3,
      color: Colors.grey[300],
      child: perfilProvider.selectedOption >= 1 && perfilProvider.selectedOption <= 5
      ? Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child:
              perfilProvider.selectedOption == 1 ?
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldNombreMirador(
                          hintText: 'Nombre',
                          controller: perfilProvider.nameController,
                          focusNode: perfilProvider.nameFocusNode,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 10),
                        TextFieldNombreMirador(
                          hintText: 'Telefono de contacto',
                          controller: perfilProvider.telefonoController,
                          focusNode: perfilProvider.telefonoFocusNode,
                          keyboardType: TextInputType.text,
                        )
                      ],
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BotonComun(
                            color: AppColors.azulClaro,
                            text: 'Actualizar',
                            onPressed: (){}
                          ),
                          BotonComun(
                            color: AppColors.azulClaro,
                            text: 'Cancelar',
                            onPressed: (){
                              perfilProvider.updateSelectedOption(0);
                            }
                          )
                        ],
                      ),
                    )
                  )
                ],
              )
              : perfilProvider.selectedOption == 2 ?
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldNombreMirador(
                          hintText: 'Contraseña',
                          controller: perfilProvider.passwordController,
                          focusNode: perfilProvider.passwordFocusNode,
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BotonComun(
                            color: AppColors.azulClaro,
                            text: 'Actualizar',
                            onPressed: (){}
                          ),
                          BotonComun(
                            color: AppColors.azulClaro,
                            text: 'Cancelar',
                            onPressed: (){
                              perfilProvider.updateSelectedOption(0);
                            }
                          )
                        ],
                      ),
                    )
                  )
                ],
              )
              : perfilProvider.selectedOption == 3 ?
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldNombreMirador(
                          hintText: 'Tamaño letra',
                          controller: perfilProvider.letraController,
                          focusNode: perfilProvider.letraFocusNode,
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BotonComun(
                            color: AppColors.azulClaro,
                            text: 'Actualizar',
                            onPressed: (){}
                          ),
                          BotonComun(
                            color: AppColors.azulClaro,
                            text: 'Cancelar',
                            onPressed: (){
                              perfilProvider.updateSelectedOption(0);
                            }
                          )
                        ],
                      ),
                    )
                  )
                ],
              )
              : perfilProvider.selectedOption == 4 ?
              Column(
                children: [
                  const Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Politicas....')
                        ],
                      )
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BotonComun(
                          color: AppColors.azulClaro,
                          text: 'Regresar',
                          onPressed: (){
                            perfilProvider.updateSelectedOption(0);
                          }
                        )
                      ],
                    )
                  )
                ],
              )
              : perfilProvider.selectedOption == 5 ?
              Column(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Normas Comunitarias....')
                      ],
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BotonComun(
                          color: AppColors.azulClaro,
                          text: 'Regresar',
                          onPressed: (){
                            perfilProvider.updateSelectedOption(0);
                          }
                        )
                      ],
                    )
                  )
                ],
              )
              : const SizedBox(height: 0),
            ),
          ],
        ),
      )
      : const Center(child: SizedBox(height: 0)),
    );
  }
}
