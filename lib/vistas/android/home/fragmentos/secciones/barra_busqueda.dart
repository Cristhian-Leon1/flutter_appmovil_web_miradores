import 'package:flutter/material.dart';

import '../../../../../utils/custom/custom_colors.dart';

class BarraBusqueda extends StatelessWidget {
  const BarraBusqueda({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar mirador...',
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          filled: true,
          fillColor: AppColors.verdeDivertido,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.verdeDivertido, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.verdeDivertido, width: 2),
          ),
        ),
      ),
    );
  }
}
