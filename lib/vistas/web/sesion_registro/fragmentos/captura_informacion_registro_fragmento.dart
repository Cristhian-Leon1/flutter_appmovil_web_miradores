import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/provider/screen_registro_provider.dart';
import 'package:pueblito_viajero/vistas/android/crear_cuenta/widgets/textfield_personalizable.dart';

import '../../../../provider/screen_iniciar_sesion_provider.dart';
import '../../../android/iniciar_sesion/widgets/textfield_contrasenia.dart';

class CapturaInformacionRegistroFragmento extends StatelessWidget {
  const CapturaInformacionRegistroFragmento({super.key});

  @override
  Widget build(BuildContext context) {
    final registroProvider = Provider.of<RegistroProvider>(context);
    final sesionProvider = Provider.of<IniciarSesionProvider>(context);

    return Column(
      children: [
        TextFieldPersonalizable(
          labelText: 'Nombre:',
          hintText: 'Nombre',
          icon: Icons.person_2_outlined,
          controller: registroProvider.nameController,
          keyboard: 'name',
          focusNode: registroProvider.nameFocusNode,
          type: '1',
        ),
        const SizedBox(height: 20),
        TextFieldPersonalizable(
          labelText: 'Correo:',
          hintText: 'Correo electrónico',
          icon: Icons.mail_outline_rounded,
          controller: registroProvider.emailController,
          keyboard: 'email',
          focusNode: registroProvider.emailFocusNode,
          type: '1',
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contraseña:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CustomPasswordField(
              controller: registroProvider.passwordController,
              focusNode: registroProvider.passwordFocusNode,
              onToggleVisibility: () {
                sesionProvider.togglePasswordVisibility();
              },
            ),
          ],
        ),

      ],
    );
  }
}