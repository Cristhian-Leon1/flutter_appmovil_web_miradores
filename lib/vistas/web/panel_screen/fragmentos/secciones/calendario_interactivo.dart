import 'package:flutter/material.dart';

class CalendarioInteractivo extends StatelessWidget {
  const CalendarioInteractivo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(child: Text('Aqui va el calendario')),
    );
  }
}
