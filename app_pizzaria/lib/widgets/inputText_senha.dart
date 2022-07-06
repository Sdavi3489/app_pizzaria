// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class inputTextSenha extends StatelessWidget {
  final String? placeholder;
  final String? obscureText;
  // ignore: prefer_const_constructors_in_immutables
  inputTextSenha({super.key, this.placeholder,  this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(   
      obscureText: true,
      style: GoogleFonts.inter(
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        // ignore: prefer_const_constructors
        contentPadding: EdgeInsets.all(10),
        labelText: placeholder,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
