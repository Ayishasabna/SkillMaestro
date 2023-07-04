import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget({
    super.key,
    required this.title,
    required this.thick,
    required this.textcolor,
    required this.fontsize,
  });
  final String title;
  final FontWeight thick;
  final Color textcolor;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.poppins(
          fontWeight: thick,
          color: textcolor,
          fontSize: fontsize,
        ));
  }
}
