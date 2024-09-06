import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/custom/custom_colors.dart';

class CardBarraSuperior extends StatelessWidget {
  const CardBarraSuperior({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:AppColors.azulClaro,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Center(
                  child: Image.asset('assets/logo.png', height: 65),
                )
            ),
            Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    'PANEL ADMINISTRATIVO',
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: 1,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
            const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          Icons.menu_outlined,
                          size: 37,
                          color: AppColors.amarilloSupernova
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
