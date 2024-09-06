import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/panel_perfil_provider.dart';

class SeleccionOpcionesPerfil extends StatelessWidget {
  const SeleccionOpcionesPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final perfilProvider = Provider.of<PerfilProvider>(context);

    return Card(
      elevation: 3,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 8.0),
                        Text('Datos personales'),
                      ],
                    ),
                    onTap: () {
                      perfilProvider.updateSelectedOption(1);
                    }
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock),
                        SizedBox(width: 8.0),
                        Text('Contraseña y seguridad'),
                      ],
                    ),
                    onTap: () {
                      perfilProvider.updateSelectedOption(2);
                    }
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.font_download_outlined),
                        SizedBox(width: 8.0),
                        Text('Tamaño de la letra'),
                      ],
                    ),
                    onTap: () {
                      perfilProvider.updateSelectedOption(3);
                    }
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.policy_outlined),
                        SizedBox(width: 8.0),
                        Text('Política de privacidad'),
                      ],
                    ),
                    onTap: () {
                      perfilProvider.updateSelectedOption(4);
                    }
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.theater_comedy_outlined),
                        SizedBox(width: 8.0),
                        Text('Normas comunitarias'),
                      ],
                    ),
                    onTap: () {
                      perfilProvider.updateSelectedOption(5);
                    }
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
