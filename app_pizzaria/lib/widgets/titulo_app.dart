import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class titulo_app extends StatelessWidget {
  final String titulo;
  final TextAlign? textAlign;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  titulo_app(this.titulo, {this.textAlign,});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
