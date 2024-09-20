import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/custom/custom_colors.dart';

class MiradorMapa extends StatelessWidget {
  const MiradorMapa({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Card(
            color: AppColors.verdeDivertido,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  'Mapa',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 2.3,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.verdeDivertido,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
