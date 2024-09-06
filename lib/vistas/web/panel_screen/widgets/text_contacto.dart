import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueblito_viajero/vistas/web/panel_screen/widgets/textfield_mirador.dart';

import '../../../../provider/panel_mirador_provider.dart';

class TextContacto extends StatelessWidget {
  final String label;
  final int id;
  const TextContacto({super.key, required this.label, required this.id});

  @override
  Widget build(BuildContext context) {
    final miradorProvider = Provider.of<PanelMiradorProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        id == 1
        ? miradorProvider.contactoEdit
          ? Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            child: TextFieldNombreMirador(
            hintText: 'Dirección',
            controller: miradorProvider.addressController,
            focusNode: miradorProvider.addressFocusNode,
            keyboardType: TextInputType.text,
            ),
          )
          : Text(
            miradorProvider.mirador.address.isEmpty
            ? 'Dirección del mirador.'
            : miradorProvider.mirador.address,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
          ),
        )
      : id == 2
      ? miradorProvider.contactoEdit
        ? Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: TextFieldNombreMirador(
            hintText: 'Celular', 
            controller: miradorProvider.phoneController,
            focusNode: miradorProvider.phoneFocusNode,
            keyboardType: TextInputType.text,
          ),
        )
        : Text(
          miradorProvider.mirador.phone.isEmpty
          ? 'Celular de contacto.'
          : miradorProvider.mirador.phone,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )
      : id == 3
      ? miradorProvider.contactoEdit
        ? Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: TextFieldNombreMirador(
            hintText: 'Correo electrónico',
            controller: miradorProvider.emailController,
            focusNode: miradorProvider.emailFocusNode,
            keyboardType: TextInputType.text,
          ),
        )
        : Text(
          miradorProvider.mirador.email.isEmpty
          ? 'Correo electrónico.'
          : miradorProvider.mirador.email,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )
      : id == 4
      ? miradorProvider.contactoEdit
        ? Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: TextFieldNombreMirador(
            hintText: 'Instagram',
            controller: miradorProvider.instagramController,
            focusNode: miradorProvider.instagramFocusNode,
            keyboardType: TextInputType.text,
          ),
        )
        : Text(
          miradorProvider.mirador.instagram.isEmpty
          ? 'Instagram.'
          : miradorProvider.mirador.instagram,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )
      : id == 5
      ? miradorProvider.contactoEdit
        ? Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: TextFieldNombreMirador(
            hintText: 'Facebook',
            controller: miradorProvider.facebookController,
            focusNode: miradorProvider.facebookFocusNode,
            keyboardType: TextInputType.text,
          ),
        )
        : Text(
          miradorProvider.mirador.facebook.isEmpty
          ? 'Facebook.'
          : miradorProvider.mirador.facebook,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )
      : const SizedBox(),
      ],
    );
  }
}
