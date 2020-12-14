import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCatalogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'Catalogs',
            style: GoogleFonts.dmSans(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
