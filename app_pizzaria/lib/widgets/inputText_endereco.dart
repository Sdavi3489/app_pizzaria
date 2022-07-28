// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_lanchonete/shared_prefs.dart';

// ignore: camel_case_types
class inputTextEndereco extends StatelessWidget {
  final String? placeholder;
  final String? obscureText;
  // ignore: prefer_const_constructors_in_immutables
  inputTextEndereco({super.key, this.placeholder, this.obscureText});
  static final end_controller = TextEditingController();
  LoginController _controler = LoginController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: end_controller,
      obscureText: false,
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
